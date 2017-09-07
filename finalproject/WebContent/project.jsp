<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.change.MainController"/>
<%
	model.controller(request);
%>
<!-- 이게 떠야 됩니다 -->
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/css.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card-2">
    <a href="project.jsp" class="w3-bar-item w3-button"><b>BR</b> Architects</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
     
      <c:if test="${sessionScope.id==null }">
      <a href="project.jsp?mode=2" class="w3-bar-item w3-button">회원가입</a>
      </c:if>
      
       <c:if test="${sessionScope.id==null }">
      <%--<input type=button class="w3-bar-item w3-button" id="logbtn" value=로그인>--%>
      <a href="project.jsp?mode=1" class="w3-bar-item w3-button" id=logbtn>로그인</a>
      </c:if> 
      
      <c:if test="${sessionScope.id!=null }">
      <form method="post" action="member/logout.jsp" id="logout_frm">
      <input type=submit value="로그아웃" class="w3-bar-item w3-button">
      </form>
      </c:if>
    </div>
  </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="images/wedding6.jpg" alt="Architecture" width="1500" height="800">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Wedding</b></span> <span class="w3-hide-small w3-text-light-grey">Peach</span> </h1>
  </div>
<!-- <form id="search" method="get" action="#">
		<input type="text" name="query" placeholder="Search" style="width:80%"/>
		
	</form> -->
   

	<div class="w3-container">
  
  <div class="w3-bar w3-light-grey">
    <a href="project.jsp" class="w3-bar-item w3-button">Home</a> 
     <div class="w3-dropdown-hover">  
      <button class="w3-button">홀정보</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="ranking.jsp" class="w3-bar-item w3-button">랭킹</a>
        <a href="#" class="w3-bar-item w3-button">상담예약</a>
        
      </div>
    </div>
     <div class="w3-dropdown-hover">  
      <button class="w3-button">웨딩홀 검색</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">지도 검색</a>
        <a href="#" class="w3-bar-item w3-button">상세 검색</a>
        
      </div>
    </div>
    <div class="w3-dropdown-hover">  
      <button class="w3-button">견적내기</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">실시간 견적현황</a>
        <a href="#" class="w3-bar-item w3-button">웨딩홀 견적내기</a>
        
      </div>
    </div>
    <div class="w3-dropdown-hover">  
      <button class="w3-button">이용후기</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="project.jsp?mode=200" class="w3-bar-item w3-button">신랑/신부 이용후기</a>
        <a href="#" class="w3-bar-item w3-button">전문가 리뷰</a>
      </div>
    </div>
    <div class="w3-dropdown-hover">  
      <button class="w3-button">게시판</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">공지사항</a>
        <a href="#" class="w3-bar-item w3-button">자유게시판</a>
        <a href="#" class="w3-bar-item w3-button">이벤트게시판</a>
        <a href="#" class="w3-bar-item w3-button">질문게시판</a>
        <a href="#" class="w3-bar-item w3-button">자료실</a>
      </div>
    </div>
    <c:if test="${sessionScope.admin==0 && sessionScope.id!=null}">
    <div class="w3-dropdown-hover">  
      <button class="w3-button">마이페이지</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        
        <a href="project.jsp?mode=105" class="w3-bar-item w3-button">예약페이지</a>
        <a href="project.jsp?mode=104" class="w3-bar-item w3-button">찜목록</a>
        <a href="project.jsp?mode=3" class="w3-bar-item w3-button">회원정보수정/탈퇴</a>

     </div>
    </div>
    </c:if>
    <c:if test="${sessionScope.admin==1 && sessionScope.id!=null}">
    <div class="w3-dropdown-hover">  
      <button class="w3-button">관리페이지</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="project.jsp?mode=5" class="w3-bar-item w3-button">회원관리</a>
        
      </div>
    </div>
    </c:if>
  </div>
</div>
</header>
<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width:1300px">
<!-- Project Section -->
      <jsp:include page="${main_jsp }"></jsp:include>  
    
<!-- End page content -->
</div>
<!-- Footer -->
<footer class="w3-center w3-black w3-padding-16">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>
</body>
</html>