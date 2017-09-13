<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style5.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
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
			$('#log_frm').submit(); // 데이터 전송(login.jsp한테)
									// action="../member/login.jsp" 
		});
		 $('#idDialog').dialog({
			autoOpen:false,
			width:450,
			height:200,
			modal:true,
			buttons:[
				{
					text:'아이디찾기',
					click:function(){
						var email=$('#searchEmail').val();
						
						  /* alert("email="+email);   */
						if(email.trim()==""){
							alert("Email을 입력해주세요.")
							$('#searchEmail').focus();
							return;
						}
						$.ajax({
							type:'POST',
							 url:'member/idSearch.jsp', 
							data:{"email":email},
							success:function(response){   
			  					var data=response.trim();
			  					 
			  					   /* alert(data); */  
								var msg="";
									if(data==""){
										msg="일치하는 ID가 없습니다.";
										var html="<td align=center colspan=2><input type=button id=ok value=OK onclick=ok()></td>";
										
									}else{
										msg="당신의 ID는"+data+"입니다.";
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
					text:'취소',
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
					text:'비밀번호찾기',
					click:function(){
						
						var id=$('#searchId').val();
							if(id.trim()==""){
							$('#searchId').focus();
							return;
						}
							var question=$('#searchQuestion').val();
							if(question.trim()==""){
							$('#searchQuestion').focus();
							return;
						}
							var answer=$('#searchAnswer').val();
							if(answer.trim()==""){
							$('#searchAnswer').focus();
							return;
						}
						
						 /* var name=$('#searchName').val();
							if(name.trim()==""){
							$('#searchName').focus();
							return; 
						} */
						$.ajax({
							type:'POST',
							 url:'member/pwdSearch.jsp', 
							data:{"id":id,"question":question,"answer":answer},
							success:function(response){   
			  					var data=response.trim();
			  					   /* alert(data);    */
								var msg="";
									if(data==""){
										msg="ID 또는 질문 및 답변이 틀렸습니다.";
										var html="<td align=center colspan=2><input type=button id=ok value=OK onclick=ok()></td>";
										
									}else{
										msg="당신의 비밀번호는 "+data+"입니다.";
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
					text:'취소',
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
        <div class="container">
           
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">	<!-- animate form -->
                        <div id="login" class="loginForm">
                            <form method="post" name="id" id="log_frm" action="member/login_ok.jsp" autocomplete="on"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname"> Your ID </label>
                                    <input id="id" name="id" required="required" type="text" placeholder="ID를 입력해주세요."/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd"> Your password </label>
                                    <input id="pwd" name="pwd" required="required" type="password" placeholder="암호를 입력해주세요." /> 
                                </p>
                                <a style="cursor:pointer" id="idSearch" style="text-decoration: none">아이디찾기</a>&nbsp;&nbsp;
                                <a style="cursor:pointer" id="pwdSearch" style="text-decoration: none">비밀번호찾기</a>
                                <!-- <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p> -->
                                <p class="login button"> 
                                    <input type=button id="loginBtn" class="loginBtn" value="로그인" /> 
								</p>
                                <p class="change_link">
									아직 회원이 아니십니까?
									<a href="project.jsp?mode=2" class="to_register">회원가입</a>
								</p>
								
                            </form>
                        </div>

                        <!-- <div id="register" class="animate form">
                            <form  action="mysuperscript.php" autocomplete="on"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div> -->
						
                    </div>
                </div>  
            </section>
        </div>
        <div id="idDialog" title="아이디찾기">
	  	<table id="table_content" width=200>
			<tr>
				<td width=20% align=center>Email:&nbsp;</td>
				<td width=80% align=left>
					<input type=text name=searchEmail size=30 id="searchEmail" placeholder="Email주소를 입력해주세요.">
					<!-- <input type=button value="중복체크" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td align=center id="idResult" colspan="2"></td>
			</tr>
			<tr id="IDOK">
				
			</tr>
		</table>
	  </div>
	  <div id="pwdDialog" title="비밀번호찾기">
	  	<table id="table_content" width=300>
			<tr>
				<td width=20% align=center>ID:&nbsp;</td><br>
					<td width=80% align=left>
					<input type=text name=id size=30 id="searchId" placeholder="ID를 입력해주세요.">
					<!-- <input type=button value="중복체크" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td width=20% align=center>질문:&nbsp;</td><br>
					<td width=80% align=left>
					<select id="searchQuestion" name=question>
			      <option>당신의 졸업한 초등학교의 이름은?</option>
			      <option>가장 존경하는 인물은?</option>
			      <option>가장 친한 친구의 이름은?</option>
			      <option>가장 좋아하는 음식은?</option>
			      <option>가장 친한 친구의 이름은?</option>
			     </select>
					<!-- <input type=select name=question size=30 id="searchQuestion"> -->
					<!-- <input type=button value="중복체크" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td width=20% align=center>답:&nbsp;</td><br>
					<td width=80% align=left>
					<input type=text name=answer size=30 id="searchAnswer" placeholder="답변을 입력해주세요.">
					<!-- <input type=button value="중복체크" id="checkBtn"> -->
				</td>
			</tr>
			<tr>
				<td align=center id="pwdResult" colspan="2"></td>
			</tr>
			<tr id="PWDOK">
				
			</tr>
		</table>
	  </div>
    </body>
</html>