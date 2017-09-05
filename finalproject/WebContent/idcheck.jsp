<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<style type="text/css">
	td{
		color:white;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('#checkBtn').click(function(){
			var id=$('#id').val();
			if(id.trim()==""){
				$('#id').focus();
				return;
			}
			$.ajax({
				type:'POST',
				url:'idcheck_result.jsp',
				data:{"id":id},
				success:function(response){
					var count=response.trim();
					/*
						var i=10 => int
						var i="aaa" => String
						var i=10.5 => double
						var i=[] => array
						var i={} => object
						var i={no:1,name:"aaa",sex:"man"}
							=> i.no
							=> i.name
							=> i.sex => JSON (자바스크립트 데이터 표현법)
							
							text() => aaa
							html() => <span>aaa</span>
							attr("href") 
					*/
					var data="";
						if(count==0){
							data=id+"는(은) 사용가능한 ID입니다.";
							var html="<td align=center><input type=button id=ok value=OK onclick=ok()></td>"
							$('#ok').html(html);
						}else{
							data=id+"는(은) 이미 사용중인 ID입니다.";
						}
						$('#result').text(data);
						/*
							text() ==> getter
							text("aaa") ==> setter
						*/
				}
			});
		});
	});
function ok(){
	parent.joinForm.mem_id.value=$('#id').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<center>
	
		<table id="table_content" width=350>
			<tr>
				<td width=20% align=center>ID</td>
				<td width=80% align=left>
					<input type=text name=id size=12 id="id">
					<input type=button value="중복체크" id="checkBtn">
				</td>
			</tr>
			<tr>
				<td align=center id="result"></td>
			</tr>
			<tr id="ok">
				
			</tr>
		</table>
		
	</center>
</body>
</html>