
package com.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.*;
import com.sist.member.MemberVO;
import com.sist.wedding.dao.ComVO;
import com.sist.wedding.dao.HallVO;
import com.sist.wedding.dao.InnerHallVO;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class ReserveDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   //DB 연결 ==> 주소값 얻기  
	   /*
	    *   A a=new A();
	    *   bind("aaa",a)
	    *   bind("jdbc/oracle",new Connection())
	    *   100 101 
	    *   
	    *   int a=100
	    */
	   public void getConnection() {
		   try {
			 
			   Context init=new InitialContext();//탐색기 열기 
	           Context root=(Context)init.lookup("java://comp/env");
	           DataSource ds=(DataSource)root.lookup("jdbc/oracle");
			   conn=ds.getConnection();
		   }catch(Exception ex) {
			   System.out.println(ex.getMessage());
		   }
	   }
	   // 연결 종료 ==> 반환 
	   public void disConnection(){
		   try{
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
		   // POJO
	   }
	 
	   public List<InnerHallVO> memberBookData(String id, int start, int end) {
			
			List<InnerHallVO> hlist = new ArrayList<InnerHallVO>();
			List<InnerHallVO> list = new ArrayList<InnerHallVO>();
			int cno=0;
			
			try {
				getConnection();
				String sql = "SELECT  data.com_no, com_name, hall_name, com_pic, hall_no " + 
						"FROM com_table, (SELECT com_no,hall_name,hall_no FROM hall_table " + 
						"WHERE hall_no In (SELECT hall_no FROM bk_table WHERE mem_id=?)) data " + 
						"WHERE com_table.com_no=data.com_no ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					InnerHallVO vo = new InnerHallVO();
					vo.setCom_no(rs.getInt(1));
					vo.setCom_name(rs.getString(2));
					vo.setHall_name(rs.getString(3));
					vo.setCom_pic(rs.getString(4));			
					vo.setHall_no(rs.getInt(5));
					hlist.add(vo);
				}					
				for(int i=start-1;i<end;i++) {
					list.add(hlist.get(i));
				}				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();				
			}		
			return list;
		} 
	   
	   public List<ReserveVO> memberBookInfo(String id, int start, int end) {
			
			List<ReserveVO> rlist = new ArrayList<ReserveVO>();
			List<ReserveVO> list = new ArrayList<ReserveVO>();
			int cno=0;
			
			try {
				getConnection();
				String sql = "SELECT bk_no,hall_no,TO_CHAR(bk_cday,'YYYY-MM-DD') AS BK_CDAY,"
						+ "TO_CHAR(bk_dday,'YYYY-MM-DD') AS BK_dDAY, TO_CHAR(regdate,'YYYY-MM-DD') AS regdate "
						+ "FROM bk_table WHERE mem_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					ReserveVO vo = new ReserveVO();
					vo.setBk_no(rs.getInt(1));
					vo.setHall_no(rs.getInt(2));
					vo.setBk_cday(rs.getString(3));
					vo.setBk_dday(rs.getString(4));
					vo.setRegdate(rs.getString(5));
					rlist.add(vo);
				}					
				for(int i=start-1;i<end;i++) {
					list.add(rlist.get(i));
				}				
			} catch (Exception ex) {
				System.out.println("mbookinfo()"+ex.getMessage());
			} finally {
				disConnection();				
			}		
			return list;
		} 
	   
	   public int totalpage(String id) {//totalpage 구하기 위한 작업
			int totalpage=0;		
			double rowSize=5;
			try {
				getConnection();
				String sql = "SELECT COUNT(DISTINCT hall_no) FROM bk_table WHERE mem_id=?";				
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				rs.next();
				int total = rs.getInt(1);								
				double a = (double)total/rowSize; 
				totalpage = (int)Math.ceil(a);				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();				
			}		
			return totalpage;
		} 
	   
	public void deleteLikeData(String id, String com_no) {
		try {
			getConnection();
			String sql = "SELECT mem_likelist FROM member_table WHERE mem_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String data = rs.getString(1);
			rs.close();
			ps.close();
			String[] tmp = data.split(",");
			System.out.println("추출완료");

			//리스트 새로 만들기
			String str="";
			for (String s : tmp) {				
				if (s.equals(com_no)) {
					//배열에서 해당문자만 삭제하기
				    System.out.println("삭제완료");					
				}else {
					str=str+","+s;
				}				
			}
			str = str.substring(1);
			System.out.println(str);
			//리스트 db반영하기
			sql = "UPDATE  member_table SET mem_likelist=? where mem_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, str);
			ps.setString(2, id);			
			ps.executeUpdate();
			ps.close();
			System.out.println("수정완료");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
	
	public void reserveOk(ReserveVO vo) {
		try {
			getConnection();
			String sql= "INSERT INTO bk_table VALUES(BK_TABLE2_SEQ.nextval, ?,?,?,?,'0',?,sysdate) ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getHall_no());
			ps.setString(2, vo.getBk_cday());
			ps.setString(3, vo.getBk_dday());
			ps.setString(4, vo.getBk_ask());
			ps.setString(5, vo.getMem_id());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}
/*	 public List<ComVO> bkListData(String id, int start, int end) {
			// 1.회원테이블에서
			List<ComVO> list = new ArrayList<ComVO>();
			try {
				getConnection();
				
			String sql = "SELECT com_name,com_address,com_pic,com_meal,com_person "
					+ "FROM com_table WHERE com_no=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			ComVO vo = new ComVO();
			vo.setCom_no(1);
			//System.out.println(vo.getCom_no());
			vo.setCom_name(rs.getString(1));
			vo.setCom_address(rs.getString(2));
			vo.setCom_pic(rs.getString(3));
			vo.setCom_meal(rs.getString(4));
			vo.setCom_person(rs.getString(5));
			list.add(vo);
			rs.close();				
				} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();				
			}		
			return list;
		} 
	   public int totalBkData(String id) {
			int total=0;			
			try {
				getConnection();
				String sql = "SELECT mem_likelist FROM member_table WHERE mem_id=?";				
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				rs.next();
				String data = rs.getString(1);
				rs.close();
				ps.close();
				String[] tmp = data.split(",");
				//System.out.println("추출완료");
				total = tmp.length	;			
				System.out.println(total);			
				} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();				
			}		
			return total;
		}*/ 
	   
}
