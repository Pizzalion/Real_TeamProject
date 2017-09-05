package com.sist.wedding.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.wedding.manager.WeddingManager;

public class WeddingDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String url="jdbc:oracle:thin:@211.238.142.41:1521:orcl";
	//드라이버 등록
	public WeddingDAO() {
		try { //컴파일 exception이므로 반드시 예외처리를 해줘야한다. 
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			System.out.println("dao:"+ex.getMessage());
		}
	}
	
	//연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url, "scott","tiger");
		}catch(Exception ex) {
			System.out.println("getConncetion:"+ex.getMessage());
		}
	}
	//닫기
	public void disConnection() {
		try {
			if(ps!=null) ps.close(); // Input, OutputStream //output으로 값을 보내고 input으로 가져온다. 
			if(conn!=null) conn.close(); //Socket //연결하고 값을 보내고 받아오는 방식 jdbc
		}catch(Exception ex) {}
	}

	   /*comm_table insert*/
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
	   /*hall_table insert*/
	   public void innerHallInsert() {
		   try {
			   getConnection();
			   WeddingManager wm=new WeddingManager();
			   List<InnerHallVO> list=wm.innerHallData();
			  
			   for(InnerHallVO vo:list) {
				   String sql="INSERT INTO HALL_TABLE VALUES(?,?,?,?,?,?,?,?)";
				   
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1,vo.getHall_no());
				   ps.setString(2, vo.getHall_name());
				   ps.setString(3, vo.getHall_style());
				   ps.setString(4, vo.getHall_fmenu());
				   ps.setString(5, vo.getHall_price());
				   ps.setString(6, vo.getHall_people());
				   ps.setString(7, vo.getHall_time());
				   ps.setInt(8, vo.getCom_no());
				   ps.executeUpdate();
				   ps.close();
			
			   }
			   }catch(Exception ex) {
				   System.out.println("comInsert:"+ex.getMessage());
			   }finally {
				   disConnection();
			   }
	   }
	   /*홀 리뷰 리스트*/
	   public List<ReviewVO> reviewListData(int page, int roSize){
		   List<ReviewVO> list= new ArrayList<ReviewVO>();
		   try {
			   getConnection();
			   int rowSize=roSize;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   
			  String sql = "SELECT review_no, review_title, review_regdate, review_writer, review_comment, review_fscore, review_tscore, review_mscore, review_pscore, review_sscore, com_no, num "
					   +"FROM (SELECT review_no, review_title, review_regdate, review_writer, review_comment, review_fscore, review_tscore, review_mscore, review_pscore, review_sscore,  com_no ,rownum as num "
					   +"FROM (SELECT review_no, review_title, review_regdate, review_writer, review_comment, review_fscore, review_tscore, review_mscore, review_pscore, review_sscore, com_no FROM review_table "
					   +"ORDER BY review_no DESC)) "
					   +"WHERE num BETWEEN "+start+" AND "+end;
			   
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   
			   while(rs.next()) {
				   ReviewVO vo=new ReviewVO();

				   vo.setReview_no(rs.getInt(1));
				   vo.setReview_title(rs.getString(2));
				   vo.setReview_regdate(rs.getString(3));
				   vo.setReview_writer(rs.getString(4));
				   vo.setReview_comment(rs.getString(5));
				   vo.setReview_fscore(rs.getInt(6));
				   vo.setReview_tscore(rs.getInt(7));
				   vo.setReview_mscore(rs.getInt(8));
				   vo.setReview_pscore(rs.getInt(9));
				   vo.setReview_sscore(rs.getInt(10));		
				   vo.setCom_no(rs.getInt(11));
			

				   list.add(vo);
			   }rs.close();
			    
		   }catch(Exception ex) {
			   System.out.println("reviewListData :"+ex.getMessage());
		   }finally {
			   disConnection();
		   }return list;
	   }
	   /*메인 리뷰 페이지*/
	   public int reviewTotalPage() {
		   int total=0;
		   try {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/9) FROM review_table ";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
		   }catch(Exception ex) {
			System.out.println("reviewTotalPage:"+ex.getMessage());
			
		   }finally {
			   disConnection();
		   }return total;

	   }
	   
	   /*웨딩홀 상세정보*/
	   public ComVO WeddingDetailData(int com_no){
		   ComVO vo = new ComVO();
		   try {
			   getConnection();
			  String sql="SELECT com_no, com_name, com_pic, com_address, com_address2, com_type, com_menu, com_meal, com_person, com_event, com_check "
					  	+"FROM comm_table "
					  	+"WHERE com_no=?";
			   
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, com_no);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  vo.setCom_no(rs.getInt(1));
			  vo.setCom_name(rs.getString(2));
			  vo.setCom_pic(rs.getString(3));
			  vo.setCom_address(rs.getString(4));
			  vo.setCom_address2(rs.getString(5));
			  vo.setCom_type(rs.getString(6));
			  vo.setCom_menu(rs.getString(7));
			  vo.setCom_meal(rs.getString(8));
			  vo.setCom_person(rs.getString(9));
			  vo.setCom_event(rs.getString(10));
			  vo.setCom_check(rs.getString(11));
			  rs.close();
			    
		   }catch(Exception ex) {
			   System.out.println("reviewListData :"+ex.getMessage());
		   }finally {
			   disConnection();
		   }return vo;
	   }
	   
}
