<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->

<script type="text/javascript">
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
		$('#idDialog').dialog({
			autoOpen:false,
			width:450,
			height:200,
			modal:true,
			buttons:[
				{
					text:'���̵�ã��',
					click:function(){
						var email=$('#searchEmail').val();
						
						  /* alert("email="+email);   */
						if(email.trim()==""){
							alert("Email�� �Է����ּ���.")
							$('#searchEmail').focus();
							return;
						}
						$.ajax({
							type:'POST',
							 url:'member/idSearch.jsp', 
							data:{"email":email},
							success:function(response){   
			  					var data=response.trim();
			  					 
			  					  /* alert(data);  */
								var msg="";
									if(data==null){
										msg="��ġ�ϴ� ID�� �����ϴ�.";
										var html="<td align=center colspan=2><input type=button id=ok value=OK onclick=ok()></td>";
										$('#IDOK').html(html);
									}else{
										msg="����� ID��"+data+"�Դϴ�.";
									}
									$('#idResult').text(msg);
									/*
										text() ==> getter
										text("aaa") ==> setter
									*/
							}
						});
					}
				},
				{
					text:'���',
					click:function(){
						$(this).dialog("close");
					}
				}
			]
		
		});
		$('#idSearch').click(function(){
			$('#idDialog').dialog('open');
		});
		$('#pwdDialog').dialog({
			autoOpen:false,
			width:550,
			height:350,
			modal:true,
			buttons:[
				{
					text:'��й�ȣã��',
					click:function(){
						
						var id=$('#searchId').val();
						/* alert("id="+id); */
						if(id.trim()==""){
							$('#searchId').focus();
							return;
						}
						var name=$('#searchName').val();
						/* alert("id="+id); */
						if(name.trim()==""){
							$('#searchName').focus();
							return;
						}
						$.ajax({
							type:'POST',
							 url:'member/pwdSearch.jsp', 
							data:{"id":id,"name":name},
							success:function(response){   
			  					var data=response.trim();
			  					 /* alert(data);  */
								var msg="";
									if(data==null){
										msg="ID�� �̸��� �ٽ� Ȯ���� �ֽʽÿ�.";
										var html="<td align=center colspan=2><input type=button id=ok value=OK onclick=ok()></td>";
										$('#PWDOK').html(html);
									}else{
										msg="����� ��й�ȣ�� "+data+"�Դϴ�.";
									}
									$('#pwdResult').text(msg);
									/*
										text() ==> getter
										text("aaa") ==> setter
									*/
							}
						});
					}
				},
				{
					text:'���',
					click:function(){
						$(this).dialog("close");
					}
				}
			]
		
		});
		$('#pwdSearch').click(function(){
			$('#pwdDialog').dialog('open');
		});
	});
</script>
</head>
<body>
<center>
	<div class="loginForm">
        <form method="post" name="id" action="member/login_ok.jsp" id="log_frm">
            <div class="box">
            <input type="text" class="iText" id="id" name="id" placeholder="ID�� �Է��ϼ���.">
            <br>
            <input type="password" name="pwd" id="pwd" class="iText" placeholder="��й�ȣ�� �Է��ϼ���.">
            <br>
             <p>
             <!-- <span class="fleft"><input type="checkbox" id=""><label for="">���̵� ����</label></span> -->
              <span class="fright">
              <a style="cursor:pointer" id="idSearch">���̵� ã��</a>&nbsp;|&nbsp;
              <a style="cursor:pointer" id="pwdSearch">��й�ȣ ã��</a></span>
            </p> 
          </div>
          <input type=button id="loginBtn" class="loginBtn" value="�α���" style="text-decoration: none">
        </form>
      </div>
      <div id="idDialog" title="���̵�ã��">
	  	<table id="table_content" width=200>
			<tr>
				<td width=20% align=center>Email:&nbsp;</td>
				<td width=80% align=left>
					<input type=text name=searchEmail size=30 id="searchEmail" placeholder="Email�ּҸ� �Է����ּ���.">
					<!-- <input type=button value="�ߺ�üũ" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td align=center id="idResult" colspan="2"></td>
			</tr>
			<tr id="IDOK">
				
			</tr>
		</table>
	  </div>
	  <div id="pwdDialog" title="��й�ȣã��">
	  	<table id="table_content" width=300>
			<tr>
				<td width=20% align=center>ID:&nbsp;</td><br>
					<td width=80% align=left>
					<input type=text name=id size=30 id="searchId" placeholder="ID�� �Է����ּ���.">
					<!-- <input type=button value="�ߺ�üũ" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td width=20% align=center>�̸�:&nbsp;</td><br>
					<td width=80% align=left>
					<input type=text name=name size=30 id="searchName" placeholder="�̸��� �Է����ּ���.">
					<!-- <input type=button value="�ߺ�üũ" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td align=center id="pwdResult" colspan="2"></td>
			</tr>
			<tr id="PWDOK">
				
			</tr>
		</table>
	  </div>
      </center>
      
</body>
</html>