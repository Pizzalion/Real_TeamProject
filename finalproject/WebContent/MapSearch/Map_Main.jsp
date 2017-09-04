<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYYzTU3uaJxbwIHrK1o288ybGFbEYA5qo&callback=initMap"
    async defer></script>
<script type="text/javascript">
function initMap() {
	var test = {lat: 37.525845, lng: 127.054128}
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: test
  });
  var marker = new google.maps.Marker({
  	position: test,
  	map: map
  });
}


</script>
<style>
 #map {
       height: 400px;
       width: 70%;
       }
</style>

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
  
  <div class="w3-row-padding">
  <!-- �ʵ��Ͷ� -->
  <center>
    <table id="map_table" border="2" width=1000 height=600>
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
    <p>������ ǳ���̳�</p>
    <form action="/action_page.php" target="_blank">
      <input class="w3-input" type="text" placeholder="Name" required name="Name">
      <input class="w3-input w3-section" type="text" placeholder="Email" required name="Email">
      <input class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject">
      <input class="w3-input w3-section" type="text" placeholder="Comment" required name="Comment">
      <button class="w3-button w3-black w3-section" type="submit">
        <i class="fa fa-paper-plane"></i> SEND MESSAGE
      </button>
    </form>
  </div>
  

</div>
	
	
	
	
</body>
</html>