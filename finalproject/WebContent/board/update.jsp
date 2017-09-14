<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.board.*"%>
	<%
		String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
		//DB연동
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.replyBoardUpdateData(Integer.parseInt(strNo));
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#name').focus();
	});
</script>
</head>
<body>
	<center>
		<h3>수정하기</h3>
		<%-- 데이터를 전송 --%>
		<form method=post action="update_ok.jsp">
			<table id="table_content" width=600>
				<tr>
					<th width=20% align=right>이름</th>
					<td width=80% align=left><input type=text name=name size=13
						id="name" value="<%=vo.getName() %>">
						<input type=hidden name=no value="<%=strNo%>">
						<input type=hidden name=page value="<%=strPage%>">
						</td>
				</tr>
				<tr>
					<th width=20% align=right>제목</th>
					<td width=80% align=left><input type=text name=subject size=40 value="<%=vo.getSubject() %>">
					</td>
				</tr>
				<tr>
					<th width=30% align=right>내용</th>
					<td width=70% align=left><textarea rows="10" cols="45"
							name=content><%=vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<th width=30% align=right>비밀번호</th>
					<td width=70% align=left><input type="password" name=pwd
						size=10></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=submit value=수정>
						<input type=button value=취소 onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>