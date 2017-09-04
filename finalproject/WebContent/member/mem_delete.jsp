<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){
		var pwd=$('#userpwd').val();
		/* alert(pwd); */
		$('#delForm').submit();
	});
});
</script>
</head>
<body>
<center>
	
	<form id="delForm" action="member/mem_delete_ok.jsp" name="delForm" method="post">
	    <input type=hidden name=mem_id id="userid" value="${sessionScope.id }">
	    비밀번호
	    <input type=text name=mem_pw id="userpwd">
	    
	    <input type=button id="delBtn" value="확인" style="text-decoration: none">
    </form>
    
</center>
</body>
</html>