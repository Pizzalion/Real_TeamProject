package com.sist.wedding.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.sist.wedding.dao.ComVO;
import com.sist.wedding.dao.ImgVO;
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
	
	
	String com_no=request.getParameter("com_no");	
	System.out.println(com_no);

	request.setAttribute("rList", rList);
	request.setAttribute("curpage", curpage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("main_jsp", "default.jsp");
	
	//여기서 리뷰 추가, 
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
		request.setAttribute("main_jsp", "/review/review.jsp");
	}
	
	public void WeddingDetailData(HttpServletRequest request) {
		String com_no=request.getParameter("com_no");
		WeddingDAO dao=new WeddingDAO();
		ComVO vo=dao.WeddingDetailData(Integer.parseInt(com_no));
		ReviewVO rVo=dao.ReviewDetailData(Integer.parseInt(com_no));
		
		request.setAttribute("rVo", rVo);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp","/review/reviewDetail.jsp");
	
	}
	
	public void ImageData(HttpServletRequest request) {
		String com_no=request.getParameter("com_no");
		WeddingDAO dao=new WeddingDAO();
		
		
		ImgVO iVo0=dao.HallImageData(Integer.parseInt(com_no),0);
		ImgVO iVo1=dao.HallImageData(Integer.parseInt(com_no),1);
		ImgVO iVo2=dao.HallImageData(Integer.parseInt(com_no),2);
		ImgVO iVo3=dao.HallImageData(Integer.parseInt(com_no),3);
		ReviewVO rVo=dao.ReviewDetailData(Integer.parseInt(com_no));
		
		request.setAttribute("rVo", rVo);
		request.setAttribute("iVo0", iVo0);
		request.setAttribute("iVo1", iVo1);
		request.setAttribute("iVo2", iVo2);
		request.setAttribute("iVo3", iVo3);
		request.setAttribute("main_jsp","/review/reviewDetail.jsp");
	
	}

	
}
