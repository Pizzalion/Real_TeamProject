<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="em" class="com.sist.wedding.manager.EstiModel" />
<%
	em.estiComData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../estimate/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
 	$('.dataTr').click(function(){
		var no=$(this).attr("data-no");		
		var img=$('#m'+no).attr("src");
		var title=$('#s'+no).text();	
		$('#esti_img').attr("src",img);
		$('#esti_title').text(title); 
	 	
		$.ajax({
			type:'post',
			url:'estimate/innerHallInfo.jsp',
			data:{"com_no":no},
			success:function(recvData)
			{
				$('#innerHallInfo').html(recvData);
			}
		});  
	 }); 
});
</script>
</head>
<body>
	<table id="table_content" width=280>	
		<c:forEach var="vo" items="${list }">
			
			<tr class="dataTr" data-no="${vo.com_no }">
				<td>
				 <img src="${vo.com_pic }" width=30 height=40 id="m${vo.com_no }">
				</td>
				<td>
				<span style="font-size: 6pt; color: black" id="s${vo.com_no }">${vo.com_name }</span>
				</td>
			</tr>
			
		</c:forEach>
	</table>
</body>
</html>