<%@page import="com.sun.media.sound.ModelAbstractChannelMixer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<jsp:useBean id="rm" class="com.sist.wedding.manager.ReviewModel" />
<%
	rm.WeddingDetailData(request);
	rm.ReviewAllData(request);
	rm.ImageData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../css/css.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('#resBtn').click(function(){
		$('#dialog').dialog('open');
	});
});
$(function(){
	$('#dialog').dialog({
		autoOpen:false,
		width:1000,
		height:800,
		modal:true,
		buttons: [
			{
			text:'신청',
			click:function(){
				
				$('#resfrm').submit();
				}
			},
			{
				text:'취소',
				click:function(){
					$(this).dialog("close");
				}
				
			}
		] 
	
	});
		
	
});


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


<title>Insert title here</title>
<!-- <style>
body,h1,h2,h3,h4,h5,h6 {font-family: "맑은 고딕";}
.mySlides {display:none}
</style> -->
</head>

<div class="w3-content w3-padding" style="max-width:1300px; ">

  <!-- Project Section -->
	<div class="w3-container w3-padding-32" id="about">
   	 <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">신랑, 신부 이용후기</h3>
     </div>
     
     
	 <div class="w3-row-padding w3-grayscale" style="width: 70%; margin-left: 170px">
	  	
	  <!-- Slideshow Header -->
  <div class="w3-container" id="apartment">
   
   
      <div class="w3-display-container mySlides">
    <img src=${iVo0.img_src } style="width:100%; height:500px; margin-bottom:-6px">
    
    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo1.img_src } style="width:100%;height:500px;;margin-bottom:-6px">

    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo2.img_src } style="width:100%;height:500px;margin-bottom:-6px">
     
    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo3.img_src } style="width:100%;height:500px;margin-bottom:-6px">    
    </div>
 <!--  </div> -->
  <div class="w3-row-padding w3-section" style="width:100%">
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo0.img_src } style="width:100%; height:110px; padding-right:10px; cursor:pointer" onclick="currentDiv(1)" title="Living room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo1.img_src } style="width:100%; height:110px;padding-right:10px;cursor:pointer" onclick="currentDiv(2)" title="Dining room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo2.img_src } style="width:100%; height:110px;padding-right:10px;cursor:pointer" onclick="currentDiv(3)" title="Bedroom">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src= ${iVo3.img_src } style="width:100%; height:108px;padding-right:10px;cursor:pointer" onclick="currentDiv(4)" title="Second Living Room">
    </div>
  </div>
    
    </div>
  </div>


</div>
<!-- 여기까지 그림 -->
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-white" style="margin-left:260px" >

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:80px"></div>

  <!-- Slideshow Header -->
  <div class="w3-container" id="apartment" style="align:center">
   </br>
    <!-- <h2 class="w3-text-black">신랑, 신부 이용후기</h2><hr></br></br> -->
     <%--  <h3><strong>${vo.com_name}</strong></h3><br> --%>
   
 <div class="w3-container" font-size="20px;" style="margin-left:-100px">
    <h2 class="w3-text-green">${vo.com_name }</h2>
    
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-male"></i> 주소 : ${vo.com_address }</p>
        <p><i class="fa fa-fw fa-bath"></i> 홀타입 : ${vo.com_type } </p>
        <p><i class="fa fa-fw fa-bed"></i> 메뉴 종류:</b> ${vo.com_menu } </p>
      </div>
      <div class="w3-col s6">
 		 <p><i class="fa fa-fw fa-clock-o"></i> 보증인원 : ${vo.com_person }</p>
        <p><i class="fa fa-fw fa-clock-o"></i> 가능 행사: ${vo.com_event }</p>
        <p><i class="fa fa-fw fa-clock-o"></i> 식사비용 : ${vo.com_meal }</p>
      </div>
   
   
   
   </div>
    <hr>
    
    
    <h4><strong>체크 포인트</strong></h4>
    <p>${vo.com_check }</p>
    
    <hr>

      
  <li class="w3-bar" style="width:1300px">    
      <img src="images/emt_livegrade_05.jpg" class="w3-bar-item w3-circle w3-hide-small" id="scoreImg" style="width:120px; margin-left:-10px">
      <div class="w3-bar-item" style="margin-left:10px; width:780px;">
        <span class="w3-large"> ${rVo.review_regdate }  ${rVo.review_writer } </span><br>
        <span >${rVo.review_comment }</span><br>
        <span>${rVO.review_title}</span>
        <span>시설: ${rVo.review_fscore } 교통:${rVo.review_tscore } 가격:${rVo.review_mscore } 음식:${rVo.review_pscore } 서비스:${rVo.review_sscore } </span><br>
      	<span>평점: ${rVo.review_ave }</span>
      </div>
    </li>     
    <hr>
    <p><button id="resBtn" title="예약" class="w3-button w3-green w3-third" >상담/예약하기</button> </p>
    <p><button id="project.jsp?mode=204" class="w3-button w3-green w3-third">견적내기</button></p> 
    <p><button id ="project.jsp?mode=200" class="w3-button w3-green w3-third" >목록으로</button> </p>
  </div>

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