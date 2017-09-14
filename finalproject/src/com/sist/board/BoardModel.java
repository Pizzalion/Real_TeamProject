package com.sist.board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardModel {
	public void  boardAllData(HttpServletRequest request) {
		String strPage=request.getParameter("page");
	
	if(strPage==null) {
			strPage="1";
	}
	int curpage=Integer.parseInt(strPage);
			//현재 보고 있는 페이지
	BoardDAO dao=new BoardDAO();
	List<BoardVO> list=dao.boardListData(curpage);
	int totalpage=dao.boardTotalPage();
	
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(date);
	String dbday=sdf.format("regdate");
	if(today.equals(dbday)) {
	request.setAttribute("list", list);
	request.setAttribute("curpage", curpage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("list_jsp", "content.jsp");
	}
}
	
	
	 
	public void boardContentData(HttpServletRequest request) {
		// java => jsp 전송 : request
		// java => java : 매개변수 (Call By Reference, Call By Value)
		// jsp => jsp	: GET,POST
		String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.boardContentData(Integer.parseInt(strNo));	
		
		request.setAttribute("vo", vo);
		request.setAttribute("strPage", strPage);
		request.setAttribute("list_jsp", "content.jsp");
	}
	public void boardFindData(HttpServletRequest request) {
		
		String fs=request.getParameter("fs");
		String ss=request.getParameter("ss");
		BoardDAO dao=new BoardDAO();
		List<BoardVO> list=dao.boardFindData(fs, ss);
		String strPage=request.getParameter("page");
		
		request.setAttribute("list", list);
		request.setAttribute("strPage", strPage);
  
	}
	public void boardInsertData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		//Database로 전송
		BoardDAO dao=new BoardDAO();
		dao.boardInsert(vo);
		//화면 이동
		response.sendRedirect("list.jsp");
		request.setAttribute("name", name);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		request.setAttribute("pwd", pwd);
	}
	public void boardUpdateData(HttpServletRequest request) {
		String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
		//DB연동
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.boardUpdateData(Integer.parseInt(strNo));
		
		request.setAttribute("strNo", strNo);
		request.setAttribute("strPage", strPage);
		request.setAttribute("vo", vo);
		
	}
	public void replyBoardUpdate(HttpServletRequest request, HttpServletResponse response) {
		
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
		//Database로 전송
		BoardDAO dao=new BoardDAO();
		boolean bCheck=dao.replyBoardUpdate(vo);
		
		if(bCheck==true){
			try {
				response.sendRedirect("content.jsp?no="+strNo+"&page="+strPage);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
	}
}
	public void boardDeleteData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 요청값 받기 ==>request
		String strNo=request.getParameter("no");
		String strPage=request.getParameter("page");
		// 이동
		String pwd=request.getParameter("pwd");
		// 데이터베이스 연동 ==> DAO
		BoardDAO dao=new BoardDAO();
		boolean bCheck=dao.boardDelete(Integer.parseInt(strNo),pwd);
		// 화면 이동 ==> response
		if(bCheck==true){
			//list 이동
			response.sendRedirect("list.jsp?page+strPage");
		}else{
			//content 이동
			request.setAttribute("strNo", strNo);
			request.setAttribute("strPage", strPage);
	}
	}
}
