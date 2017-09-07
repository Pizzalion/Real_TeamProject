<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/delete.css">
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
<div id="form">
	<h3 id="tal">회원탈퇴</h3><br>
	<span>회원 탈퇴를 할 수 있습니다. 다음 안내사항을 꼭 읽어주신 후 탈퇴하시기 바랍니다.</span>
	<table id="table">
		<tr>
			<td><span>01.</span> 회원탈퇴 시, 고객님의 개인정보는 모두 삭제처리 됩니다.</td>
		</tr>
		<tr>
			<td><span>01.</span> 회원탈퇴는 즉시 처리됩니다.</td>
		</tr>
		<tr>
			<td><span>01.</span> 탈퇴 후 재가입이 가능합니다.</td>
		</tr>
		<tr>
			<td><span>01.</span> 비밀번호를 한번 더 입력 후 확인 버튼을 누르면 탈퇴가 완료됩니다.</td>
		</tr>
		
	</table>
	<form id="delForm" action="member/mem_delete_ok.jsp" name="delForm" method="post">
	    <input type=hidden name=mem_id id="userid" value="${sessionScope.id }">
	    비밀번호
	    <input type=text name=mem_pw id="userpwd">
	    
	    <input type=button id="delBtn" value="확인" style="text-decoration: none">
    </form>
</div>    
</center>
</body>
</html>