package com.sist.wedding.dao;

import com.sist.wedding.manager.WeddingManager;

/*업체 테이블 데이터 insert*/
public class MainClass {
	
	public static void main(String[] args) {
		/*WeddingDAO dao=new WeddingDAO();
		dao.comInsert();
		System.out.println("저장완료");*/
		WeddingManager wm=new WeddingManager();
		wm.innerHallData();
	}

}
