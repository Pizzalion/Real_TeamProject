<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.mapsearch.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<GPSVO> glist = MapSearchDAO.realizeGPS();
	request.setAttribute("glist", glist);
	
	int i=0;
	String[] xp={"","","","","","","","","","","","","","","","","","","",""};
	String[] yp={"","","","","","","","","","","","","","","","","","","",""};
	
	for(GPSVO vo : glist)
	{
		String x2 = vo.getX_p();
		String y2 = vo.getY_p();
	
		xp[i] = x2;
		yp[i] = y2;
		
		System.out.println("gpsvo():"+x2 +" : "+y2);
		System.out.println("xp["+i+"]:"+xp[i]+"/ yp["+i+"]:"+yp[i]);
		i++;
		
	}
	
	String x1 = xp[0];
	String y1 = yp[0];
	
%>
<c:set var="xpoint" value="<%=xp %>"/>
<c:set var="ypoint" value="<%=yp %>"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYYzTU3uaJxbwIHrK1o288ybGFbEYA5qo&callback=initMap"
    async defer></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script type="text/javascript">
//스크립트로 바로 끌어드리는것은 방법이 없었음.
//위도 배열(xpArray), 경도 배열(ypArray)을 선언하고 그곳에 순서대로 넣어서 매칭해주는게 최선~
var markers=[];
var markersArr=[];
var xpArray=[];
var ypArray=[];
var ia=0;
var sArr = ["강남구","강동구","강북구","강서구","관악구","서초구","성북구","중랑구"];

$(document).ready(function(){
	
	  $(".dropdownboxA").click(function(){
	    $(".menuA").toggleClass("showMenu");
	      $(".menuA > li").click(function(){
	        $(".dropdownboxA > p").text($(this).text());
	        $(".menuA").removeClass("showMenu");
	      });
	  });
	});
$(document).ready(function(){
	  $(".dropdownboxB").click(function(){
	    $(".menuB").toggleClass("showMenu");
	      $(".menuB > li").click(function(){
	        $(".dropdownboxB > p").text($(this).text());
	        $(".menuB").removeClass("showMenu");
	      });
	  });
	});
	

//맵 & 마커 표시 시작
function initMap() {
	
	//위도배열, 경도배열 각각에 차례대로 넣기
markersArr[0] = new google.maps.LatLng(<%=xp[0]%>,<%=yp[0]%>);
markersArr[1] = new google.maps.LatLng(<%=xp[1]%>,<%=yp[1]%>);
markersArr[2] = new google.maps.LatLng(<%=xp[2]%>,<%=yp[2]%>);
markersArr[3] = new google.maps.LatLng(<%=xp[3]%>,<%=yp[3]%>);
markersArr[4] = new google.maps.LatLng(<%=xp[4]%>,<%=yp[4]%>);
markersArr[5] = new google.maps.LatLng(<%=xp[5]%>,<%=yp[5]%>);
markersArr[6] = new google.maps.LatLng(<%=xp[6]%>,<%=yp[6]%>);
markersArr[7] = new google.maps.LatLng(<%=xp[7]%>,<%=yp[7]%>);
markersArr[8] = new google.maps.LatLng(<%=xp[8]%>,<%=yp[8]%>);
markersArr[9] = new google.maps.LatLng(<%=xp[9]%>,<%=yp[9]%>);
markersArr[10] = new google.maps.LatLng(<%=xp[10]%>,<%=yp[10]%>);
	
	
	var test = {lat: 37.325845, lng: 127.154128}
	var test2 = new google.maps.LatLng(37.575930,127.154545);
	var test3 = new google.maps.LatLng(<%=x1%>,<%=y1%>);
	
	
	
	
	var contentip='<div>'+'<h2>호텔이얌</h2>'+'<p>나왔으면 좋겠어</p>'+'<a href="http://www.naver.com">이동~</a>';
	var infowindow = new google.maps.InfoWindow({
			content: contentip,
			maxWidth:300
	});
	
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: test
  });
  var marker = new google.maps.Marker({
  	position: test,
  	map: map,
  	title:'기준'
  });
  
  	for(var i=0;i<10;i++)
  	{
  		var solomarker = new google.maps.Marker({
  	 		position: markersArr[i],
  	 		map:map,
  	 		title:'빛이여'
  	 	});	
  	}
   
  	
  	
	//배열을 이용하여 마커 정보 input 및 뿌려주기
	//구성필요
	
	addmark.setMap(map);
	solomarker.setMap(map);	
	google.maps.event.addListener(marker,'click',function(){
		infowindow.open(map,marker);
	});
}
//맵 & 마커 표시 끝

