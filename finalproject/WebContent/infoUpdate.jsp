<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="ud" class="com.sist.member.model.MemberModel"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
	<div id="news_area">
  <div id="wrapper1">
   <form id="joinForm" action="infoUpdate_ok.jsp" name="updateForm" method=POST>
    <p>
    <label for="userid">���̵�</label>
    ${sessionScope.id }
    <!-- <input type=text name=mem_id id="userid" readonly required> -->
    
    
    </p>
    <p>
    <label for="userpwd">��й�ȣ</label>
    <input type=password name=mem_pw id="userpwd" required>
    <input type=password name=pwd1 id="userpwd1" placeholder="���Է�" required>
    </p>
    <p>
    <label for="username">�̸�</label>
    ${sessionScope.name }
    <!-- <input type=text name=mem_name id="username" required> -->
    </p>
    <p>
    <label for="usersex">����</label>
    <input type=radio name=mem_sex value="����" checked>����
    <input type=radio name=mem_sex value="����">����
    </p>
    <p>
    <label for="userdate" id=mem_birth name="birth">�������</label>
     	<input type=date name="mem_birth" id="userdate" required>
    </p>
    <p>
    <label for="useremail">�̸���</label>
    
     <input type=text name="mem_email" id="useremail" >
    </p>

    <p>
    <label>��ȭ</label>
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
     <input type=submit id="btnSub" value="����">
     <input type=button id="btnCan" value="���"
      onclick="javascript:history.back()">
    </p>
   </form>
  </div>
  </div>
</body>
</html>