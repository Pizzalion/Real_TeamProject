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
		var person = $('#person').val();		//������ �� �ϳ��� ���� �Դ�
		//var no=$(this).attr("data-no");
		var data="";		
		if (person != 0){
			data+= "�ϰ���: "+person+"�� ";
		}
		
		$('#esti_inwon').text(data);
		$('#esti_total').text("�ݾ�: "+totPrice+"��"); 
		
	
	 	 $.ajax({
	 			type:'post',
	 			url:'estimate/personInfo.jsp',
	 			data:{"com_no":totPrice},
	 			success:function(res)
	 			{
	 				$('#esti_total').text("�ݾ�: "+totPrice+"��");
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
			     �ο���:<select id="person">
			    	<option value="" disabled selected>�����ϰ���</option>
					<option value="100">100��</option>
					<option value="200">200��</option>
					<option value="300">300��</option>
					<option value="400">400��</option>
					<option value="500">500��</option>
					<option value="700">500�� �̻�</option>
				</select>
				
				<button id="inwonBtn">Ȯ��</button>
			</td>
		</tr>
	</table>
</body>
</html>