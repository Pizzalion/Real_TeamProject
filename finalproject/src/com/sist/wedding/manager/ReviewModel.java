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
	List<ReviewVO> rList=dao.reviewListData(curpage, 4,"img_no");		
	int totalpage=dao.reviewTotalPage();
	
	
	String com_no=request.getParameter("com_no");	

	request.setAttribute("rList", rList);
	request.setAttribute("curpage", curpage);
	request.setAttribute("totalpage", totalpage);
	request.setAttribute("main_jsp", "default.jsp");
	
	//여기서 리뷰 추가, 
	//request.setAttribute("review_jsp", "review_content.jsp");
	}
	
	public void ReviewAllData(HttpServletRequest request) {
		String page=request.getParameter("page");
		//String revOrder=request.getParameter("rOrder");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		WeddingDAO dao=new WeddingDAO(); 
		//com_no는 랭킹순, review_title 은 이름순, review_no는 최신순
		List<ReviewVO> rAllList=dao.reviewListData(curpage, 10, "img_no");
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
	
	public void findReview(HttpServletRequest request) {
		try {
			WeddingDAO dao=new WeddingDAO();
			request.setCharacterEncoding("EUC-KR");
			String page=request.getParameter("page");
			String ss=request.getParameter("ss");
			//int count=dao.findCount(ss);
			//String fs=request.getParameter("fs");
			
			ReviewVO vo =new ReviewVO();
			System.out.println("값이 들어오나"+ss);
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
				
			/*if(count>0) {
				List<ReviewVO> flist = dao.findReview(curpage, 10, ss);
				request.setAttribute("flist", flist);
				System.out.println("여기서는"+ss);
			}
*/			List<ReviewVO> flist = dao.findReview(curpage, 10, ss);
			request.setAttribute("ss", ss);
			request.setAttribute("flist", flist);
			int totalpage=dao.reviewTotalPage();
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			
			//request.setAttribute("count", count);
			/*request.setAttribute("vo", vo);*/
			request.setAttribute("main_jsp", "/review/findResult.jsp");
			
			
		}catch(Exception ex) {
			System.out.println("findReview: "+ex.getMessage());
		}
	
	
	}


}
