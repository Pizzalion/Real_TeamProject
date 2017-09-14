package com.sist.wedding.dao;

public class OptVO {
	private int hall_no;
	private String com_title; //웨딩홀 이름
	private String opt_name; //옵션 이름
	private String opt_price; //옵션 가격
	private String tot_price; //총 견적
	private String opt_sel; //비고(필수/선택)
	private String opt_con; //옵션 내용
	private String com_pic;
	private int com_no; //웨딩홀 no
	private int opt_no;
	private int esti_no;
	private int no;
	private int com_num;
	
	
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public String getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(String opt_price) {
		this.opt_price = opt_price;
	}
	public String getOpt_sel() {
		return opt_sel;
	}
	public void setOpt_sel(String opt_sel) {
		this.opt_sel = opt_sel;
	}
	public String getOpt_con() {
		return opt_con;
	}
	public void setOpt_con(String opt_con) {
		this.opt_con = opt_con;
	}
	public String getCom_pic() {
		return com_pic;
	}
	public void setCom_pic(String img) {
		this.com_pic = img;
	}
	
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_num) {
		this.com_no = com_num;
	}
	public int getOpt_no() {
		return opt_no;
	}
	public void setOpt_no(int opt_no) {
		this.opt_no = opt_no;
	}
	public int getHall_no() {
		return hall_no;
	}
	public void setHall_no(int hall_no) {
		this.hall_no = hall_no;
	}
	public String getTot_price() {
		return tot_price;
	}
	public void setTot_price(String totPrice) {
		this.tot_price = totPrice;
	}
	public int getEsti_no() {
		return esti_no;
	}
	public void setEsti_no(int esti_no) {
		esti_no = esti_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int rownum) {
		this.no = rownum;
	}
	
	
	
}
