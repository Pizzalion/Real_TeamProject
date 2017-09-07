<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.MemberDAO,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"/>
<%
		int result=dao.adminDelete(request.getParameter("id"));

	String message="삭제되지 않았습니다.";
	if(result>0){
		message="삭제되었습니다.";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("<%=message%>");
		location.href="../project.jsp?mode=5";
	</script>
</body>
</html>