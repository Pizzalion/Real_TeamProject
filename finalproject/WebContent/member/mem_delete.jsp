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
	<h3 id="tal">ȸ��Ż��</h3><br>
	<span>ȸ�� Ż�� �� �� �ֽ��ϴ�. ���� �ȳ������� �� �о��ֽ� �� Ż���Ͻñ� �ٶ��ϴ�.</span>
	<table id="table">
		<tr>
			<td><span>01.</span> ȸ��Ż�� ��, ������ ���������� ��� ����ó�� �˴ϴ�.</td>
		</tr>
		<tr>
			<td><span>01.</span> ȸ��Ż��� ��� ó���˴ϴ�.</td>
		</tr>
		<tr>
			<td><span>01.</span> Ż�� �� �簡���� �����մϴ�.</td>
		</tr>
		<tr>
			<td><span>01.</span> ��й�ȣ�� �ѹ� �� �Է� �� Ȯ�� ��ư�� ������ Ż�� �Ϸ�˴ϴ�.</td>
		</tr>
		
	</table>
	<form id="delForm" action="member/mem_delete_ok.jsp" name="delForm" method="post">
	    <input type=hidden name=mem_id id="userid" value="${sessionScope.id }">
	    ��й�ȣ
	    <input type=text name=mem_pw id="userpwd">
	    
	    <input type=button id="delBtn" value="Ȯ��" style="text-decoration: none">
    </form>
</div>    
</center>
</body>
</html>