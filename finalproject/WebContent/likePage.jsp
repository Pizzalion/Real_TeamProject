<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.wedding.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="mpage" class="com.sist.member.model.MemberModel"/>
 <jsp:useBean id="dao" class="com.sist.member.MemberDAO"/>
<%
mpage.getLikeData(request);  

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ġ</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var no=0;

$(function(){
	$('.unlike').click(function(){
       //var id = $(this).attr('idd');
       //alert('���');
	   var com_no = $(this).attr('no');
       //action
	   $('#cancel'+com_no).submit();
       //alert('����Ͻø� ������ϴ�.');		
	});
	$('.bookBtn').click(function(){
		if(no==0){
			no = $(this).attr('value');
			$('#okTr'+no).show();			
		} 
		else{
			$('#okTr'+no).hide();
			no = 0;
		}
	});
	$('.reserveBtn').click(function(){
		var cno = $(this).attr('no');
		$('#test'+cno).submit();
	});	
	$('.dataTd').click(function(){
		var cno=$(this).attr('value');
		location.href='main_detail.jsp?mode=1&com_no='+cno;
	});
	/* $('#pagebtn').click(function(){
		//var page = $(this).attr('page');
		$('#1').submit();
	}); */
});
</script>
</head>
<body>

<%-- <jsp:include page="header.jsp" /> --%>

<h1 align=center>�� ���</h1>
<hr/>
 <center>
 <div>
 	<table id=table_content width=900>
 	  <caption></caption>
 	  
			<tr ><!-- Ŭ���ϸ� �� �������� �̵� -->
				<th>Ȧ ����</th>
				<th>Ȧ ����</th>
				<th>�����û</th>
				<th>���</th>
			</tr>
		<c:forEach var="vo" items="${hlist }" >
	        <tr class='dataTr' >			
				<td align=center class=dataTd id="td1_${vo.com_no }" value="${vo.com_no }">
					<%-- <input type=hidden value="${vo.com_no }"> --%>
					<img width=200 alt="�׸�����" src="${vo.com_pic }">
				</td>
				<td class=dataTd id="tr2_${vo.com_no }" value="${vo.com_no }"> 
					 <h4>${vo.com_name }</h4>
					  �ּ�: ${vo.com_address }<br/>
					  �Ĵ�: ${vo.com_meal }<br/>
				 	 �ο�: ${vo.com_person }<br/>
				</td>
				<td align=center>
					<!-- <a href="#" ></a> -->
					<img alt="�������û" src="images/heart.PNG" width="50" height="30" class="bookBtn" value="${vo.com_no }">
				
				</td>
				<td align=center>
					<form method="post" action="likeCancel_ok.jsp" id="cancel${vo.com_no }" >
                	<input type="hidden" name=no value="${vo.com_no }">
                	<%-- <input type="hidden" name=mem_id value="${ }"> --%>
                	</form>
					<input type="button" class="unlike" value="���" no=${vo.com_no }>
				</td>
			</tr>

					<tr id="okTr${vo.com_no }" style="display: none">
						<td align=center colspan=4>
						   <form action="reserve/reserve_ok.jsp" method="post" id="test${vo.com_no }">
							<table id=none>
								<tr>
									<td>
									<input type=hidden name=hall_no value="${vo.com_no }">
									<input type=hidden name=mem_id>
									<label for="cdate">�������� : </label> 
									<input type=date name="bk_cday" id="consultDate" required></td>
									<td rowspan=2><label for="bk_ask">���ǻ��� :<br /></label></td>
									<td rowspan=2><textarea name="bk_ask" width=200></textarea>
									</td>
									<td rowspan=2><input type=button class="reserveBtn" value=Ȯ�� no="${vo.com_no }"></td>
								</tr>
								<tr>
									<td><label for="bdate">��翹���� : </label> 
									<input type=date name="bk_dday" id="bookDate" required></td>
								</tr>
							</table>
						   </form>	
						</td>
					</tr>
				</c:forEach>
		</table>
 
 </div>
 <div>
  <br/>
 <br/>
 </div>
 <div height = 100 margin=20>
 <a href="project.jsp?mode=104&page=${curpage>1?curpage-1:curpage }">
 <img src="images/back.png" id=pagebtn width=20 ></a>

 ${curpage } ������ / ${totalpage } ������ 

<a href="project.jsp?mode=104&page=${curpage<totalpage?curpage+1:curpage }">
<img src="images/next.png" id=pagebtn width=20 ></a>


 <br/>
 <br/>
</div>
 </center>
</body>
</html>