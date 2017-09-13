<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
#img img{
	width:40px;
	height:40px;
}
.page img{
	width:40px;
	height:40px;
	margin-right: 50px;
	
}


</style>
<script>
     function idDelete(delID){
       
        /* alert(delID); */
         location.href = "member/admin_delete.jsp?id=" + delID;    //get방식으로 삭제할아이디를 넘김
               
    } 
     
</script>
</head>
<body>

	<center>
		<table id="table_content" width=1400>
			<tr>
				<th width=100 align=center>회원번호</th>
				<th width=150 align=center>아이디</th>
				<th width=200 align=center>이름</th>
				<th width=100 align=center>성별</th>
				<th width=200 align=center>생년월일</th>
				<th width=250 align=center>E-mail</th>
				<th width=100 align=center>권한</th>
				<th width=100 align=center>삭제</th>
			</tr>
			 <c:forEach var="vo" items="${list }">
				<tr>
				<td width=100 align=center>${vo.mem_no }</td>
				<td width=150 align=center>${vo.mem_id }</td>
				<td width=200 align=center>${vo.mem_name }</td>
				<td width=100 align=center>${vo.mem_sex }</td>
				<td width=200 align=center>${vo.mem_birth }</td>
				<td width=250 align=center>${vo.mem_email }</td>
				<td width=100 align=center>${vo.mem_type }</td>
				<td id="img" width=100 align=center><img src="images/admin_del.png" style="cursor:pointer" id="delete" onclick="idDelete('${vo.mem_id }');">
				<%-- <input type=button style="cursor:pointer" value="삭제" onclick="idDelete('${vo.mem_id }');"> --%></td>
				</tr>
			 </c:forEach>
			 
		</table>
		<div style="height:15px"></div>
            <div id="div" style="margin-left:730px;color:black;font-size: 12px">
             <a href="project.jsp?mode=5&page=${curpage>1?curpage-1:curpage }" class="page"><img src="images/back.png"></a>&nbsp;
             <a href="project.jsp?mode=5&page=${curpage<totalpage?curpage+1:curpage }" class="page"><img src="images/next.png"></a>&nbsp;&nbsp;
             <span>${curpage } page / ${totalpage } pages</span>
            </div>

	</center>
</body>
</html>