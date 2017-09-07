package com.sist.wedding.dao;

public class OptVO {
	private String com_title; //웨딩홀 이름
	private String opt_name; //옵션 이름
	private String opt_price; //옵션 가격
	private String opt_sel; //비고(필수/선택)
	private String opt_con; //옵션 내용
	private int com_no; //웨딩홀 no
	private int opt_no;
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
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public int getOpt_no() {
		return opt_no;
	}
	public void setOpt_no(int opt_no) {
		this.opt_no = opt_no;
	}
	
	
}
