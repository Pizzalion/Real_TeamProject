<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"/> 
<%
	String strId=request.getParameter("mem_id");
	String strPwd=request.getParameter("mem_pw");
	boolean bCheck=dao.memberDelete(strId, strPwd);
%>   
<c:set var="bCheck" value="<%=bCheck %>"/>
<c:if test="${bCheck==true }">
	<script>
		alert("Ż�� �Ϸ�Ǿ����ϴ�.");
		<%
			session.invalidate();
		%>
		location.href="../project.jsp";
	</script>
	<%-- <c:redirect url="list.jsp"/> --%>
</c:if>
<c:if test="${bCheck!=true }">
	<script>
		alert("��й�ȣ�� Ʋ���ϴ�.");
		history.back();
	</script>
</c:if>


