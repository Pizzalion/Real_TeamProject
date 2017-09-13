<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="estimate/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#inwonBtn').click(function(){
		var person = $('#person').val();		//선택한 값 하나를 갖고 왔다
		//var no=$(this).attr("data-no");
		var data="";		
		if (person != 0){
			data+= "하객수: "+person+"명 ";
		}
		
		$('#esti_inwon').text(data);
		$('#esti_total').text("금액: "+totPrice+"원"); 
		
	
	 	 $.ajax({
	 			type:'post',
	 			url:'estimate/personInfo.jsp',
	 			data:{"com_no":totPrice},
	 			success:function(res)
	 			{
	 				$('#esti_total').text("금액: "+totPrice+"원");
	 			}
			 }); 
	 
	});
});
</script>
</head>
<body>
<table id="table_content" width=300>

		<tr>
			<td align="center" style="color:black">
			     인원수:<select id="person">
			    	<option value="" disabled selected>예상하객수</option>
					<option value="100">100명</option>
					<option value="200">200명</option>
					<option value="300">300명</option>
					<option value="400">400명</option>
					<option value="500">500명</option>
					<option value="700">500명 이상</option>
				</select>
				
				<button id="inwonBtn">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>