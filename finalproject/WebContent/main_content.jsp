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
	 <div class="w3-content w3-padding" style="max-width:1300px">

  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Projects</h3> <button class="w3-button w3-white">+</button>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint
      occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
      laboris nisi ut aliquip ex ea commodo consequat.
    </p>
   
  </div>

  <div class="w3-row-padding">
  
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Summer House</div>
        <img src="images/hall1.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Brick House</div>
        <img src="images/hall4.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Renovated</div>
        <img src="images/hall3.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Barn House</div>
        <img src="images/hall2.jpg" alt="House" style="width:100%">
      </div>
    </div>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Summer House</div>
        <img src="images/hall4.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Brick House</div>
        <img src="images/wedding1.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Renovated</div>
        <img src="images/hall3.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Barn House</div>
        <img src="images/hall4.jpg" alt="House" style="width:99%">
      </div>
    </div>
  </div> 

  <!-- 리뷰 리스트 -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">신랑, 신부 이용후기</h3>
    <p>  </p>
  </div>

  <div class="w3-row-padding w3-grayscale">
     <c:forEach var="vo" items="${rList }">  
      
      <div class="w3-col l3 m6 w3-margin-bottom" >
       <a href="#">
        <img src="images/hall1.jpg" height=200px; style="width:100%"></a> 
          <h4>${vo.review_title }</h4> 
           <p class="w3-opacity">${vo.review_regdate }   작성자:${vo.review_writer }</p>
           <p>${vo.review_comment }</p> 
         <p>시설: ${vo.review_fscore } 교통: ${vo.review_tscore } 가격: ${vo.review_mscore } 음식: ${vo.review_pscore } 서비스: ${vo.review_sscore }</p>
         <p>평점: ${vo.review_ave }</p>     
         <p>${vo.com_no }</p>   
         <p ><a href="project.jsp?mode=201&com_no=${vo.com_no }" ><button class="w3-button w3-light-grey w3-block"  >더보기</button></a></p> 
       </div> 

        </c:forEach>    
  
     </div> 

       <div style=" margin-left:530px ; color:black;font-size: 12px; margin-bottom:50px;">
            <a href="main.jsp?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
            <a href="main.jsp?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
            ${curpage } page / ${totalpage } pages
      </div>
     
  
  </div> 

   
  
  </div>


</div>

</body>
</html>