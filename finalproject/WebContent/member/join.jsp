<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/join.css">
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
			content:'member/idcheck.jsp',
			title:'���̵� �ߺ�üũ',
			player:'iframe',
			width:380,
			height:200
		});
	});
$(function(){
	$('#btnSub').click(function(){
		if($('#userpwd').val()!=$('#userpwd1').val()){
			alert("��й�ȣ�� ��й�ȣ ���Է��� �ٸ��ϴ�.")
			focus.password;
			return false;
		}
	});
});
	
});
</script>
</head>
<body>
<center>
	<div id="news_area">
	  <div id="wrapper1">
	  <img src="images/logo.JPG">
	  <h3>ȸ������</h3><br>
	   <form id="joinForm" action="member/join_ok.jsp" name="joinForm" method=POST>
	    <p>
	    <label for="userid">���̵�</label>&nbsp;&nbsp;&nbsp;
	    <input type=text name=mem_id id="userid" readonly required>
	    <input type=button value="�ߺ�üũ" id="idBtn">
	    </p>
	    <p>
	    <label for="userpwd">��й�ȣ</label>
	    <input type=password name=mem_pw id="userpwd" required>
	    <input type=password name=pwd1 id="userpwd1" placeholder="���Է�" required>
	    </p>
	    <p>
	    <label for="username">�̸�</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type=text name=mem_name id="username" required>
	    </p>
	    <p>
	    <label for="usersex">����</label>&nbsp;
	    <input type=radio name=mem_sex value="����" checked>����
	    <input type=radio name=mem_sex value="����">����
	    </p>
	    <p>
	    <label for="userdate">�������</label>
	    <input type=date name="mem_birth" id="userdate" required>
	    </p>
	    <p>
	    <label for="useremail">�̸���</label>&nbsp;&nbsp;&nbsp;
	    <input type=text name="mem_email" id="useremail" required>
	    </p>
	
	    <p>
	    <label>��ȭ</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	     <input type=submit id="btnSub" style="cursor:pointer" value="ȸ������">
	     <input type=button id="btnCan" style="cursor:pointer" value="�������"
	      onclick="javascript:history.back()">
	    </p>
	   </form>
	  </div>
	  </div>
  </center>
</body>
</html>