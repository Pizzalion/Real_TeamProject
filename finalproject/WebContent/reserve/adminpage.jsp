<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="rm" class="com.sist.movie.model.ReserveModel"/>
<%
   rm.reserve_adminPage(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../reserve/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
td{
   color:white;
}
</style>
</head>
<body>
   <center>
   <div id="news_area">
     <table id="table_content" width=700>
      <tr>
       <th>번호</th>
       <th>ID</th>
       <th>영화명</th>
       <th>극장명</th>
       <th>예약일</th>
       <th>시간</th>
       <th>인원</th>
       <th>결재금액</th>
       <th>상태</th>
       <th>비고</th>
      </tr>
      <c:forEach var="vo" items="${list }">
       <tr>
        <td align=center>${vo.no }</td>
        <td align=center>${vo.id }</td>
        <td align=center>${vo.title }</td>
        <td align=center>${vo.theater }</td>
        <td align=center>${vo.resday }</td>
        <td align=center>${vo.restime }</td>
        <td align=center>${vo.inwon }</td>
        <td align=center>${vo.price }</td>
        <td align=center>${vo.reserve==0?"승인대기":"승인완료" }</td>
        <td align=center>
        <c:if test="${vo.reserve==0 }">
         <a href="../reserve/admin_ok.jsp?no=${vo.no }">승인</a>
        </c:if>
        </td>
       </tr>
      </c:forEach>
     </table>
     </div>
   </center>
</body>
</html>
