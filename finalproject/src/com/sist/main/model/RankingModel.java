package com.sist.main.model;
import javax.servlet.http.*;

import com.sist.main.dao.CompanyVO;
import com.sist.main.dao.RankingDAO;

import java.util.*;
public class RankingModel {
	//µÇ´Â°Å
	public void rankingMainListData(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		RankingDAO dao=new RankingDAO();
		List<CompanyVO> rList1=dao.rankingMainListData(curpage);
		//List<CompanyVO> cList=dao.rankingMainListData(curpage); 
		int totalpage=dao.rankingMainTotalPage();
		request.setAttribute("rList1", rList1);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "default.jsp");
	}
	
	public void rankingListData(HttpServletRequest request) {
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		RankingDAO dao=new RankingDAO();
		List<CompanyVO> rList1=dao.rankingListData(curpage);
		int totalpage=dao.rankingTotalPage();
		request.setAttribute("rList1", rList1);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "ranking.jsp");
	}
	
}
