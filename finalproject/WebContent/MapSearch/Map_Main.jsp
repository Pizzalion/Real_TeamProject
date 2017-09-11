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
//��ũ��Ʈ�� �ٷ� ����帮�°��� ����� ������.
//���� �迭(xpArray), �浵 �迭(ypArray)�� �����ϰ� �װ��� ������� �־ ��Ī���ִ°� �ּ�~
var markers=[];
var markersArr=[];
var xpArray=[];
var ypArray=[];
var ia=0;
var sArr = ["������","������","���ϱ�","������","���Ǳ�","���ʱ�","���ϱ�","�߶���"];

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
	

//�� & ��Ŀ ǥ�� ����
function initMap() {
	
	//�����迭, �浵�迭 ������ ���ʴ�� �ֱ�
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
	
	
	
	
	var contentip='<div>'+'<h2>ȣ���̾�</h2>'+'<p>�������� ���ھ�</p>'+'<a href="http://www.naver.com">�̵�~</a>';
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
  	title:'����'
  });
  
  	for(var i=0;i<10;i++)
  	{
  		var solomarker = new google.maps.Marker({
  	 		position: markersArr[i],
  	 		map:map,
  	 		title:'���̿�'
  	 	});	
  	}
   
  	
  	
	//�迭�� �̿��Ͽ� ��Ŀ ���� input �� �ѷ��ֱ�
	//�����ʿ�
	
	addmark.setMap(map);
	solomarker.setMap(map);	
	google.maps.event.addListener(marker,'click',function(){
		infowindow.open(map,marker);
	});
}
//�� & ��Ŀ ǥ�� ��

//����Ʈ �� ��������
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
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">�����˻�</h3>
    <button class="w3-button w3-white">+</button>
    <p>�� ������ �������� ���� ���۵Ǿ��µ� � ������ �Ѹ����̱�</p>
   
  </div>
	����� ��õ ������ �ǰڳ�
  <div class="w3-row-padding">
  
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">��õ1</div>
        <img src="images/hall1.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">��õ2</div>
        <img src="images/hall4.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">��õ3</div>
        <img src="images/hall3.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">��õ4</div>
        <img src="images/hall2.jpg" alt="House" style="width:100%">
      </div>
    </div>
  </div>
  <div class="println"></div>
  <center>�����</center>
  
  <!-- codepen ��ó ���� -->
	<center>
	<table class="navi_table">
	<th><div class="wrapper">
			<div class="dropdownboxA">
  			<p>where do you live?</p>
			</div> 
			<ul class="menuA">
    			<li class="city">����</li>
    			<li class="city">���</li>
    			<li class="city">����</li>
    			<li class="city">���</li>
    			<li class="city">�泲</li> 
    			<li class="city">���</li>
    			<li class="city">�泲</li>
			</ul>	
			</div>
	</th>
	<th><div class="wrapperB">
			<div class="dropdownboxB">
  			<p>where do you live?</p>
			</div> 
			<ul class="menuB">
    			<li class=gugun>������</li>
    			<li class=gugun>������</li>
    			<li class=gugun>������</li>
    			<li class=gugun>���ϱ�</li>
    			<li class=gugun>���̱�</li> 
			</ul>	
			</div>
	</th>
	
			
	
		
	</table>
	</center>
  <!-- codepen ��ó ���� �� -->
  &nbsp;&nbsp;&nbsp;
  
  
  <div class="w3-row-padding">
  <!-- �ʵ��Ͷ� -->
  <center>
    <table class="map_table" >
    <tr>
    	<td align="center">Map Ŀ����!!!
    		<div id="map"></div>
    	</td>
    	<td align="center">���� ������ �ǳ�?</td>
    </tr>
    <tr>
    	<th rowspan="3">������ �Ʒ��� ��µǾ߰���</th>
    	<th>������</th>
    </tr>
    <tr>
    	<th>���������� ������</th>
    </tr>
    
    
     
    </table>
  </center>
  </div>
  <!-- �ʳ� -->


  <!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">���⿡ �� �ѷ��ٱ� ���õ�?</h3>
    <p> �� ������ �����ؼ� 7���� ����� �ʿ��� ������� ���� �ּž� �մϴ�. ���縦 �ص� �����ϴ�. Ȥ �̽��̶� �Ͻ��� ������ ����Դϴ�. 
    </p>
  </div>

  <div class="w3-row-padding w3-grayscale">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding1.jpg" alt="John" style="width:100%">
      <h3>John Doe</h3>
      <p class="w3-opacity">CEO & Founder</p>
      <p>�������� HGXWCH�̶�� ����� 1930�⿡ �� ������ �޾ҽ��ϴ�. �״� �񼭿��� �����ؼ� ������� �߽��ϴ�. ��ĥ �ڿ� ������ ��÷�Ǿ� 20���� �޾ҽ��ϴ�.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding2.jpg" alt="Jane" style="width:100%">
      <h3>Jane Doe</h3>
      <p class="w3-opacity">Architect</p>
      <p>� �̴� �� ������ �޾����� 96�ð� �̳� �ڽ��� �տ��� ������ �Ѵٴ� ����� �ؾ����ϴ�. �״� �� �����Ǿ����ϴ�. ���߿��� �� ����� �˰� 7���� ������ ���´µ� �ٽ� ���� ������ ������ϴ�.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding3.jpeg" alt="Mike" style="width:100%">
      <h3>Mike Ross</h3>
      <p class="w3-opacity">Architect</p>
      <p>�̱��� �ɳ׵� ������� �� ������ �޾����� �׳� ���Ƚ��ϴ�. �ᱹ 9�� �� �״� �ϻ� ���߽��ϴ�.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="images/wedding4.jpg" alt="Dan" style="width:100%">
      <h3>Dan Star</h3>
      <p class="w3-opacity">Architect</p>
      <p> ����� �ּ���. �� ������ ������ 7���� ����� ���� ���̰� �׷��� ������ 3���� ������ ���� ���Դϴ�. �׸��� �� ������ �����ų� ������ �ؼ��� ����� �ȵ˴ϴ�. 7���Դϴ�. �� ������ ���� ����� ����� ��� ���Դϴ�. ��������� ������ ���ٰ� �����ϼ���. 7���� ����� ���鼭..</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
  </div>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="contact">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
    <p>���� ����</p>
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
