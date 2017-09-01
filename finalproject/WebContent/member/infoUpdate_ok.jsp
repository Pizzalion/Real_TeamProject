<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    request.setCharacterEncoding("EUC-KR");//post방식
	/* String mem_id = request.getParameter("id");
	String mem_name =  request.getParameter("name");
	String mem_sex  =  request.getParameter("sex");
	String mem_birth = request.getParameter("birthday");
	String mem_email = request.getParameter("email");
	String mem_phone1 = request.getParameter("phone1");
	String mem_phone2 = request.getParameter("phone2");
	String mem_phone3 = request.getParameter("phone3"); */
%>
<jsp:useBean id="model" class="com.sist.member.model.MemberModel"/>
<jsp:useBean id="vo" class="com.sist.member.MemberVO">
 <jsp:setProperty name="vo" property="*"/> 
 </jsp:useBean>
 <%
	 model.memberUpdateOk(vo,request,response);
/*  	System.out.println("나와라요");
 	System.out.println(vo.getMem_id());
 	System.out.println(vo.getMem_name());
 	System.out.println(vo.getMem_pw());
 	System.out.println(vo.getMem_email());
 	System.out.println(vo.getMem_birth());
 	System.out.println(vo.getMem_phone()); */
 %>