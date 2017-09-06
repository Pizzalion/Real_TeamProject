<%@page import="com.sist.member.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="rm" class="com.sist.member.model.ReserveModel"/>
<%
request.setCharacterEncoding("EUC-KR");
/* String bk_ask=request.getParameter("bk_ask");
String bk_cday=request.getParameter("bk_cday");
String bk_dday=request.getParameter("bk_dday");
ReserveVO vo = new ReserveVO();
vo.setBk_ask(bk_ask);
vo.setBk_cday(bk_cday);
vo.setBk_dday(bk_dday); */
%>
<jsp:useBean id="vo" class="com.sist.member.ReserveVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<% 
   System.out.print(vo.getBk_ask()+" "+vo.getBk_cday()+" "+vo.getBk_dday());
   String id=(String)session.getAttribute("id");
   vo.setMem_id(id);
   rm.reserve_ok(vo, response);
   //System.out.print(vo.getMem_id);
%>
