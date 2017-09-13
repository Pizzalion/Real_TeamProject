<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="css/style4.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
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


      <article class="container">
        <div class="page-header">
          <h1>회원가입 <small>Sign Up</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="joinForm" action="member/join_ok.jsp" name="joinForm" method=post>
          <div class="form-group">
              <label>ID</label>
              <div class="input-group">
                <input type="text" class="form-control" id="userid" name=mem_id placeholder="ID를 입력해주세요." readonly required>
                <span class="input-group-btn">
                <input type=button id="idBtn" class="btn btn-success" value="중복체크">
                  <!-- <button id="idBtn" class="btn btn-success" value="중복체크">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button> -->
                </span>
              </div>
            </div>
            <!-- <div class="form-group">
              <label for="InputEmail">ID</label>
              <input type="text" class="form-control" id="userid" name=mem_id placeholder="ID를 입력해주세요." style="width:80%" readonly required>
              <input type=button id="idBtn" class="btn btn-success" value="중복체크" style="width:20%" style="float:right">
            </div> -->
            <div class="form-group">
              <label>비밀번호</label>
              <input type="password" class="form-control" id="userpwd" name=mem_pw placeholder="비밀번호" required>
            </div>
            <div class="form-group">
              <label>비밀번호 확인</label>
              <input type="password" class="form-control" id="userpwd1" name=pwd1 placeholder="비밀번호 확인" required>
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label>이름</label>
              <input type="text" class="form-control" id="username" name=mem_name placeholder="이름을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label>성별</label>&nbsp;
              <input type=radio name=mem_sex value="남자" checked>남자
	   		  <input type=radio name=mem_sex value="여자">여자
            </div>
            <div class="form-group">
              <label>휴대폰</label>
              <div class="input-group">
              	<select id="userPhone" name="mem_phone1" class="form-control" style="width:30%">
			      <option>010</option>
			      <option>011</option>
			      <option>017</option>
			     </select>
                <!-- <input type="tel" class="form-control" id="username" placeholder="- 없이 입력해 주세요" style="width:30%"> -->
                <input type="text" id="userPhone1" name="mem_phone2" class="form-control" style="width:30%">
                <input type="text" id="userPhone2" name="mem_phone3" class="form-control" style="width:30%">
              </div>
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="text" class="form-control" id="usermail" name=mem_email placeholder="Email을 입력해주세요." style="width:100%" required>
            </div>
            <div class="form-group">
              <label>생년월일</label>
              <input type="date" class="form-control" id="userdate" name=mem_birth required>
            </div>
            <label for="InputPassword1">* 다음은 비밀번호 찾기용 질문입니다.</label>
            <div class="form-group">
              <label>질문</label>
              <div class="input-group">
              	<select id="userQuestion" name="mem_question" class="form-control">
			      <option>당신의 졸업한 초등학교의 이름은?</option>
			      <option>가장 존경하는 인물은?</option>
			      <option>가장 친한 친구의 이름은?</option>
			      <option>가장 좋아하는 음식은?</option>
			      <option>가장 친한 친구의 이름은?</option>
			     </select>
                
              </div>
            </div>
            <div class="form-group">
              <label>답변</label>
              <input type="text" class="form-control" id="userAnswer" name=mem_answer placeholder="답변을 입력해주세요." required>
            </div>
            <div class="form-group text-center">
            	<input type=submit id="btnSub" class="btn btn-info" style="cursor:pointer" value="회원가입">
            	<input type=button id="btnCan" class="btn btn-warning" style="cursor:pointer" value="가입취소"
	      onclick="javascript:history.back()">
              <!-- <button type="submit" id="btnSub" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" id="btnCan" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button> -->
            </div>
          </form>
        </div>
		
        
      </article>
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
      
      

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    Include all compiled plugins (below), or include individual files as needed
    <script src="js/bootstrap.min.js"></script> -->
  </body>
</html>