//리스트 값 가져오기
$(function(){
	var list1="", list2="",list3="";
	$('.menuA .city').click(function(){
		list1=$(this).text();
		$('.println').text(list1);
	});
});



</script>
<style>
 #map {
       height:300px;
       width:70%;
       }
</style>

<link rel="stylesheet" href="MapSearch/css/sb_style.css">


</head>
<body>
	
	<div class="w3-content w3-padding" style="max-width:1300px">

  <!-- Project Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">지도검색</h3>
    <button class="w3-button w3-white">+</button>
    <p>이 편지는 영국으로 부터 시작되었는데 어떤 내용을 뿌릴껌미까</p>
   
  </div>
	여기는 추천 넣으면 되겠네
  <div class="w3-row-padding">
  
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">추천1</div>
        <img src="images/hall1.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">추천2</div>
        <img src="images/hall4.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">추천3</div>
        <img src="images/hall3.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">추천4</div>
        <img src="images/hall2.jpg" alt="House" style="width:100%">
      </div>
    </div>
  </div>
  <div class="println"></div>
  <center>여기야</center>
  
  <!-- codepen 출처 셀박 -->
	<center>
	<table class="navi_table">
	<th><div class="wrapper">
			<div class="dropdownboxA">
  			<p>where do you live?</p>
			</div> 
			<ul class="menuA">
    			<li class="city">서울</li>
    			<li class="city">경기</li>
    			<li class="city">강원</li>
    			<li class="city">충북</li>
    			<li class="city">충남</li> 
    			<li class="city">경북</li>
    			<li class="city">경남</li>
			</ul>	
			</div>
	</th>
	<th><div class="wrapperB">
			<div class="dropdownboxB">
  			<p>where do you live?</p>
			</div> 
			<ul class="menuB">
    			<li class=gugun>강동구</li>
    			<li class=gugun>강서구</li>
    			<li class=gugun>강남구</li>
    			<li class=gugun>강북구</li>
    			<li class=gugun>어이구</li> 
			</ul>	
			</div>
	</th>
	
			
	
		
	</table>
	</center>
  <!-- codepen 출처 셀박 끝 -->
  &nbsp;&nbsp;&nbsp;
  
  
  <div class="w3-row-padding">
  <!-- 맵들어와라 -->
  <center>
    <table class="map_table" >
    <tr>
    	<td align="center">Map 커져랏!!!
    		<div id="map"></div>
    	</td>
    	<td align="center">구군 들어오면 되나?</td>
    </tr>
    <tr>
    	<th rowspan="3">지도쪽 아래에 출력되야겠지</th>
    	<th>오른쪽</th>
    </tr>
    <tr>
    	<th>오른쪽으로 꺼지렴</th>
    </tr>
    
    
     
    </table>
  </center>
  </div>
  <!-- 맵끝 -->


  <!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">여기에 뭘 뿌려줄까 도시들?</h3>
    <p> 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 
    </p>
  </div>

  <div class="w3-row-padding w3-grayscale">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding1.jpg" alt="John" style="width:100%">
      <h3>John Doe</h3>
      <p class="w3-opacity">CEO & Founder</p>
      <p>영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding2.jpg" alt="Jane" style="width:100%">
      <h3>Jane Doe</h3>
      <p class="w3-opacity">Architect</p>
      <p>어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding3.jpeg" alt="Mike" style="width:100%">
      <h3>Mike Ross</h3>
      <p class="w3-opacity">Architect</p>
      <p>미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살 당했습니다.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding4.jpg" alt="Dan" style="width:100%">
      <h3>Dan Star</h3>
      <p class="w3-opacity">Architect</p>
      <p> 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들 것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
  </div>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="contact">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
    <p>과연 오나</p>
    <form action="/action_page.php" target="_blank">
      <table>
      <c:forEach var="vo" items="${glist }">
      	<tr>
      		<th>x: ${vo.x_p }</th>
      	</tr>
      	<tr>
      		<th>y: ${vo.y_p }</th>
      	</tr>
      </c:forEach>
      </table>
      
      
      <button class="w3-button w3-black w3-section" type="submit">
        <i class="fa fa-paper-plane"></i> SEND MESSAGE
      </button>
    </form>
  </div>
  	

</div>
	
	
	
	
</body>
</html>
