<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="fm" class="com.sist.wedding.manager.ReviewModel"/>
<%
	request.setCharacterEncoding("EUC-KR");  
	fm.findReview(request);
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*  $(function(){
	
	$('#findBtn').click(function(){
		var dong = $('#dong').val();	//input type의 내용을 읽으려면 val()임.
		if(dong.trim()==""){
			$('#print').html("<center>동/읍/면을 입력하세요</center>");
			$('#dong').focus();
			return;
		}
	
	});
}); */	
</script>
</head>
<body>
	
	<div class="w3-row-padding w3-grayscale" style="width:75%; margin-left:200px"  >
	<h2>웨딩홀 회원 리뷰</h2>
	<p>총 1,073건의 검색결과</p><p align="right">
	<a href="#">최신순 </a>|<a href="#"> 조회순 </a> | <a href="#">평점순</p></a>
		
		<table id="table_content" width=600>
			<tr>
				<td align=left>
				<form id="findForm" method="post" action="project.jsp?mode=206"> 
			
				<select name=fs id="fs"> 	
				<option value="review_title">홀이름</option>

				<option value="review_comment">내용</option>
				 </select> 
				<input type=text name=ss size=13 id="ss">
				<button class="w3-button" value=검색 id="findBtn">검색</button>
				
				 </form>
			</td>
		
			</tr>		
		</table>
		<div id="print"></div>
		
		<ul class="w3-ul w3-card-4">
			  <c:forEach var="vo" items="${rAllList }">  

				<li class="w3-bar" style="height: 180px">
				<!-- <span onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×
					</span> -->
					 <!-- 홀목록=>hover효과주기 --> 
					<!-- 여기에 list를 셋어트리뷰투 -->
					 <a href="project.jsp?mode=201&com_no=${vo.com_no }">
					    <div style="width: 200px">
							<img src="${vo.img_src }"
								class="w3-bar-item w3-circle w3-hide-small"
								style="height: 150px; width: 180px">
						</div>

						<div class="w3-bar-item" style="width: 75%">
							<span class="w3-large">${vo.review_title }</span><br>
							<!-- 홀이름 -->
						 ${vo.review_regdate } ${vo.review_writer }<br> 
							<!-- 작성일, 작성자 -->
							<span>${vo.review_comment }</span><br> 
							<!-- 리뷰 -->
							<p>시설: ${vo.review_fscore } 교통: ${vo.review_tscore } 가격:
								${vo.review_mscore } 음식: ${vo.review_pscore } 서비스:
								${vo.review_sscore } &nbsp; 평점: ${vo.review_ave }</p> 
						</div> 
						</a>
						</li>

			  </c:forEach>  
		</ul>

		<div
			style="margin-left: 530px; margin-top: 30px; color: black; font-size: 12px;margin-bottom:50px;">
			<a href="project.jsp?page=${curpage>1?curpage-1:curpage }&mode=200">이전</a>&nbsp;
			<a href="project.jsp?page=${curpage<totalpage?curpage+1:curpage }&mode=200">다음</a>&nbsp;&nbsp;
			${curpage } page / ${totalpage } pages
		</div>
	</div>

</body>

</html>