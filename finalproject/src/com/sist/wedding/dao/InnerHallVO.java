package com.sist.wedding.dao;
/*����Ȧ��ü ������ Ȧ*/
public class InnerHallVO {
	private int hall_no; //Ȧ �ѹ�
	private String hall_name; //Ȧ ��Ī
	private String hall_style; //��������:�и�/����
	private String hall_fmenu; //�Ļ�����
	private String hall_price; //Ȧ����
	private String hall_people; //�����ο�
	private String hall_time; //���İ���
	private int com_no; //��ü ��ȣ(comm_tb �� pk)
	
	private String com_name; //��ü�̸�
	private String com_pic;//��ü����
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_pic() {
		return com_pic;
	}
	public void setCom_pic(String com_pic) {
		this.com_pic = com_pic;
	}
	public String getCom_address() {
		return com_address;
	}
	public void setCom_address(String com_address) {
		this.com_address = com_address;
	}
	public String getCom_meal() {
		return com_meal;
	}
	public void setCom_meal(String com_meal) {
		this.com_meal = com_meal;
	}
	private String com_address;//��ü�ּ�
	private String com_meal;//�Ļ���
	
	
	
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
