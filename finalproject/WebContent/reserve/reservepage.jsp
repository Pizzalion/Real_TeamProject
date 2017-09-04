<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="rm" class="com.sist.movie.model.ReserveModel"/>
<%
   rm.reserve_mypage(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../reserve/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var past=0;
var now=0;
$(function(){
	$('.dataTr').click(function(){
		
		now=$(this).attr('va');
		//past=now;
		if(past!=0){
			$('#m'+past).hide();
			past=now;			
		}
		//alert(now);
		$('#m'+now).show();
		//$('.rc').text("�ݱ�");
	});
});
</script>
<style type="text/css">
td{
   color:white;
}
</style>
</head>

<body>
	<center>
	<div id="news_area">
	 <table id="table_content" width=750>
	 	<tr>
	 		<th>��ȣ</th>
	 		<th>��ȭ��</th>
	 		<th>�����</th>
	 		<th>������</th>
	 		<th>�ð�</th>
	 		<th>�ο�</th>
	 		<th>�ݾ�</th>
	 		<th>����</th>
	 		<th>���/���</th>
	 	</tr>
	 	<c:forEach var="vo" items="${list }">
	 	<tr class="dataTr" va="${vo.no }">
	 	  <td align=center>${vo.no }</td>
	 	  <td align=center>${vo.title }</td>
	 	  <td align=center>${vo.theater }</td>
	 	  <td align=center>${vo.resday }</td>
	 	  <td align=center>${vo.restime }</td>
	 	  <td align=center>${vo.inwon }</td>
	 	  <td align=center>${vo.price }</td>
	 	  <td align=center>${vo.reserve==0? "������":"����Ϸ�" }</td>
	 	  <td align=center>	 	
         <c:if test="${vo.reserve==1 }">
          <a href="" value="${vo.no }" class="rc"></a>&nbsp;
         </c:if>
         <a href="../reserve/reserve_cancel.jsp?no=${vo.no }">�������</a>
	 	  </td>
	 	</tr>
	 	<tr id="m${vo.no }" style="display:none">
	 		<td align=left valign=top colspan=9>
	 			<h3>���ų���</h3>
	 			���Ź�ȣ: ${vo.no }<br/>
	 			��ȭ��: ${vo.title }<br/>
	 			�����: ${vo.theater }<br/>
	 			������: ${vo.resday }<br/>
	 			���Žð�: ${vo.restime }<br/>
	 			�����ο�: ${vo.inwon }<br/>
	 			���űݾ�: ${vo.price }<br/>
	 		</td>
	 	</tr>
	 	</c:forEach>
	 </table> 
	 </div>
	</center>
</body>
</html>