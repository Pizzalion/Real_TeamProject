<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});
$(function(){
	$('#idBtn').click(function(){
		Shadowbox.open({
			content:'idcheck.jsp',
			title:'아이디 중복체크',
			player:'iframe',
			width:380,
			height:200
		});
	});
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'postfind.jsp',
			title:'우편번호 검색',
			player:'iframe',
			width:460,
			height:350
		});
	});
});
</script>
</head>
<body>
<div id="news_area">
  <div id="wrapper1">
   <form id="joinForm" action="join_ok.jsp" name="joinForm" method=POST>
    <p>
    <label for="userid">아이디</label>
    <input type=text name=mem_id id="userid" readonly required>
    <input type=button value="중복체크" id="idBtn">
    </p>
    <p>
    <label for="userpwd">비밀번호</label>
    <input type=password name=mem_pw id="userpwd" required>
    <input type=password name=pwd1 id="userpwd1" placeholder="재입력" required>
    </p>
    <p>
    <label for="username">이름</label>
    <input type=text name=mem_name id="username" required>
    </p>
    <p>
    <label for="usersex">성별</label>
    <input type=radio name=mem_sex value="남자" checked>남자
    <input type=radio name=mem_sex value="여자">여자
    </p>
    <p>
    <label for="userdate">생년월일</label>
    <input type=date name="mem_birth" id="userdate" required>
    </p>
    <p>
    <label for="useremail">이메일</label>
    <input type=text name="mem_email" id="useremail">
    </p>

    <p>
    <label>전화</label>
    <span class="cellStyle">
     <select id="userPhone" name="mem_phone1">
      <option>010</option>
      <option>011</option>
      <option>017</option>
     </select>
     -
     <input type=text id="userPhone1" name="mem_phone2">
     -
     <input type=text id="userPhone2" name="mem_phone3">
    </span>
    </p>
    <p class="btnSubmit">
     <input type=submit id="btnSub" value="회원가입">
     <input type=button id="btnCan" value="가입취소"
      onclick="javascript:history.back()">
    </p>
   </form>
  </div>
  </div>
</body>
</html>