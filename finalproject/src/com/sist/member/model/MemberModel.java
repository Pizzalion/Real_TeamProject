
package com.sist.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.*;
import com.sist.member.*;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.wedding.dao.ComVO;

import javafx.scene.control.Alert;



public class MemberModel {
	public void memberJoin(HttpServletRequest request)
	  {
		  request.setAttribute("main_jsp", "member/join.jsp");
	  }
	
	  public void memberIdCheck(HttpServletRequest request)
	  {
		  String mem_id=request.getParameter("mem_id");
		  MemberDAO dao=new MemberDAO();
		  int count=dao.memberIdcheck(mem_id);
		  request.setAttribute("count", count);
	  }
	  
	  public void mainContent(HttpServletRequest request) {
		  request.setAttribute("main_jsp", "main_content.jsp");
	  }
	  
	  public void isLogin(HttpServletRequest request) {
		  request.setAttribute("main_jsp", "member/login.jsp");
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
			  response.sendRedirect("../project.jsp");
		  }catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  }
		  
	  }
	  public void memberUpdate(HttpServletRequest request) {
		   request.setAttribute("main_jsp", "member/infoUpdate.jsp");
		 }
	  public void memberUpdateOk(MemberVO vo,HttpServletResponse response) {
		  MemberDAO dao=new MemberDAO();
		  dao.MemberUpdate(vo);
		  
		  try {
			  
			  response.sendRedirect("../project.jsp");
		  }catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  }
	  }
	  public void likepage(HttpServletRequest request) {
			 request.setAttribute("main_jsp", "likePage.jsp");
 	  }
	  public void cancelLike(HttpServletRequest request) {
		 MemberDAO dao =new MemberDAO();
		 HttpSession session=request.getSession();			 
		 String id =(String)session.getAttribute("id");
		 //String id =(String)request.getParameter("id");
		 String cno=(String)request.getParameter("no");
		 System.out.println(cno);
		 dao.deleteLikeData(id, cno);
	 }
	  public void getLikeData(HttpServletRequest request){
			 MemberDAO dao =new MemberDAO();
			 HttpSession session=request.getSession();			 
			 String id =(String)session.getAttribute("id");			 
			// List<ComVO> list = dao.memberLikeData(id);
			 
			 String strPage=request.getParameter("page");
			 if(strPage==null)
			 	strPage="1";
			 int curpage=Integer.parseInt(strPage);
	//		 Map map=new HashMap();
			 int rowSize=5;
			 int start=(curpage*rowSize)-(rowSize-1);
			 int end=curpage*rowSize;
			 /*map.put("start",start);
			 map.put("end",end);*/
			 
			// List<ComVO> list=dao.boardAllData(map);
			// request.setAttribute("list", list);
			 
			 List<ComVO> list = dao.memberLikeData(id,start,end);
			 
			 double a = dao.numMemberLikeData(id)/(double)rowSize; 
			// double b = dao.numMemberLikeData(id)/rowSize;
			 int totalpage = (int) Math.ceil(a);
			 //System.out.println(totalpage);
			 request.setAttribute("hlist", list); 			  
			 request.setAttribute("curpage", curpage);
			 request.setAttribute("totalpage", totalpage);
	 }
	  public void memberDelete(HttpServletRequest request) {
		  request.setAttribute("main_jsp", "member/mem_delete.jsp");
	  }
	  public void memberDeleteOk(HttpServletRequest request,HttpServletResponse response) {
		  	String strId=request.getParameter("mem_id");
			String pwd=request.getParameter("mem_pw");
			MemberDAO dao=new MemberDAO();
			boolean bCheck=dao.memberDelete(strId, pwd);
			try {
				if(bCheck==true){
					response.sendRedirect("../project.jsp");
				}else{
					response.sendRedirect("../main_content.jsp");		
			  }
			}catch(Exception ex) {
				System.out.println(ex.getMessage());
			}
	  }
	  public void admin(HttpServletRequest request) {
		  MemberDAO dao=new MemberDAO();
		  MemberVO vo=new MemberVO();
		  String page=request.getParameter("page");
			if(page==null)
				page="1";
		  int curpage=Integer.parseInt(page);
		  List<MemberVO> list=dao.boardListData(curpage);
		  int totalpage=dao.adminTotalPage();
		  /*List<MemberVO> list=dao.boardListData(Integer.parseInt(strPage));*/
		  request.setAttribute("list", list);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "member/admin_mem.jsp");
	  }
	  public void adminDelete(HttpServletRequest request,HttpServletResponse response) {
		  MemberDAO dao=new MemberDAO();
		  String strId=request.getParameter("mem_id");
		  dao.adminDelete(strId);
		  try {
			  response.sendRedirect("../project.jsp");
		  }catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  }
		  
	  } 
	
}