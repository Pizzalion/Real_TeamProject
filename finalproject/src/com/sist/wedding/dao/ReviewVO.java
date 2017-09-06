package com.sist.wedding.dao;

public class ReviewVO {
	private int review_no; //리뷰 번호
	private String review_title; //웨딩홀 이름
	private String review_regdate; //작성일
	private String review_comment; //리뷰
	private String review_writer; //작성자
	private int review_fscore; //
	private int review_tscore;
	private int review_mscore;
	private int review_pscore;
	private int review_sscore;
	private double review_ave; //총점	
	private int com_no; //업체 번호
	private int page_no;
	private String img_src;
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public int getReview_fscore() {
		return review_fscore;
	}
	public void setReview_fscore(int review_fscore) {
		this.review_fscore = review_fscore;
	}
	public int getReview_tscore() {
		return review_tscore;
	}
	public void setReview_tscore(int review_tscore) {
		this.review_tscore = review_tscore;
	}
	public int getReview_mscore() {
		return review_mscore;
	}
	public void setReview_mscore(int review_mscore) {
		this.review_mscore = review_mscore;
	}
	public int getReview_pscore() {
		return review_pscore;
	}
	public void setReview_pscore(int review_pscore) {
		this.review_pscore = review_pscore;
	}
	public int getReview_sscore() {
		return review_sscore;
	}
	public void setReview_sscore(int review_sscore) {
		this.review_sscore = review_sscore;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public double getReview_ave() {
		return (review_fscore+review_tscore+review_mscore+review_fscore+review_fscore)/5;
	}
	
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img) {
		this.img_src = img;
	}
	
	

	
}
