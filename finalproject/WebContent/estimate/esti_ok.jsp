<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="em" class="com.sist.wedding.manager.EstiModel"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.sist.wedding.dao.EstiVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>   
<%
	String id=(String)session.getAttribute("id");
	vo.setMy_id(id);
	em.esti_ok(vo, response);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>