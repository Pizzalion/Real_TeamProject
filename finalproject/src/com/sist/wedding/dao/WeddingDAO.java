package com.sist.wedding.dao;
import java.sql.*;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.wedding.manager.WeddingManager;

public class WeddingDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String url="jdbc:oracle:thin:@211.238.142.41:1521:orcl";
	//����̹� ���
	public WeddingDAO() {
		try { //������ exception�̹Ƿ� �ݵ�� ����ó���� ������Ѵ�. 
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			System.out.println("dao:"+ex.getMessage());
		}
	}
	
	//����
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url, "scott","tiger");
		}catch(Exception ex) {
			System.out.println("getConncetion:"+ex.getMessage());
		}
	}
	//�ݱ�
	public void disConnection() {
		try {
			if(ps!=null) ps.close(); // Input, OutputStream //output���� ���� ������ input���� �����´�. 
			if(conn!=null) conn.close(); //Socket //�����ϰ� ���� ������ �޾ƿ��� ��� jdbc
		}catch(Exception ex) {}
	}

	   
	   public void comInsert() {
		   try {
		   getConnection();
		   WeddingManager wm=new WeddingManager();
		   List<ComVO> list=wm.weddingAllData();
		  
		   for(ComVO vo:list) {
			   String sql="INSERT INTO COMM_TABLE VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			   
			   ps=conn.prepareStatement(sql);
			   
			   ps.setInt(1, vo.getCom_no());
			   ps.setString(2, vo.getCom_name());
			   ps.setString(3, vo.getCom_pic());
			   ps.setString(4, vo.getCom_tlike());
			   ps.setString(5, vo.getCom_address());
			   ps.setString(6, vo.getCom_address2());
			   ps.setString(7, vo.getCom_type());
			   ps.setString(8, vo.getCom_meal());
			   ps.setString(9, vo.getCom_menu());
			   ps.setString(10, vo.getCom_person());
			   ps.setString(11, vo.getCom_event());
			   ps.setString(12, vo.getCom_check());
			   ps.setString(13, vo.getCom_start());
			   ps.executeUpdate();
			   ps.close();

		   }
		   }catch(Exception ex) {
			   System.out.println("comInsert:"+ex.getMessage());
		   }finally {
			   disConnection();
		   }
		   
		  
		   
	   }
}
