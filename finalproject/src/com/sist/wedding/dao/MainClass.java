package com.sist.wedding.dao;
/*업체 테이블 데이터 insert*/
public class MainClass {
	
	public static void main(String[] args) {
		WeddingDAO dao=new WeddingDAO();
		dao.comInsert();
		System.out.println("저장완료");
	}

}
