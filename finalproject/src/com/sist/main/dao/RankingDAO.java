package com.sist.main.dao;

import java.sql.*;
import java.util.*;

public class RankingDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String url = "jdbc:oracle:thin:@211.238.142.41:1521:ORCL";

	// 드라이버 등록
	public RankingDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// 닫기
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// 기능
	/*public void RankInsert(RankingVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO wedding VALUES(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getAddr());
			ps.setString(4, vo.getImage());
			ps.setString(5, vo.getScore());
			ps.executeQuery();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
	}
*/
//===================메인페이지 리스트 4개==========================
	public List<CompanyVO> rankingMainListData(int page) {
		//List<RankingVO> list = new ArrayList<RankingVO>();
		List<CompanyVO> list= new ArrayList<CompanyVO>();
		try {
			getConnection();
			int rowSize=4;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			String sql="SELECT com_no,com_name,com_address,com_pic,com_rank num "
					+"FROM (SELECT com_no,com_name,com_address,com_pic,com_rank, rownum as num "
					+"FROM (SELECT com_no,com_name,com_address,com_pic,com_rank FROM com_table "
					+"ORDER BY com_no ASC)) "
					+"WHERE num BETWEEN "+start+" AND "+end;
					
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				CompanyVO vo=new CompanyVO();
				vo.setCom_no(rs.getInt(1));
				vo.setCom_name(rs.getString(2));
				vo.setCom_address(rs.getString(3));
				vo.setCom_pic(rs.getString(4));
				vo.setCom_rank(rs.getString(5));
				list.add(vo);
				
			}
			rs.close();
					
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
	//===================메인페이지 리스트 4개 토탈페이지==============
	public int rankingMainTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/4) FROM com_table ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	//==========================랭킹페이지 리스트 16개===============
	public List<CompanyVO> rankingListData(int page) {
		//List<RankingVO> list = new ArrayList<RankingVO>();
		List<CompanyVO> list= new ArrayList<CompanyVO>();
		try {
			getConnection();
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			String sql="SELECT com_no,com_name,com_address,com_pic,com_rank num "
					+"FROM (SELECT com_no,com_name,com_address,com_pic,com_rank, rownum as num "
					+"FROM (SELECT com_no,com_name,com_address,com_pic,com_rank FROM com_table "
					+"ORDER BY com_no ASC)) "
					+"WHERE num BETWEEN "+start+" AND "+end;
					
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				CompanyVO vo=new CompanyVO();
				vo.setCom_no(rs.getInt(1));
				vo.setCom_name(rs.getString(2));
				vo.setCom_address(rs.getString(3));
				vo.setCom_pic(rs.getString(4));
				vo.setCom_rank(rs.getString(5));
				list.add(vo);
				
			}
			rs.close();
					
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
//	==========================랭킹페이지 리스트 16개==========================
	public int rankingTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12) FROM com_table ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	
	//===================================== 상세보기
	public CompanyVO companyDetailData(int com_no) {
		CompanyVO vo =new CompanyVO();
		try {
			getConnection();
			String sql="SELECT com_no,com_name,com_star,com_address,com_address2,com_type,com_meal,com_menu,com_person,com_event,com_check,com_pic,com_tlike "
					+"FROM com_table "
					+"WHERE com_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setCom_no(rs.getInt(1));
			vo.setCom_name(rs.getString(2));
			vo.setCom_star(rs.getString(3));
			vo.setCom_address(rs.getString(4));
			vo.setCom_address2(rs.getString(5));
			vo.setCom_type(rs.getString(6));
			vo.setCom_meal(rs.getString(7));
			vo.setCom_menu(rs.getString(8));
			vo.setCom_person(rs.getString(9));
			vo.setCom_event(rs.getString(10));
			vo.setCom_ckeck(rs.getString(11));
			vo.setCom_pic(rs.getString(12));
			vo.setCom_tlike(rs.getInt(13));
			rs.close();
			
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return vo;
	}
}

