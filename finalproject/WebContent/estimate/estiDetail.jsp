<%@page import="com.sun.media.sound.ModelAbstractChannelMixer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
 <jsp:useBean id="ed" class="com.sist.wedding.manager.EstiModel" /> 
<%
	ed.EstiDetailData(request);	
 	ed.sampleEstiData(request);
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
    <h2 class="w3-text-black">웨딩홀 견적서</h2><hr></br></br>
       <h3><strong> ${vo.com_name} </strong></h3><br>
   
    <img src=${vo.com_pic } style="width:49%;margin-bottom:-6px">
    
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
  <%--   <c:forEach var="oVo" items="${otList }">
    ${oVo.opt_sel}
    </c:forEach> --%>
 <h2 style="text-align:center">견적서</h2>
     <%--  ${oVo.com_title} --%>
  <table class="w3-table-all">
    <thead>
		
	
	
<%-- 		<table id="table_content" width=300>
		
			<p>
		  	<input class="dataTr opTr" class="w3-check" type="checkbox" name="optbox" data-no="${vo.opt_no }" >	
		  	<span style="color:black;" id="oo${vo.opt_no }">${vo.opt_name } | ${vo.opt_sel } | ${vo.opt_price }</span>
		  	</p>

			<button id="optionBtn">확인</button> --%>
			


      <tr class="w3-light-grey">
        <th>항목</th>
        <th>비고</th>
        <th>가격</th>
        <th>내용</th>          
      </tr>
    </thead>
    
    <c:forEach var="vo" items="${slist }">
    <tr>
      <td>${vo.opt_name }</td>
      <td>${vo.opt_price }</td>
      <td>${vo.opt_price }</td>
      <td>${vo.opt_con }</td>
    </tr>
   <tr >
 	</c:forEach>  
 	
 	<table>
 	<c:forEach var="vo" items="${slist }">
 	<tr>
 		<td colspan=3 >최종 견적 금액(부가세 포함)</td>
       <td>${vo.tot_price }</td>  
      </tr> 
 	</c:forEach>   
 	</table>
	
	<%--  <td colspan=3 >최종 견적 금액(부가세 포함)</td>
       <td>${vo.tot_price }</td>      
     </tr>  --%>
  	
  	<%--  <tr >
      <td colspan=3 >최종 견적 금액(부가세 포함)</td>
       <td>${vo.tot_price }</td>      
     </tr>  --%>
   
    </table>


  
  </table>
  
   

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