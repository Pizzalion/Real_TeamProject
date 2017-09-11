<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.wedding.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="rpage" class="com.sist.member.model.ReserveModel"/>
 <jsp:useBean id="dao" class="com.sist.member.ReserveDAO"/>
<%
rpage.getBookData(request);  
/* setAttribute되엇기 때문에 가능하다 */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>웨딩피치</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="table.css">
<style type="text/css">
.w3-bar:HOVER {
	background-color: #FC6;
	cursor: pointer;
	cursor: hand;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var no=0;
$(function(){
	//취소
	$('.unlike').click(function(){   
	   var bk_no = $(this).attr('value');    
	   $('#cancel'+bk_no).submit();     
	});
	//상세보기
	$('.w3-bar').click(function(){
		var cno=$(this).attr('value');
		location.href='main_detail.jsp?mode=1&com_no='+cno;
	});
});
</script>
</head>
<body>

<%-- <jsp:include page="header.jsp" /> --%>

 <center>


<div style="display:inline; float:none;">
 <div class="w3-container" >
  <h2>예약페이지</h2>
  <p>추천서비스도 함께 보시면 더욱 좋아요:)</p>
  <ul class="w3-ul w3-card-4">
  
  <c:forEach var="vo" items="${hlist }" > 
   <c:forEach var = "vo2" items="${rlist }"> 
    <c:if test="${vo.hall_no==vo2.hall_no }">
     <form method="post" action="reserve/bookCancel.jsp">
      <li class="w3-bar" value="${vo.com_no }">	      
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">
        <span src="" value="${vo2.bk_no }" class="unlike"> 삭제 </span>
        <%-- <img src="" value="${vo2.bk_no }" class="unlike"> --%>
      </span>
      <img src="${vo.com_pic }" class="w3-bar-item w3-circle w3-hide-small" style="width:200px">
      <div class="w3-bar-item" align=left>
         <span class="w3-large">${vo.com_name}</span><br>
         <span>${vo.hall_name}</span><br/>
		 <%-- <span>주소: ${vo.com_address }</span><br> --%>
	 	  <span>상담일 : ${vo2.bk_cday} </span><br>      
	 	  <span>행사일: ${vo2.bk_dday} </span>          
      </div>      
    </li>
    </form>
    </c:if>
   </c:forEach>
  </c:forEach>
    
  </ul>
</div>
 
 
 <div>  
 <br/> <br/>
 </div>
 <div height = 100 margin=20>
 <a href="project.jsp?mode=105&page=${curpage>1?curpage-1:curpage }">
 <img src="images/back.png" id=pagebtn width=20 ></a>
 ${curpage } 페이지 / ${totalpage } 페이지 
<a href="project.jsp?mode=105&page=${curpage<totalpage?curpage+1:curpage }">
<img src="images/next.png" id=pagebtn width=20 ></a>
<br/> <br/>
</div>
</div>

<div style="display:inline-block;">
<div class="w3-container" width=300 >
 <h4> 빅데이터 분석</h4>
 </div>
 </div>
 </center>
</body>
</html>