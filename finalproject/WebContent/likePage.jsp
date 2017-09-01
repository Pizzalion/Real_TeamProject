<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="mpage" class="com.sist.member.model.MemberModel"/>
<%

//mpage.cancelLike(request);
mpage.getLikeData(request);  

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>웨딩피치</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.unlike').click(function(){
      //var id = $(this).attr('idd');
       alert('취소');
	   var cno = $(this).attr('no');
	   //alert('취소하시면 사라집니다.');
		
	   
	   /* $.ajax({
			type: 'post',
			url: 'likePage.jsp',
			data: {"cno":cno}// "id":id	
		    /* success:function(value){
			
		} */
		}); */ 
		alert('취소하시면 사라집니다.');
		
	});
});
</script>
</head>
<body>

<%-- <jsp:include page="header.jsp" /> --%>

<h1 align=center>찜 목록</h1>
 <center>
 <div>
 	<table id=table_content width=900>
 	  <caption></caption>
 	  
			<tr ><!-- 클릭하면 상세 페이지로 이동 -->
				<th>홀 사진</th>
				<th>홀 정보</th>
				<th>예약신청</th>
				<th>취소</th>
			</tr>
		<c:forEach var="vo" items="${hlist }" >
	        <tr class='dataTr'>			
				<td align=center>
				<%-- <input type=hidden value="${vo.com_no }"> --%>
				<img width=200 alt="그림없음" src="http://iwedding.co.kr${vo.hall_image }">
				</td>
				<td> 
				 <h4>${vo.com_name }</h4>
				  주소: ${vo.com_addr }<br/>
				  식대: ${vo.food_price }<br/>
				  인원: ${vo.people }<br/>
				</td>
				<td align=center>
				<a href="#"><img alt="예약신청" src="images/heart.png"></a>
				</td>
				<td align=center>
				<form method="post" action="likeCancel_ok.jsp"><input type="submit" class="unlike" no="${vo.com_no }">취소</form>
				<%-- <img alt="찜 취소" src="images/heart.png" id="cancel" no="${vo.com_no }"> --%>
				</td>
			</tr>
		</c:forEach>
		</table>
 
 </div>
 </center>






</body>
</html>