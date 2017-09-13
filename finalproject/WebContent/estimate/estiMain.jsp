<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="estimate/table.css">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'estimate/hallInfo.jsp',
		success:function(res)
		{
			$('#hallInfo').html(res);
		}
	});
	$('#okBtn').css("cursor","pointer");
	$('#okBtn').click(function(){
		/* 오케이버튼에서 직접 form으로 걸어줬음
			이 상황에서는 Ajax를 쓸 수 없음. 다 include되어 있는 상태여가지고...
			예약선택된것들을 form태그로,hidden으로 감춰서 넘길거고 마이페이지 화면을 요기다가 include시킬거야
		*/
		$('#rfrm').submit();	//submit 버튼 대신에도 이렇게 쓸 수 있음.
	});
	
	
});


</script>
<body>
 <center>
  <div id="news_area">
  
  <table id="table_content" width=800 height=400>
   <tr>
    <td width=300 height=280 valign="top">
     <table id="table_content" width=300>
      <tr>
       <th>웨딩홀정보</th>
      </tr>
    </table>
    <div style="overflow-y:scroll; width:300px; height:250px;" id="hallInfo" > </div>  
    </td>
    
    <td width=300 height=280 valign="top">    
      <table id="table_content" width=300>
      <tr>
       <th valign="top">내부홀정보</th>
      </tr>
     </table>
     <div style="overflow-y:scroll; width:300px; height:250px;" id="innerHallInfo" ></div>
    </td>
   

     <td width=400 height=400 rowspan="2" valign="top">
      <table id="table_content" width=400>
      <tr>
       <th valign="top">견적정보</th>
      </tr>
     </table>
    
     
     <table id="table_content" style="width:400; margin-bottom:200px;">
      <tr>
       <td align=center>
        <img src="" width=160 height=200 id="esti_img">
       </td>
      </tr>
      <tr>
       <td align=center>
         <span id="esti_title" style="color:black;"></span>
       </td>
      </tr>
      <tr>
       <td align="left" style="width:400px;">
         <span id="esti_innerhall" style="color:black;">홀 이름: </span>
       </td>
      </tr>
      <tr>
 
       <td align="left">
         <span id="esti_hallprice" style="color:black;">홀 가격: </span>
       </td>
      </tr>
      <tr>
       <td align="left">
         <span id="esti_opt" style="color:black;">옵션명: </span>
       </td>
      </tr>
      <tr>
       <td align="left">
         <span id="esti_inwon" style="color:black;">하객수: </span>
       </td>
      </tr>
      <tr>
       <td align="left">
         <span id="esti_total" style="color:black;">금액:</span>
       </td>
      </tr>
      
     <tr id="okTr" style="display:none"> 
       <td align="center">
			<form method="post" action="../estimate/esti_ok.jsp" id="rfrm">
				<!-- <img src="../reserve/reserve_btn.PNG" id="okBtn"> -->
				<button class="w3-button w3-black w3-round-large" id="okBtn">견적 담기</button>
				<input type="hidden" name="com" value="" id="com">
				<input type="hidden" name="hall" value="" id="hall">
				<input type="hidden" name="option" value="" id="option">
				<input type="hidden" name="inwon" value="" id="inwon">
				<input type="hidden" name="price" value="" id="price">
				<input type="hidden" name="price" value="" id="price">

			</form>
     
       </td>
      </tr>
      
     </table>
    </td>
   </tr>
   <tr>
  
    <td  height=120 valign="top">
      <table id="table_content" width=300>
      <tr>
       <th valign="top">옵션정보</th>
      </tr>
     </table>
     <div style="overflow-y:scroll; width:300px; height:100px;" id="optionInfo" ></div>
    </td>
    <td width=300 height=120 valign="top">
      <table id="table_content" width=300>
      <tr>
       <th valign="top">인원정보</th>
      </tr>
     </table> 
     <div style="overflow-y:scroll; width:300px; height:100px;" id="personInfo" ></div>
    </td>
   </tr>
  </table>
  </div>
  </center>

</body>
</html>


