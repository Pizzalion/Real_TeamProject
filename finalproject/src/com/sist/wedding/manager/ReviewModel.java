package com.sist.wedding.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.wedding.dao.ComVO;
import com.sist.wedding.dao.ReviewVO;
import com.sist.wedding.dao.WeddingDAO;


public class ReviewModel {
	public void ReviewListData(HttpServletRequest request){
	String page=request.getParameter("page");
	if(page==null)
		page="1";
	int curpage=Integer.parseInt(page);
	WeddingDAO dao=new WeddingDAO();
	List<ReviewVO> rList=dao.reviewListData(curpage, 4);
	int totalpage=dao.reviewTotalPage();
	
	request.setAttribute("rList", rList);
	request.setAttribute("curpage", curpage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("main_review", "main_content.jsp");
	
	//여기서 리뷰 추가
	//request.setAttribute("review_jsp", "review_content.jsp");
	}
	
	public void ReviewAllData(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		WeddingDAO dao=new WeddingDAO();
		List<ReviewVO> rAllList=dao.reviewListData(curpage, 10);
		int totalpage=dao.reviewTotalPage();
		
		request.setAttribute("rAllList", rAllList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_review", "/review/review.jsp");
	}
	
	public void WeddingDetailData(HttpServletRequest request) {
		String com_no=request.getParameter("com_no");
		WeddingDAO dao=new WeddingDAO();
		ComVO vo=dao.WeddingDetailData(Integer.parseInt(com_no));

		request.setAttribute("vo", vo);
		request.setAttribute("main_review","/review/reviewDetail.jsp");
	
	}
	
	
	
}
