<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String strNo=request.getParameter("no");
   String strPage=request.getParameter("page");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
   <center>
    <h3>삭제하기</h3>
    <form method="post" action="delete_ok.jsp">
    <table width=250>
     <tr>
      <th width=35%>비밀번호</th>
      <td width=65% align=left>
       <input type=password name=pwd size=12>
       <input type="hidden" name=no value="<%=strNo%>">
       <input type="hidden" name=page value="<%=strPage%>">
      </td>
     </tr>
     <tr>
       <td colspan="2" align=center>
        <input type=submit value=삭제>
        <input type=button value=취소 
        onclick="javascript:history.back()">
       </td>
     </tr>
    </table>
    </form>
   </center>
</body>
</html>






