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
			alert("��й�ȣ�� Ȯ�����ֽʽÿ�.")
			
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
  <h3>��������/Ż��</h3>
   <form id="updateForm" action="member/infoUpdate_ok.jsp" name="updateForm" method=POST>
    <p>
    <label for="userid">���̵�</label>&nbsp;&nbsp;&nbsp;
    ${sessionScope.id }
    <input type=hidden name=mem_id id="userid" value="${sessionScope.id }">
    <!-- <input type=text name=mem_id id="userid" readonly required> -->
    </p>
    <p>
    <label for="userpwd">��й�ȣ</label>
    <input type=password name=mem_pw id="userpwd" required>
    <input type=password name=pwd1 id="userpwd1" placeholder="���Է�" required>
    </p>
    <p>
    <label for="username">�̸�</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${sessionScope.name }
    <!-- <input type=text name=mem_name id="username" required> -->
    </p>
    <p>
    <label for="usersex">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${sessionScope.sex }
    <!-- <input type=radio name=mem_sex value="����" checked>����
    <input type=radio name=mem_sex value="����">���� -->
    </p>
    <p>
    <label for="userdate">�������</label>
    ${sessionScope.birth }
     	<!-- <input type=date name="mem_birth" id="userdate" required> -->
    </p>
    <p>
    <label for="useremail">�̸���</label>&nbsp;&nbsp;&nbsp;
    <input type=text name="mem_email" id="useremail" >
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
     <input type=text id="userPhone1" name="mem_phone2">
     -
     <input type=text id="userPhone2" name="mem_phone3">
    </span>
    </p>
    <p class="btnSubmit">
     <input type=submit id="upBtn" style="cursor:pointer" value="����">
     <input type=button id="Cancel" style="cursor:pointer" value="���"
      onclick="javascript:history.back()">
      <a href="project.jsp?mode=4"><input type=button id="delBtn" style="cursor:pointer" value="ȸ��Ż��"></a>
    </p>
   </form>
  </div>
  </div>
  </center>
</body>
</html>