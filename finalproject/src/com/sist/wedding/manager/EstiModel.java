package com.sist.wedding.manager;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.wedding.dao.ComVO;
import com.sist.wedding.dao.EstiVO;
import com.sist.wedding.dao.InnerHallVO;
import com.sist.wedding.dao.OptVO;
import com.sist.wedding.dao.ReviewVO;
import com.sist.wedding.dao.WeddingDAO;

public class EstiModel {
	 public void estiMain(HttpServletRequest request)
	  {
		  request.setAttribute("main_jsp", "/estimate/estiMain.jsp");
	  }
	public void EstiListData(HttpServletRequest request) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);

		WeddingDAO dao = new WeddingDAO();
		List<OptVO> eList = dao.estiListData(curpage, 10);
		int totalpage = dao.estiTotalPage();

		request.setAttribute("eList", eList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "/estimate/estiList.jsp");
	}
	/*������ ����Ȧ ����*/
	public void EstiDetailData(HttpServletRequest request) {
		
		String com_no=request.getParameter("com_no");		
		WeddingDAO dao = new WeddingDAO();
		ComVO vo = dao.WeddingDetailData(Integer.parseInt(com_no));	
		//System.out.println(com_no);
		request.setAttribute("vo", vo);		
		request.setAttribute("main_jsp", "/estimate/estiDetail.jsp");
	}
	/*estiOption �̶� �Ȱ��� */
	public void sampleEstiData(HttpServletRequest request) {
		String no = request.getParameter("com_no");
		System.out.println("s1"+no);
		
		WeddingDAO dao=new WeddingDAO();
		String max_no=dao.estiMaxOption(Integer.parseInt(no));
		List<OptVO> slist=dao.optionListData(Integer.parseInt(no), Integer.parseInt(max_no),1);
		System.out.println("s2"+max_no);
		
		request.setAttribute("slist", slist);
		request.setAttribute("main_jsp", "/estimate/estiDetail.jsp");
				/*Ȧ�ѹ��� �޾Ƽ� �ɼ�����ϱ�*/ 
	}
	
	/*����Ȧ ����*/
	public void estiComData(HttpServletRequest request) {
		WeddingDAO dao=new WeddingDAO();
		List<ComVO> list=dao.estiComListData();
		request.setAttribute("list", list);
	}
	/*Ȧ ���� ����*/
	public void estiInnerHallData(HttpServletRequest request) {
		String com_no= request.getParameter("com_no");
		WeddingDAO dao=new WeddingDAO();
		InnerHallVO vo=dao.reserveInnerHallInfo(Integer.parseInt(com_no));
		
		request.setAttribute("vo", vo);
	}
	
	/*�ɼ� ����*/
	public void estiOptionData(HttpServletRequest request) {
		String com_no=request.getParameter("com_no");
		WeddingDAO dao=new WeddingDAO();
		String max_no=dao.estiMaxOption(Integer.parseInt(com_no));
		
		List<OptVO> list=dao.optionListData(Integer.parseInt(com_no), Integer.parseInt(max_no),0);
		
		request.setAttribute("list", list);
	}
	
	public void esti_ok(EstiVO vo, HttpServletResponse response) {
		WeddingDAO dao=new WeddingDAO();
		dao.myEstiInsert(vo);
		try {
			response.sendRedirect("../main/movie_main.jsp?mode=4");
		}catch(Exception e) {
			
		}
	}

}