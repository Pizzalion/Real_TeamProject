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
<script>
// Script to open and close sidebar when on tablets and phones
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Slideshow Apartment Images
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>

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
<div class="w3-content w3-padding" style="max-width:1300px; ">

  <!-- Project Section -->
<div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">상세보기</h3>
    
  </div>

 <div class="w3-row-padding w3-grayscale" style="width: 70%; margin-left: 170px">
	  
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    </div>
	
	  <!-- Slideshow Header -->
  <div class="w3-container" id="apartment">
   
    <div class="w3-display-container mySlides">
    <img src="${vo.com_pic }" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
        
      </div>
    </div>
  </div>
 

  <div class="w3-container" font-size="20px;" >
    <h2 class="w3-text-green">${vo.com_name }</h2>
    <p align=left><i class="fa fa-fw fa-clock-o" ></i>별점 : ${vo.com_star }</p>
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-male"></i> 주소 : ${vo.com_address }</p>
        <p><i class="fa fa-fw fa-bath"></i> 도로명 주소 : ${vo.com_address2 } </p>
        <p><i class="fa fa-fw fa-bed"></i> 홀타입 : ${vo.com_type } </p>
      </div>
      <div class="w3-col s6">
   
        <p><i class="fa fa-fw fa-clock-o"></i> 보증인원 : ${vo.com_person }</p>
        <p><i class="fa fa-fw fa-clock-o"></i> 메뉴종류 : ${vo.com_menu }</p>
        <p><i class="fa fa-fw fa-clock-o"></i> 식사비용 : ${vo.com_meal }</p>
      </div>
    </div>
    <hr>
    
    
    <h4><strong>체크 포인트</strong></h4>
    <p>${vo.com_ckeck }</p>
    
    <hr>
    
    <h4><strong>상담 / 예약</strong></h4>
  
     <p><button class="w3-button w3-green w3-third" onclick="document.getElementById('subscribe').style.display='block'">상담신청 </button></p>
       <p><button class="w3-button w3-green w3-third" onclick="document.getElementById('subscribe').style.display='block'">예약하기 </button></p>
       <p><button class="w3-button w3-green w3-third" onclick="document.getElementById('subscribe').style.display='block'">견적내기</button></p>
  </div>
  <hr>
  
  <!-- Contact -->
  <div class="w3-container" id="contact">
    <h2>리뷰</h2>
    <i class="fa fa-map-marker" style="width:30px"></i> Chicago, US<br>
    <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
    <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
    <p>Questions? Go ahead, ask them:</p>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Message" required name="Message"></p>
    <button type="submit" class="w3-button w3-green w3-third">Send a Message</button>
    </form>
  </div>
  
  <footer class="w3-container w3-padding-16" style="margin-top:32px">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></footer>

<!-- End page content -->
</div>

<!-- Subscribe Modal -->
<div id="subscribe" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom w3-padding-large">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('subscribe').style.display='none'" class="fa fa-remove w3-button w3-xlarge w3-right w3-transparent"></i>
      <h2 class="w3-wide">SUBSCRIBE</h2>
      <p>Join our mailing list to receive updates on available dates and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-green w3-margin-bottom" onclick="document.getElementById('subscribe').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>
	
</div>
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-16">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>




</body>
</html>