<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script>
	$(function(){
		$('#loginBtn').click(function(){
			var id=$('#id').val();
			var pwd=$('#pwd').val();
			if(id.trim()==""){
				$('#id').focus();
				return;
			}
			if(pwd.trim()==""){
				$('#pwd').focus();
				return;
			}
			$('#log_frm').submit(); // 데이터 전송(login.jsp한테)
									// action="../member/login.jsp" 
		});
	});
</script>
</head>
<body>
<center>
 <div class="w3-container w3-padding-32" id="projects">
   <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">로그인</h2>
  </div> 
  
	<div class="loginForm">
        <form method="post" name="id" action="member/login_1.jsp" id="log_frm">
            <div class="box">
            <input type="text" class="iText" id="id" name="id">
            <br>
            <input type="password" name="pwd" id="pwd" class="iText">
            <br>
            <!-- <p>
             <span class="fleft"><input type="checkbox" id=""><label for="">아이디 저장</label></span>
              <span class="fright"><a href="" style="text-decoration: none">아이디 찾기</a>&nbsp;|&nbsp;<a href="" style="text-decoration: none">비밀번호 찾기</a></span>
            </p> -->
          </div>
          <div>
          <input type=button id="loginBtn" class="loginBtn" value="로그인" style="text-decoration: none">
          </div>
        </form>
      </div>
      </center>
      
</body>
</html>