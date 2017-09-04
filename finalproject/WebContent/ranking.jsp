<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8" import="com.sist.main.model.*"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="model" class="com.sist.main.model.RankingModel"/>
   <%
   	 model.rankingListData(request);
   %> 
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/css.css">
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card-2">
    <a href="#home" class="w3-bar-item w3-button"><b>BR</b> Architects</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      
      <a href="#about" class="w3-bar-item w3-button">회원가입</a>
      <a href="#contact" class="w3-bar-item w3-button">로그인</a>
    </div>
  </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="images/wedding6.jpg" alt="Architecture" width="1500px" height="800">
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
        <a href="#" class="w3-bar-item w3-button">신랑/신부 이용후기</a>
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
  </div>
</div>
</header>
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1300px">

  <!-- Project Section -->
<div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">랭킹</h3>
    
  </div>
<div class="w3-row-padding">

 <div class="w3-row-padding w3-grayscale">
	  <c:forEach var="vo" items="${rList }">
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <a href="main_detail.jsp?mode=1&com_no=${vo.com_no }">
	      <img src="${vo.com_pic }" style="width:100%;height: 195px;"></a>
	      <h3>${vo.com_name }</h3>
	      <p class="w3-opacity" style="height: 50px;">${vo.com_address }</p>
	      <p>${vo.com_rank }</p>
	      <p><a href="main_detail.jsp?mode=1&com_no=${vo.com_no }"><button class="w3-button w3-light-grey w3-block">상세보기</button></a></p>
	     <div class="mar-top"></div>
	    </div>
	   </c:forEach>
    	<div style="height:15px" align=center></div>
            <div style="margin-top:1000px;margin-left:730px;color:black;font-size: 12px">
             <a href="ranking.jsp?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
             <a href="ranking.jsp?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
             ${curpage } page / ${totalpage } pages
            </div>
  
  </div>
  
  </div>
  

</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-16">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>




</body>
</html>