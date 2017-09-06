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
  <div class="w3-container" id="apartment" style="align:center">
   </br>
    <h2 class="w3-text-black">신랑, 신부 이용후기</h2><hr></br></br>
      <h3><strong>${vo.com_name}</strong></h3><br>
   
    <div class="w3-display-container mySlides">
    <img src=${iVo0.img_src } style="width:49%;margin-bottom:-6px">
    
    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo1.img_src } style="width:49%;margin-bottom:-6px">

    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo2.img_src } style="width:49%;margin-bottom:-6px">
     
    </div>
    <div class="w3-display-container mySlides">
    <img src=${iVo3.img_src } style="width:49%;margin-bottom:-6px">    
    </div>
 <!--  </div> -->
  <div class="w3-row-padding w3-section" style="width:50%">
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo0.img_src } style="width:100%;cursor:pointer" onclick="currentDiv(1)" title="Living room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo1.img_src } style="width:100%;cursor:pointer" onclick="currentDiv(2)" title="Dining room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src=${iVo2.img_src } style="width:100%;cursor:pointer" onclick="currentDiv(3)" title="Bedroom">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src= ${iVo3.img_src } style="width:100%;cursor:pointer" onclick="currentDiv(4)" title="Second Living Room">
    </div>
  </div>
 


  <div class="w3-container" style="width:70%">
   
    <div class="w3-row w3-large">
    
     <div class="w3-col s6" style="width:800px">
       <p><i class="fa fa-fw fa-clock-o"></i><b>주소:</b> ${vo.com_address }</p>      
      </div>  
      <div class="w3-col s6" style="width:400px">      
        <p><i class="fa fa-fw fa-bath"></i><b>홀 타입:</b> ${vo.com_type }</p>
        <p><i class="fa fa-fw fa-bed"></i><b>메뉴 종류:</b> ${vo.com_menu }</p>
          <p><i class="fa fa-fw fa-clock-o"></i><b>식사 비용:</b> ${vo.com_meal }</p>
      </div>
      <div class="w3-col s6" style="width:400px">   
        <p><i class="fa fa-fw fa-clock-o"></i><b>보증 인원:</b> ${vo.com_person }</p>
        <p><i class="fa fa-fw fa-clock-o"></i><b>가능 행사:</b> ${vo.com_event }</p>
      </div>
      <div class="w3-col s6" style="width:800px">
       <p><i class="fa fa-fw fa-clock-o"></i><b> 체크포인트:</b> ${vo.com_check }</p>
      </div>
    </div>
    <hr>
 
      
  <li class="w3-bar" style="width:900px">    
      <img src="img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:120px; margin-left:-10px">
      <div class="w3-bar-item" style="margin-left:10px">
        <span class="w3-large"> ${rVo.review_regdate }  ${rVo.review_writer } </span><br>
        <span>${rVo.review_comment }</span><br>
        <span>${rVO.review_title}</span>
        <span>시설: ${rVo.review_fscore } 교통:${rVo.review_tscore } 가격:${rVo.review_mscore } 음식:${rVo.review_pscore } 서비스:${rVo.review_sscore } </span><br>
      	<span>평점: ${rVo.review_ave }</span>
      </div>
    </li>     
    <hr>
    
   
 <!-- 같은 업체의 다른 리뷰들 -->
  <div class="w3-container">
  <h2>Avatar List</h2>
  <p>You can combine w3-ul and the w3-bar classes to create an avatar list:</p>
  <ul class="w3-ul w3-card-4">
   <%-- <c:forEach var="" items="">  --%>
    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Mike</span><br>
        <span>Web Designer</span>
      </div>
    </li>
    <%-- </c:forEach>   --%>

    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Jill</span><br>
        <span>Support</span>
      </div>
    </li>

    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Jane</span><br>
        <span>Accountant</span>
      </div>
    </li>
  </ul>
</div>
 
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