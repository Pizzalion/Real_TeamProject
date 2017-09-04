package com.sist.main.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.main.dao.CompanyVO;
import com.sist.main.dao.RankingDAO;

public class CompanyModel {
	public void companyDetailData(HttpServletRequest request){
		
		String no=request.getParameter("com_no");
		int com_no=Integer.parseInt(no);
		RankingDAO dao=new RankingDAO();
		CompanyVO vo=dao.companyDetailData(com_no);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "main_Detail.jsp");
		
	}
}
