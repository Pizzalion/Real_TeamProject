package com.sist.wedding.dao;

public class EstiVO {
	private int my_no; //견적 번호
	private String my_id; //아이디
	private String my_com; //견적낸 회사
	private String my_hall; //견적낸 홀
	private String my_opt; //선택 옵션
	private String my_inwon; //인원수
	private String my_price; //총 가격
	private String my_regdate; //날짜
	private int estimate;
	public int getMy_no() {
		return my_no;
	}
	public void setMy_no(int my_no) {
		this.my_no = my_no;
	}
	public String getMy_id() {
		return my_id;
	}
	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}
	public String getMy_com() {
		return my_com;
	}
	public void setMy_com(String my_com) {
		this.my_com = my_com;
	}
	public String getMy_hall() {
		return my_hall;
	}
	public void setMy_hall(String my_hall) {
		this.my_hall = my_hall;
	}
	public String getMy_opt() {
		return my_opt;
	}
	public void setMy_opt(String my_opt) {
		this.my_opt = my_opt;
	}
	public String getMy_inwon() {
		return my_inwon;
	}
	public void setMy_inwon(String my_inwon) {
		this.my_inwon = my_inwon;
	}
	public String getMy_price() {
		return my_price;
	}
	public void setMy_price(String my_price) {
		this.my_price = my_price;
	}
	public String getMy_regdate() {
		return my_regdate;
	}
	public void setMy_regdate(String my_regdate) {
		this.my_regdate = my_regdate;
	}
	public int getEstimate() {
		return estimate;
	}
	public void setEstimate(int estimate) {
		this.estimate = estimate;
	} 
	
	
}
