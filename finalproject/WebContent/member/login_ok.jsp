<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.member.model.MemberModel"/>
<%
	model.memberLogin(request);
%>

<c:choose>
	<c:when test="${res=='NOID' }"> <%-- if --%>
		<script>
			alert("아이디가 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:when test="${res=='NOPWD' }"> <%-- else if --%>
			<script>
			alert("비밀번호가 틀립니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>	<%-- else --%>
		<c:redirect url="../project.jsp"/>
	</c:otherwise>
</c:choose>
