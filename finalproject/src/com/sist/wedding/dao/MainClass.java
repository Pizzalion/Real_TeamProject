package com.sist.wedding.dao;

import com.sist.wedding.manager.WeddingManager;

/*��ü ���̺� ������ insert*/
public class MainClass {
	
	public static void main(String[] args) {
		/*comm_table Insert*/
		/*WeddingDAO dao=new WeddingDAO();
		dao.comInsert();
		System.out.println("����Ϸ�");*/		
		/*WeddingManager wm=new WeddingManager();
		wm.innerHallData();*/
		/*Hall_table Insert*/
		WeddingDAO dao=new WeddingDAO();
		dao.innerHallInsert();
		System.out.println("����Ϸ�");
	}

}
