<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
    <jsp:useBean id="dao" class="com.sist.board.BoardDAO"/>
    <%-- BoardDAO dao=new BoardDAO()
    			useBean => �޸� �Ҵ�(��ü����)
     --%>
     <%
     	request.setCharacterEncoding("EUC-KR");
     //�ѱ� ��ȯ �ڵ�
     /*
     	POST : request.setCharacterEncoding("EUC-KR")
     	GET : server.xml => URIEncoding="EUC-KR"
     */
     %>
     <%-- ����� ��û�� �ޱ� --%>
     <jsp:useBean id="vo" class="com.sist.board.BoardVO">
     	<jsp:setProperty name="vo" property="*"/>
     </jsp:useBean>
     <%
     	 // DB => �����͸� �߰�
     	 String pno=request.getParameter("pno");
     	 String strPage=request.getParameter("page");
     	  dao.boardReply(Integer.parseInt(pno),vo);
     	// vo�� �����ϴ� ������ ���� �� �ִ�
     	// vo�� ���� ������ ������ �޾ƾ� �Ѵ� => getParameter()
     	//form�±� ���� �ַ� ���
     	response.sendRedirect("list.jsp");
     %>
