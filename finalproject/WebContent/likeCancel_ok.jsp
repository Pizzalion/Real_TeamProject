<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="mpage" class="com.sist.member.model.MemberModel"/>
   <%
   mpage.cancelLike(request);
   response.sendRedirect("project.jsp?mode=4");
   //System.out.println(request.getParameter("no"));
   %>
