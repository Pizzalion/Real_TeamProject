<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
 <jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>
    <%
    	String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<center>
			<img src="image/qna.jpg" width=600 height=60>
			<p>
			<form method="post" action="reply_ok.jsp">
			<table id="table_content" width=600>
				<tr>
					<th width=15% align=right>�̸�</th>
					<td width=85% align=left><input type=text name=name size=13
						id="name">
						<input type="hidden" name=pno value="<%=strNo %>">
						<input type="hidden" name=page value="<%=strPage %>"></td>
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
					<th width=30% align=right>��й�ȣ</th>
					<td width=70% align=left><input type="password" name=pwd
						size=10></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=submit value=�۾���>
						<input type=button value=��� onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
		</center>
</body>
</html>