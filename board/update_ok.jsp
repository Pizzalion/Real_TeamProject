<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>

<%
	//�ѱۺ�ȯ
	request.setCharacterEncoding("EUC-KR");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	String strNo=request.getParameter("no");
	String strPage=request.getParameter("page");
	
	BoardVO vo=new BoardVO();
	vo.setNo(Integer.parseInt(strNo));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);

	
	//Database�� ����
	// BoardDAO dao=new BoardDAO();
	boolean bCheck=dao.replyBoardUpdate(vo);
	
	if(bCheck==true){
		response.sendRedirect("content.jsp?no="+strNo+"&page="+strPage);
	}else{
%>
<script type="text/javascript">
	alert("��й�ȣ�� Ʋ���ϴ�");
	history.back();
</script>
<%		
	}
%>
