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
			$('#log_frm').submit(); // ������ ����(login.jsp����)
									// action="../member/login.jsp" 
		});
	});
</script>
</head>
<body>
<center>
	<div class="loginForm">
        <form method="post" name="id" action="login_1.jsp" id="log_frm">
            <div class="box">
            <input type="text" class="iText" id="id" name="id">
            <br>
            <input type="password" name="pwd" id="pwd" class="iText">
            <br>
            <p>
             <span class="fleft"><input type="checkbox" id=""><label for="">���̵� ����</label></span>
              <span class="fright"><a href="" style="text-decoration: none">���̵� ã��</a>&nbsp;|&nbsp;<a href="" style="text-decoration: none">��й�ȣ ã��</a></span>
            </p>
          </div>
          <input type=button id="loginBtn" class="loginBtn" value="�α���" style="text-decoration: none">
        </form>
      </div>
      </center>
      
</body>
</html>