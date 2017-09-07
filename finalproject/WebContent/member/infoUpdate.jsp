<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/update.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#upBtn').click(function(){
		var id=$('#userid').val();
		var pwd=$('#userpwd').val();
		/* alert(pwd); */
		$('#updateForm').submit();
	});
});
$(function(){
	$('#upBtn').click(function(){
		if($('#userpwd').val()!=$('#userpwd1').val()){
			alert("비밀번호를 확인해주십시요.")
			
		}
	});
});
</script>
</head>
<body>
<center>
	<div id="news_area">
  <div id="wrapper1">
  <img src="images/logo.JPG">
  <h3>정보수정/탈퇴</h3>
   <form id="updateForm" action="member/infoUpdate_ok.jsp" name="updateForm" method=POST>
    <p>
    <label for="userid">아이디</label>&nbsp;&nbsp;&nbsp;
    ${sessionScope.id }
    <input type=hidden name=mem_id id="userid" value="${sessionScope.id }">
    <!-- <input type=text name=mem_id id="userid" readonly required> -->
    </p>
    <p>
    <label for="userpwd">비밀번호</label>
    <input type=password name=mem_pw id="userpwd" required>
    <input type=password name=pwd1 id="userpwd1" placeholder="재입력" required>
    </p>
    <p>
    <label for="username">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${sessionScope.name }
    <!-- <input type=text name=mem_name id="username" required> -->
    </p>
    <p>
    <label for="usersex">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${sessionScope.sex }
    <!-- <input type=radio name=mem_sex value="남자" checked>남자
    <input type=radio name=mem_sex value="여자">여자 -->
    </p>
    <p>
    <label for="userdate">생년월일</label>
    ${sessionScope.birth }
     	<!-- <input type=date name="mem_birth" id="userdate" required> -->
    </p>
    <p>
    <label for="useremail">이메일</label>&nbsp;&nbsp;&nbsp;
    <input type=text name="mem_email" id="useremail" >
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
     <input type=text id="userPhone1" name="mem_phone2">
     -
     <input type=text id="userPhone2" name="mem_phone3">
    </span>
    </p>
    <p class="btnSubmit">
     <input type=submit id="upBtn" style="cursor:pointer" value="수정">
     <input type=button id="Cancel" style="cursor:pointer" value="취소"
      onclick="javascript:history.back()">
      <a href="project.jsp?mode=4"><input type=button id="delBtn" style="cursor:pointer" value="회원탈퇴"></a>
    </p>
   </form>
  </div>
  </div>
  </center>
</body>
</html>