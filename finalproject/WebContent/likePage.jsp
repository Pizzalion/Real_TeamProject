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
<title>������ġ</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.unlike').click(function(){
      //var id = $(this).attr('idd');
       alert('���');
	   var cno = $(this).attr('no');
	   //alert('����Ͻø� ������ϴ�.');
		
	   
	   /* $.ajax({
			type: 'post',
			url: 'likePage.jsp',
			data: {"cno":cno}// "id":id	
		    /* success:function(value){
			
		} */
		}); */ 
		alert('����Ͻø� ������ϴ�.');
		
	});
});
</script>
</head>
<body>

<%-- <jsp:include page="header.jsp" /> --%>

<h1 align=center>�� ���</h1>
 <center>
 <div>
 	<table id=table_content width=900>
 	  <caption></caption>
 	  
			<tr ><!-- Ŭ���ϸ� �� �������� �̵� -->
				<th>Ȧ ����</th>
				<th>Ȧ ����</th>
				<th>�����û</th>
				<th>���</th>
			</tr>
		<c:forEach var="vo" items="${hlist }" >
	        <tr class='dataTr'>			
				<td align=center>
				<%-- <input type=hidden value="${vo.com_no }"> --%>
				<img width=200 alt="�׸�����" src="http://iwedding.co.kr${vo.hall_image }">
				</td>
				<td> 
				 <h4>${vo.com_name }</h4>
				  �ּ�: ${vo.com_addr }<br/>
				  �Ĵ�: ${vo.food_price }<br/>
				  �ο�: ${vo.people }<br/>
				</td>
				<td align=center>
				<a href="#"><img alt="�����û" src="images/heart.png"></a>
				</td>
				<td align=center>
				<form method="post" action="likeCancel_ok.jsp"><input type="submit" class="unlike" no="${vo.com_no }">���</form>
				<%-- <img alt="�� ���" src="images/heart.png" id="cancel" no="${vo.com_no }"> --%>
				</td>
			</tr>
		</c:forEach>
		</table>
 
 </div>
 </center>






</body>
</html>