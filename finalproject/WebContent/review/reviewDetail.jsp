<%@page import="com.sun.media.sound.ModelAbstractChannelMixer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<jsp:useBean id="rm" class="com.sist.wedding.manager.ReviewModel" />
<%
	rm.WeddingDetailData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "맑은 고딕";}
.mySlides {display:none}
</style>
</head>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-white" style="margin-left:260px" >

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:80px"></div>

  <!-- Slideshow Header -->
  <div class="w3-container" id="apartment">
   </br>
    <h2 class="w3-text-black">신랑, 신부 이용후기</h2><hr></br></br>
      
    <div class="w3-display-container mySlides">
    <img src="images/hall1.jpg" style="width:49%;margin-bottom:-6px">
    
    </div>
    <div class="w3-display-container mySlides">
    <img src="images/hall2.jpg" style="width:49%;margin-bottom:-6px">

    </div>
    <div class="w3-display-container mySlides">
    <img src="images/hall3.jpg" style="width:49%;margin-bottom:-6px">
     
    </div>
    <div class="w3-display-container mySlides">
    <img src="images/hall4.jpg" style="width:49%;margin-bottom:-6px">    
    </div>
  </div>
  <div class="w3-row-padding w3-section" style="width:50%">
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="images/hall1.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(1)" title="Living room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="images/hall2.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(2)" title="Dining room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="images/hall3.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(3)" title="Bedroom">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="images/hall4.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(4)" title="Second Living Room">
    </div>
  </div>

  <div class="w3-container" style="width:70%">
    <h4><strong>${vo.com_name}</strong></h4>
    <div class="w3-row w3-large">
    
     <div class="w3-col s6" style="width:750px">
       <p><i class="fa fa-fw fa-clock-o"></i><b>주소:</b> ${vo.com_address }</p>      
      </div>  
      <div class="w3-col s6">      
        <p><i class="fa fa-fw fa-bath"></i><b>홀 타입:</b> ${vo.com_type }</p>
        <p><i class="fa fa-fw fa-bed"></i><b>메뉴 종류:</b> ${vo.com_menu }</p>
          <p><i class="fa fa-fw fa-clock-o"></i><b>식사 비용:</b> ${vo.com_meal }</p>
      </div>
      <div class="w3-col s6">
      
        <p><i class="fa fa-fw fa-clock-o"></i><b>보증 인원:</b> ${vo.com_person }</p>
        <p><i class="fa fa-fw fa-clock-o"></i><b>가능 행사:</b> ${vo.com_event }</p>
      </div>
      <div class="w3-col s6" style="width:750px">
       <p><i class="fa fa-fw fa-clock-o"></i><b> 체크포인트:</b> ${vo.com_check }</p>
      </div>
    </div>
    <hr>
 
   
    <h4><strong>Amenities</strong></h4>
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-shower"></i> Shower</p>
        <p><i class="fa fa-fw fa-wifi"></i> WiFi</p>
        <p><i class="fa fa-fw fa-tv"></i> TV</p>
      </div>
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-cutlery"></i> Kitchen</p>
        <p><i class="fa fa-fw fa-thermometer"></i> Heating</p>
        <p><i class="fa fa-fw fa-wheelchair"></i> Accessible</p>
      </div>
    </div>
    <hr>
    
    <!-- <h4><strong>Extra Info</strong></h4>
    <p>Our apartment is really clean and we like to keep it that way. Enjoy the lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
   -->
    <hr> 
    
   <!--  <h4><strong>Rules</strong></h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <p>Subscribe to receive updates on available dates and special offers.</p>
    <p><button class="w3-button w3-green w3-third" onclick="document.getElementById('subscribe').style.display='block'">Subscribe</button></p>
  </div> -->
  <hr>
  

<!-- End page content -->
</div>



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

	</div>

	<center>
		 <!-- header -->
					<table id="table_content" width=450>
						<tr>
							<td align=left valign="top" height=200></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</center>


</html>