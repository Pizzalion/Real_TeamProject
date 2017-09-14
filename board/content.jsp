<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
    <jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>
    <%
    	String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
		BoardVO vo=dao.boardContentData(
	    		   Integer.parseInt(strNo));
    %>
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
			<table width=800>
				<tr>
					<th class="content"width=20%>번호</th>
					<td width=30% align=center><%=vo.getNo() %></td>
					<th class="content"width=20%>작성일</th>
					<td width=30% align=center><%=vo.getRegdate() %></td>
				</tr>
				<tr>
					<th class="content"width=20%>이름</th>
					<td width=30% align=center><%=vo.getName() %></td>
					<th class="content"width=20%>조회수</th>
					<td width=30% align=center><%=vo.getHit()%></td>
				</tr>
				<tr>
					<th class="content"width=20%>제목</th>
					<td colspan="3" align="left"><%=vo.getSubject() %></td>
				</tr>
				<tr>
					<td colspan="4" align="left" valign="top" height=200><%=vo.getContent()%></td>
				</tr>
			</table>
			<table width=800>
				<tr>
					<td align=right>
					<a href="reply.jsp?no=<%=strNo%>&page=<%=strPage%>"><input type="button" value="답변"></a>
 			      <a href="update.jsp?no=<%=strNo%>&page=<%=strPage%>"> <input type="button" value="수정"></a>
      			  <a href="delete.jsp?no=<%=strNo%>&page=<%=strPage%>"><input type="button" value="삭제"></a>
     			   <a href="list.jsp?page=<%=strPage%>"><input type="button" value="목록"></a>
					</td>
				</tr>
			</table>
	</center>
</body>
</html>