package com.sist.wedding.dao;
/*웨딩홀업체 내부의 홀*/
public class InnerHallVO {
	private int hall_no; //홀 넘버
	private String hall_name; //홀 명칭
	private String hall_style; //예식형태:분리/동시
	private String hall_fmenu; //식사종류
	private String hall_price; //홀사용료
	private String hall_people; //보증인원
	private String hall_time; //예식간격
	private int com_no; //업체 번호(comm_tb 의 pk)
	public int getHall_no() {
		return hall_no;
	}
	public void setHall_no(int hall_no) {
		this.hall_no = hall_no;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public String getHall_style() {
		return hall_style;
	}
	public void setHall_style(String hall_style) {
		this.hall_style = hall_style;
	}
	public String getHall_fmenu() {
		return hall_fmenu;
	}
	public void setHall_fmenu(String hall_fmenu) {
		this.hall_fmenu = hall_fmenu;
	}
	public String getHall_price() {
		return hall_price;
	}
	public void setHall_price(String hall_price) {
		this.hall_price = hall_price;
	}
	public String getHall_people() {
		return hall_people;
	}
	public void setHall_people(String hall_people) {
		this.hall_people = hall_people;
	}
	public String getHall_time() {
		return hall_time;
	}
	public void setHall_time(String hall_time) {
		this.hall_time = hall_time;
	}
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	
	
}
