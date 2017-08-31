package com.sist.member;
// ResultSet => 단위(Record) => ~DTO, ~VO, ~Bean
// => 읽기(getter), 쓰기(setter)
/*
 * 	~DAO
 * 	~Manager
 * 	~Service : DAO+DAO
 * 	board / reply
 *  =====   =====
 *  BoardDAO + ReplyDAO => 자료실, 후기, 자유게시판
 *  ==>
 *  class BoardService{
 *  	BoardDAO bdao=new BoardDAO();
 *  	ReplyDAO rdao=new ReplyDAO();
 *  }
 */
public class ZipcodeVO {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	private String address;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	/*
	 * 	${vo.address}
	 * 
	 * ${vo.sido}&nbsp;${vo.gugun}&nbsp;${vo.dong}&nbsp;${vo.bunji}&nbsp;
	 */
	public String getAddress() {
		return sido+" "+gugun+" "+dong+" "+bunji;
	}

	
}
