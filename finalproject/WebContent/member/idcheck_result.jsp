<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="model" class="com.sist.member.model.MemberModel"/>
<%
	model.memberIdCheck(request);
%>
${count }
