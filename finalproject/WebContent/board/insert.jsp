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
					<th width=15% align=right>이름</th>
					<td width=85% align=left><input type=text name=name size=13
						id="name"></td>
					<%--
							크롬,파폭 => td 왼쪽 정렬
							익스	 => td 오른쪽 정렬
					 --%>
				</tr>
				<tr>
					<th width=30% align=right>제목</th>
					<td width=70% align=left><input type=text name=subject size=40>
					</td>
				</tr>
				<tr>
					<th width=30% align=right>내용</th>
					<td width=70% align=left><textarea rows="10" cols="45"
							name=content></textarea></td>
				</tr>
				<tr>
					<th width=30% align=right>첨부파일</th>
					<td width=70% align=left><input type=file name=upload size=25>
					</td>
				</tr>
				<tr>
					<th width=30% align=right>비밀번호</th>
					<td width=70% align=left><input type="password" name=pwd
						size=10></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=submit value="글쓰기">
						<input type=button value=취소 onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
		</center>
</body>
</html>