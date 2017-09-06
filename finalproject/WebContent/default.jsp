<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="w3-container w3-padding-32" id="projects">
   <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">랭킹</h3>
  </div>
 
 <div class="w3-row-padding">
			<div class="w3-row-padding w3-grayscale">
				<c:forEach var="vo" items="${rList1 }">
			
					<div class="w3-col l3 m6 w3-margin-bottom">
						<a href="main_detail.jsp?mode=1&com_no=${vo.com_no }"> <img
							src="${vo.com_pic }" style="width: 100%; height: 195px;"></a>
						<h3>${vo.com_name }</h3>
						<p class="w3-opacity" style="height: 50px;">${vo.com_address }</p>
						<p>${vo.com_rank }</p>
						<p>
							<a href="main_detail.jsp?mode=301&com_no=${vo.com_no }"><button
									class="w3-button w3-light-grey w3-block">상세보기</button></a>
						</p>
					</div>
				</c:forEach>
				<div style="height: 15px" align="center"></div>
				<div
					style="margin-top: 430px; margin-left: 730px; color: black; font-size: 12px">
					<a href="project.jsp?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
					<a href="project.jsp?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
					${curpage } page / ${totalpage } pages
				</div>
				<div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">신랑, 신부 이용후기</h3> <a a href="project.jsp?mode=200" style="text-align:right"> 전체보기 </a> 
  </div>

 
  <div class="w3-row-padding w3-grayscale">
  
  <c:forEach var="vo" items="${rList }">	   
 
	<div class="w3-col l3 m6 w3-margin-bottom" >    
    <a href="#"> <img src="${vo.img_src }" height=200px; style="width:100%"></a>  
  
           <h4>${vo.review_title }</h4> 
           <p class="w3-opacity">${vo.review_regdate }   작성자:${vo.review_writer }</p>
          <p style="height:100px;">${vo.review_comment }</p> 
         <p>시설: ${vo.review_fscore } 교통: ${vo.review_tscore } 가격: ${vo.review_mscore } 음식: ${vo.review_pscore } 서비스: ${vo.review_sscore }</p>
         <p>평점: ${vo.review_ave }</p>     
          
         <p ><a href="project.jsp?mode=201&com_no=${vo.com_no }" ><button class="w3-button w3-light-grey w3-block"  >더보기</button></a></p>     
       </div> 
		
        </c:forEach>   
 
     </div> 

       <div style=" margin-left:530px ; color:black;font-size: 12px; margin-bottom:50px;">
           <a href="project.jsp?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
			<a href="project.jsp?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
            ${curpage } page / ${totalpage } pages
      </div>
     
			</div>
		</div> 

</body>
</html>