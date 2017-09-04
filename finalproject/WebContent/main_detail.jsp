<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8" import="com.sist.main.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:useBean id="model" class="com.sist.main.model.CompanyModel"/>
<%
	model.companyDetailData(request);
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
    <a href="main.jsp" class="w3-bar-item w3-button">Home</a> 
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
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">상세보기</h3>
    
  </div>

 <div class="w3-row-padding w3-grayscale">
	  
	    <div class="w3-col l3 m6 w3-margin-bottom">
   
	    </div>
	 <table border=0 width=900>
   <tr>
    <td width=450>
      <table id="table_content" width=450>
     <tr>
       <td width=45% align=center rowspan="6">
        <img src="${vo.com_pic }" width="300" height="300">
       </td>
       <th width=55% align=center colspan="2">
        ${vo.com_name }
       </th>
     </tr>
   
 	
     <tr>
       <td width=20% align=right>주 소</td>
       <td width=35% align=left>${vo.com_address }</td>
     </tr>
      <tr>
       <td width=20% align=right>도로명 주소</td>
       <td width=35% align=left>${vo.com_address2 }</td>
     </tr>
     <tr>
       <td width=20% align=right>홀 타입</td>
       <td width=35% align=left>${vo.com_type }</td>
     </tr>
     <tr>
       <td width=20% align=right>메뉴 종류</td>
       <td width=35% align=left>${vo.com_menu }</td>
     </tr>
     <tr>
       <td width=20% align=right>식사 비용</td>
       <td width=35% align=left>${vo.com_meal }</td>
     </tr>
     <tr>
       <td width=20% align=right>보증 인원</td>
       <td width=35% align=left>${vo.com_person }</td>
     </tr>
     <tr>
       <td width=20% align=right>기능행사</td>
       <td width=35% align=left>${vo.com_event }</td>
     </tr>
     <tr>
       <td width=20% align=right>별점</td>
       <td width=35% align=left>${vo.com_star }</td>
     </tr>
   </table>
	  <table id="table_content" width=450>
     <tr>
      <td align=left valign="top" height=200>
      ${vo.com_ckeck }
      </td>
     </tr>
   </table>
    </td>
  </tr>
  </table>
  



</div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-16">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>




</body>
</html>