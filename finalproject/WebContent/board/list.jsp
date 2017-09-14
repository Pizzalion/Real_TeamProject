<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
    <%@ page import="com.sist.board.*,java.text.*" %>
    <jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>
    <%@taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
     <%
     String strPage=request.getParameter("page");
     if(strPage==null)
  	   strPage="1";
     int curpage=Integer.parseInt(strPage);
     List<BoardVO> list=dao.boardListData(curpage);
     int totalpage=dao.boardTotalPage();
     int count=dao.boardRowCount();
     count=count-((curpage*10)-10);
      %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ //window.onload=function(){}
	$('.dataTr').click(function(){
		var no=$(this).attr("no");
		var page=$(this).attr("page");
		//alert("no="+no+",page="+page);
		location.href="content.jsp?no="+no+"&page="+page;
	});
});
</script>
</head>
<body>
	<center>
		<h1>�Խ���</h1>
		<p>
		<table width=800>
		<tr>
			<th width=10%>��ȣ</th>
			<th width=45%>����</th>
			<th width=15%>�̸�</th>
			<th width=20%>�ۼ���</th>
			<th width=10%>��ȸ��</th>
		</tr>
		<%
			String msg="�����ڰ� ������ �Խù��Դϴ�";
			String s="";
			for(BoardVO vo:list){
				if(vo.getSubject().equals(msg))
					s="";
				else
					s="dataTr";
		%>
			<tr class="<%=s %>" no="<%=vo.getNo() %>" page="<%=curpage%>">
				<td width=10% align=center><%=count-- %></td>
				<td width=45% align=left>
				<%
					if(vo.getGroup_tab()>0){
						for(int i=0;i<vo.getGroup_tab();i++){
							out.println("&nbsp;&nbsp;");
						}
				%>
				<%		
					}
				%>
				<%=vo.getSubject() %>
					<%
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						String today=sdf.format(new Date());
						String dbday=sdf.format(vo.getRegdate());
						if(today.equals(dbday)){
					%>
						<sup><img src="image\reply.png"></sup>
					<%		
						}
					%>
				</td>
				<td width=15% align=center><%=vo.getName() %></td>
				<td width=20% align=center><%=vo.getRegdate().toString() %></td>
				<td width=10% align=center><%=vo.getHit() %></td>
			</tr>
		<%		
			}
		%>
		</table>
		<table width=800>
		<tr>
		<td align=left>
				<form method="post" action="find.jsp">
					Search:
					<select name=fs>
						<option value="name">�̸�</option>
						<option value="subject">����</option>
						<option value="content">����</option>
					</select>
				<input type=text name=ss size=13>
				<input type=hidden name=page value="<%=curpage %>">
				<input type=button value=submit>
					</form>
				</td>
			<td align=right>
				<a href="list.jsp?page=<%=curpage>1?curpage-1:curpage%>	">��</a>&nbsp;&nbsp;
				<a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage%> ">��</a>
				&nbsp;&nbsp;
				<%=curpage %> page / <%=totalpage %> pages
			</td>
		</tr>
		</table>
		<table>
			<tr>
				<td colspan=5 align=right>
				<a href="insert.jsp"><input type=button value="����">
				</a>
			</td>
			</tr>
		</table>
	</center>
</body>
</html>