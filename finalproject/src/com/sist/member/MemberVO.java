package com.sist.member;
import java.util.*;

public class MemberVO {
	private int mem_no,com_no;
	private String mem_id,mem_pw,mem_name,mem_sex;
	private String mem_email,mem_type;
	private String mem_phone1;
	private String mem_phone2;
	private String mem_phone3;
	private String msg;//noid, nopwd
	private String mem_birth;
	private String mem_phone;
	private String likeList;
	
	
	public String getLikeList() {
		return likeList;
	}


	public void setLikeList(String likeList) {
		this.likeList = likeList;
	}


	public int getMem_no() {
		return mem_no;
	}


	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}


	public int getCom_no() {
		return com_no;
	}


	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}


	public String getMem_type() {
		return mem_type;
	}


	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_sex() {
		return mem_sex;
	}


	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_phone1() {
		return mem_phone1;
	}


	public void setMem_phone1(String mem_phone1) {
		this.mem_phone1 = mem_phone1;
	}


	public String getMem_phone2() {
		return mem_phone2;
	}


	public void setMem_phone2(String mem_phone2) {
		this.mem_phone2 = mem_phone2;
	}


	public String getMem_phone3() {
		return mem_phone3;
	}


	public void setMem_phone3(String mem_phone3) {
		this.mem_phone3 = mem_phone3;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMem_birth() {
		return mem_birth;
	}


	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}


	public String getMem_phone() {
		return mem_phone1+"-"+mem_phone2+"-"+mem_phone3;
	}

	
	/*public String setMem_phone() {
		return mem_phone1+"-"+mem_phone2+"-"+mem_phone3;
	}*/
	 
	
	
	
	
	
}
