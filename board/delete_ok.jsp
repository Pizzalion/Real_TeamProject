<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>
<%
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
    String pwd=request.getParameter("pwd");
    
    // DB  ���� 
    boolean bCheck=dao.boardDelete(Integer.parseInt(strNo), pwd);
    // �̵� 2���� back() .. list.jsp
    if(bCheck==true)
    {
    	response.sendRedirect("list.jsp?page="+strPage);
    }
    else
    {
%>
      <script>
       alert("��й�ȣ�� Ʋ���ϴ�");
       history.back();
      </script>
<%
    }
    
%>


