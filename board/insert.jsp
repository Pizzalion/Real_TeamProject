<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css">
</head>
<body>
	<center>
			<p>
			<form method="post" action="insert_ok.jsp">
			<table width=800>
				<tr>
					<th width=15% align=right>�̸�</th>
					<td width=85% align=left><input type=text name=name size=13
						id="name"></td>
					<%--
							ũ��,���� => td ���� ����
							�ͽ�	 => td ������ ����
					 --%>
				</tr>
				<tr>
					<th width=30% align=right>����</th>
					<td width=70% align=left><input type=text name=subject size=40>
					</td>
				</tr>
				<tr>
					<th width=30% align=right>����</th>
					<td width=70% align=left><textarea rows="10" cols="45"
							name=content></textarea></td>
				</tr>
				<tr>
					<th width=30% align=right>÷������</th>
					<td width=70% align=left><input type=file name=upload size=25>
					</td>
				</tr>
				<tr>
					<th width=30% align=right>��й�ȣ</th>
					<td width=70% align=left><input type="password" name=pwd
						size=10></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=submit value="�۾���">
						<input type=button value=��� onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
		</center>
</body>
</html>