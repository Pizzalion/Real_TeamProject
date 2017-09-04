<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="rm" class="com.sist.movie.model.ReserveModel"/>
<%
   rm.reserve_mypage(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../reserve/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var past=0;
var now=0;
$(function(){
	$('.dataTr').click(function(){
		
		now=$(this).attr('va');
		//past=now;
		if(past!=0){
			$('#m'+past).hide();
			past=now;			
		}
		//alert(now);
		$('#m'+now).show();
		//$('.rc').text("닫기");
	});
});
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
	 <table id="table_content" width=750>
	 	<tr>
	 		<th>번호</th>
	 		<th>영화명</th>
	 		<th>극장명</th>
	 		<th>예약일</th>
	 		<th>시간</th>
	 		<th>인원</th>
	 		<th>금액</th>
	 		<th>상태</th>
	 		<th>비고/취소</th>
	 	</tr>
	 	<c:forEach var="vo" items="${list }">
	 	<tr class="dataTr" va="${vo.no }">
	 	  <td align=center>${vo.no }</td>
	 	  <td align=center>${vo.title }</td>
	 	  <td align=center>${vo.theater }</td>
	 	  <td align=center>${vo.resday }</td>
	 	  <td align=center>${vo.restime }</td>
	 	  <td align=center>${vo.inwon }</td>
	 	  <td align=center>${vo.price }</td>
	 	  <td align=center>${vo.reserve==0? "예약대기":"예약완료" }</td>
	 	  <td align=center>	 	
         <c:if test="${vo.reserve==1 }">
          <a href="" value="${vo.no }" class="rc"></a>&nbsp;
         </c:if>
         <a href="../reserve/reserve_cancel.jsp?no=${vo.no }">예매취소</a>
	 	  </td>
	 	</tr>
	 	<tr id="m${vo.no }" style="display:none">
	 		<td align=left valign=top colspan=9>
	 			<h3>예매내역</h3>
	 			예매번호: ${vo.no }<br/>
	 			영화명: ${vo.title }<br/>
	 			극장명: ${vo.theater }<br/>
	 			예매일: ${vo.resday }<br/>
	 			예매시간: ${vo.restime }<br/>
	 			예매인원: ${vo.inwon }<br/>
	 			예매금액: ${vo.price }<br/>
	 		</td>
	 	</tr>
	 	</c:forEach>
	 </table> 
	 </div>
	</center>
</body>
</html>