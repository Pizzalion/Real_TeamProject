package com.sist.wedding.dao;

import com.sist.wedding.manager.WeddingManager;

/*��ü ���̺� ������ insert*/
public class MainClass {
	
	public static void main(String[] args) {
		/*WeddingDAO dao=new WeddingDAO();
		dao.comInsert();
		System.out.println("����Ϸ�");*/
		WeddingManager wm=new WeddingManager();
		wm.innerHallData();
	}

}
