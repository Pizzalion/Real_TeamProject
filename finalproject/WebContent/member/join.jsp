<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/join.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<style>
@import "table.css"
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css"> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<!-- <script type="text/javascript" src="shadow/js/shadowbox.js"></script> -->
<script type="text/javascript">
/* Shadowbox.init({
	players:["iframe"]
}); */
$(function(){
/* 	$('#idBtn').click(function(){
		Shadowbox.open({
			content:'member/idcheck.jsp',
			title:'아이디 중복체크',
			player:'iframe',
			width:380,
			height:200
		});
	}); */
	$('#dialog').dialog({
		autoOpen:false,
		width:450,
		height:250,
		modal:true,
		buttons:[
			{
				text:'중복체크',
				click:function(){
					
					var id=$('#id').val();
					/* alert("id="+id); */
					if(id.trim()==""){
						$('#id').focus();
						return;
					}
					$.ajax({
						type:'POST',
						 url:'member/idcheck_result.jsp', 
						data:{"id":id},
						success:function(response){   
		  					var count=response.trim();
		  					/* alert(count); */
							var data="";
								if(count==0){
									data=id+"는(은) 사용가능한 ID입니다.";
									var html="<td align=center colspan=2><input type=button id=ok value=OK onclick=ok()></td>";
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
				}
			},
			{
				text:'취소',
				click:function(){
					$(this).dialog("close");
				}
			}
		]
	
	});
	$('#idBtn').click(function(){
		$('#dialog').dialog('open');
	});

$(function(){
	$('#btnSub').click(function(){
		if($('#userpwd').val()!=$('#userpwd1').val()){
			alert("비밀번호와 비밀번호 재입력이 다릅니다.")
			$('#userpwd').focus();
			return false;
		}
	});
});
	
});
function ok(){
	parent.joinForm.mem_id.value=$('#id').val();
	jQuery('#dialog').dialog('close');

	
}
</script>
</head>
<body>
<center>
	<div id="news_area">
	  <div id="wrapper1">
	  <img src="images/logo.JPG">
	  <h3>회원가입</h3><br>
	   <form id="joinForm" action="member/join_ok.jsp" name="joinForm" method=POST>
	    <p>
	    <label for="userid">아이디</label>&nbsp;&nbsp;&nbsp;
	    <input type=text name=mem_id id="userid" readonly required>
	    <input type=button value="중복체크" id="idBtn">
	    </p>
	    <p>
	    <label for="userpwd">비밀번호</label>
	    <input type=password name=mem_pw id="userpwd" required>
	    <input type=password name=pwd1 id="userpwd1" placeholder="재입력" required>
	    </p>
	    <p>
	    <label for="username">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type=text name=mem_name id="username" required>
	    </p>
	    <p>
	    <label for="usersex">성별</label>&nbsp;
	    <input type=radio name=mem_sex value="남자" checked>남자
	    <input type=radio name=mem_sex value="여자">여자
	    </p>
	    <p>
	    <label for="userdate">생년월일</label>
	    <input type=date name="mem_birth" id="userdate" required>
	    </p>
	    <p>
	    <label for="useremail">이메일</label>&nbsp;&nbsp;&nbsp;
	    <input type=text name="mem_email" id="useremail" required>
	    </p>
	
	    <p>
	    <label>전화</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <span class="cellStyle">
	     <select id="userPhone" name="mem_phone1">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	     </select>
	     -
	     <input type=text id="userPhone1" name="mem_phone2" required>
	     -
	     <input type=text id="userPhone2" name="mem_phone3" required>
	    </span>
	    </p>
	    <p class="btnSubmit">
	     <input type=submit id="btnSub" style="cursor:pointer" value="회원가입">
	     <input type=button id="btnCan" style="cursor:pointer" value="가입취소"
	      onclick="javascript:history.back()">
	    </p>
	   </form>
	  </div>
	  </div>
	  <div id="dialog" title="중복체크">
	  	<table id="table_content" width=350>
			<tr>
				<td width=20% align=center>ID</td>
				<td width=80% align=left>
					<input type=text name=id size=20 id="id">
					<!-- <input type=button value="중복체크" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td align=center id="result" colspan="2"></td>
			</tr>
			<tr id="ok">
				
			</tr>
		</table>
	  </div>
  </center>
</body>
</html>