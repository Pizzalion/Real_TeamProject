<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="om" class="com.sist.wedding.manager.EstiModel" />
<%
	om.estiOptionData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="estimate/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var price=0;
	var price2=0;
	var totPrice=0;
	$('#optionBtn').click(function(){ 	
 		
	//$('.opTr').click(function(){
 	 	var items='';
 	 	var no=$(this).attr("data-no");	
		var eitem='';		
	 		$('input:checkbox[name="optbox"]').each(function(){
			
	 			if(this.checked==true)
	 			{
	 						
	 			   items+=$(this).val()+",";
	 			   eitem=$(this).val();
	 			  //가격부분만 추출
	 			   price=eitem.substring(eitem.indexOf('(')+1, eitem.indexOf('원'));
	 			   //숫자만추출
	 			   //Number로 형변환
	 			  price2+=Number(price.replace(/[^0-9]/g,''));
	 				//이거 더하기 홀대관비 해야함
	 			} 	 				 			
	 		});		 	
	 			 
	 		totPrice=hall_price2+price2;
		    $('#esti_opt').text("옵션명: "+items); 
	 		$('#esti_total').text("금액: "+totPrice+"원"); 
			
		
 				
 			 $.ajax({
	 			type:'post',
	 			url:'estimate/personInfo.jsp',
	 			data:{"com_no":totPrice},
	 			success:function(recvData)
	 			{
	 				$('#personInfo').html(recvData);
	 			}
 			 }); 
 		/*  	 $.ajax({
 	 			type:'post',
 	 			url:'estimate/personInfo.jsp',
 	 			data:{"com_no":totPrice},
 	 			success:function(res)
 	 			{
 	 				
 	 			}
  			 });  */
 	
 	}); 		
	
}); 
</script>
</head>
<body>
	<table id="table_content" width=300>
		<c:forEach var="vo" items="${list }" varStatus="status">
			 <p>
		  	<input class="dataTr opTr" class="w3-check" type="checkbox" name="optbox" data-no="on${vo.opt_no }" value=" ${vo.opt_name } | ${vo.opt_sel } ( ${vo.opt_price } ) ">	
		  	<span style="color:black;" id="oo${vo.opt_no }"> ${vo.opt_name } | ${vo.opt_sel } ( ${vo.opt_price } )</span>
		  	</p> 
		  
		</c:forEach>
			<button id="optionBtn">확인</button>
	</table>

</body>
</html>