<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate(); // 저장 내용 해제
	response.sendRedirect("../project.jsp");
%>