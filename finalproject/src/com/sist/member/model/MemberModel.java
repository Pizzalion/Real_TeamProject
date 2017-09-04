
package com.sist.member.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.member.*;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;

import javafx.scene.control.Alert;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.*;
import com.sist.member.*;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.wedding.dao.HallVO;

import com.sist.wedding.dao.ReviewVO;
import com.sist.wedding.dao.WeddingDAO;

import javafx.scene.control.Alert;



public class MemberModel {
	public void memberJoin(HttpServletRequest request)
	  {
		  request.setAttribute("asdfasdf", "join.jsp");
	  }
	
	  public void memberIdCheck(HttpServletRequest request)
	  {
		  String mem_id=request.getParameter("mem_id");
		  MemberDAO dao=new MemberDAO();
		  int count=dao.memberIdcheck(mem_id);
		  request.setAttribute("count", count);
	  }
	  /*메인페이지 하단 리뷰*/
	  public void mainContent(HttpServletRequest request) {
		 // request.setAttribute("asdfasdf", "main_content.jsp");
			/*String page=request.getParameter("page");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			WeddingDAO dao=new WeddingDAO();
			List<ReviewVO> rList=dao.reviewListData(curpage, 4);
			int totalpage=dao.reviewTotalPage();
			
			request.setAttribute("rList", rList);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("asdfasdf", "main_content.jsp");*/

	  }
	  
	  public void isLogin(HttpServletRequest request) {
		  request.setAttribute("asdfasdf", "login.jsp");
	  }
	  public void memberLogin(HttpServletRequest request) {
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  
		  // DB 연동
		  MemberDAO dao=new MemberDAO();
		  MemberVO vo=dao.isLogin(id, pwd);
		  
		  
		  
		  if(vo.getMsg().equals("OK")) {
			  HttpSession session=request.getSession(); //session 생성
			  // session,cookie => request로 생성
			  session.setAttribute("id", vo.getMem_id());
			  session.setAttribute("name", vo.getMem_name());
			  session.setAttribute("admin", vo.getMem_type());
			  session.setAttribute("birth", vo.getMem_birth());
			  
			  
			  
			  
			  
		  }
		  request.setAttribute("res", vo.getMsg());
	  }
	  
	  public void memberJoinOk(MemberVO vo,HttpServletResponse response) {
		  MemberDAO dao=new MemberDAO();
		  dao.memberInsert(vo);
		  try {
			  response.sendRedirect("project.jsp");
		  }catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  }
		  
	  }
	  public void memberUpdate(HttpServletRequest request) {
		   request.setAttribute("asdfasdf", "infoUpdate.jsp");
		 }
	  public void memberUpdateOk(MemberVO vo,HttpServletResponse response) {
		  MemberDAO dao=new MemberDAO();
		  
		//dao.MemberUpdate(vo);
		  
		  try {
			  
			  response.sendRedirect("project.jsp");
		  }catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  }
	  }
	  public void likepage(HttpServletRequest request) {
			 request.setAttribute("asdfasdf", "likePage.jsp");
		 }
		 public void getLikeData(HttpServletRequest request){
			 MemberDAO dao =new MemberDAO();
			 HttpSession session=request.getSession();
			 String id =(String)session.getAttribute("id");
			 //System.out.println(id.toString());
			 List<HallVO> list = dao.memberLikeData(id);
			 request.setAttribute("hlist", list); 
		 }
}

