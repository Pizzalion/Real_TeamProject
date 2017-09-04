<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.member.model.MemberModel"/>
<%
		model.memberDeleteOk(request,response);
		
%>


