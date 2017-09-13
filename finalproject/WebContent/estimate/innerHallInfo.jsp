<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="im" class="com.sist.wedding.manager.EstiModel"/>
<%
	im.estiInnerHallData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="estimate/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.cnoTr').click(function(){
		var no=$(this).attr("data-no");
		var hall_name=$('#ss'+no).text();
		var hall_price=$('#pp'+no).text();
		$('#esti_innerhall').text("홀 이름: "+hall_name);
		$('#esti_hallprice').text("홀 가격: "+hall_price);
		
		hall_price2=Number(hall_price.replace(/[^0-9]/g,''));
		
		$.ajax({
			type:'post',
			url:'estimate/optionInfo.jsp',
			data:{"com_no":no},
			success:function(res)
			{
				$('#optionInfo').html(res);
			}
		});
		
		$.ajax({
			type:'post',
			url:'estimate/optionInfo.jsp',
			data:{"com_no":hall_price2},
			success:function(res)
			{
				
			}
		});
	});
});


</script>
</head>
<body>
 	<table id="table_content" width=280>
 	
 	<%-- 	<c:forEach var="vo" items="${list }">
 --%>  <tr class="dataTr cnoTr" height=35 data-no="${vo.com_no }">
       <td>
        <span style="color:black;" id="ss${vo.com_no }">${vo.hall_name }</span>(<a id="pp${vo.com_no }">${vo.hall_price }</a>)
       </td>
      </tr>		
 		<%-- </c:forEach>	 --%>
 	</table>
</body>
</html>