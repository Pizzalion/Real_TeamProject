
package com.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.*;
import com.sist.member.MemberVO;
import com.sist.wedding.dao.ComVO;
import com.sist.wedding.dao.HallVO;

public class MemberDAO {
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
	   public void getConnection()
	   {
		   try // RMI
		   {
			   // 이름 저장 => 객체 이름  Connection 주소값 
			   /*
			    *  ===================== java://env/comp  JNDI
			    *   =========jdbc/oracle
			    *   이름      주소
			    *   =========  ==> 디렉토리
			    *  ===================== 
			    */
			   Context init=new InitialContext();//탐색기 열기 
	           // c 드라이브
	           Context root=(Context)init.lookup("java://comp/env");
			   // 원하는 폴더 
	           DataSource ds=(DataSource)root.lookup("jdbc/oracle");
			   conn=ds.getConnection();
			   // lookup ==> 이름으로 객체주소를 찾을 때 사용하는 메소드 
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   // 연결 종료 ==> 반환 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
		   // POJO
	   }
	   public int memberIdcheck(String mem_id)
	   {
		   int count=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM member_table "
					     +"WHERE mem_id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, mem_id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return count;
	   }
	  
	   public void memberInsert(MemberVO vo)
	   {
		   try
		   {
			   // Connection주소 얻기 SELECT NVL(MAX(mem_no)+1,1) FROM member_table)
			   getConnection();
			   String sql="INSERT INTO member_table VALUES("
					     +"(SELECT NVL(MAX(mem_no)+1,1) FROM member_table) ,?,?,?,?,?,?,0,0,?,?,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getMem_id());
			   ps.setString(2, vo.getMem_pw());
			   ps.setString(3, vo.getMem_name());
			   ps.setString(6, vo.getMem_sex());
			   ps.setString(7, vo.getMem_birth());
			   ps.setString(4, vo.getMem_email());
/*			   ps.setString(7, vo.getPost());
			   ps.setString(8, vo.getAddr1());
			   ps.setString(9, vo.getAddr2());*/
			   ps.setString(5, vo.getMem_phone());
//			   ps.setString(11, vo.getContent());
			   ps.setString(8, vo.getLikeList());
			   ps.setString(9, vo.getMem_question());
			   ps.setString(10, vo.getMem_answer());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();//반환
		   }
	   }
	   public MemberVO isLogin(String mem_id,String mem_pw)
	   {
		   MemberVO vo=new MemberVO();
		   try
		   {
			   getConnection();
			   //ID체크 
			   String sql="SELECT COUNT(*) "
					     +"FROM member_table "
					     +"WHERE mem_id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, mem_id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   if(count==0)
			   {
				   vo.setMsg("NOID"); 
			   }
			   else
			   {
				  sql="SELECT mem_id,mem_name,mem_type,mem_pw,mem_birth,mem_sex "
				     +"FROM member_table "
					 +"WHERE mem_id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, mem_id);
				  rs=ps.executeQuery();
				  rs.next();
				  vo.setMem_id(rs.getString(1));
				  vo.setMem_name(rs.getString(2));
				  vo.setMem_type(rs.getString(3));
				  String db_pwd=rs.getString(4);
				  vo.setMem_birth(rs.getString(5));
				  vo.setMem_sex(rs.getString(6));
				  if(db_pwd.equals(mem_pw))
				  {
					  vo.setMsg("OK");
				  }
				  else
				  {
					  vo.setMsg("NOPWD");
				  }
			   }
			   //PWD체크 
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection(); 
		   }
		   return vo;
	   }
	   public MemberVO MemberUpdateData(String mem_id) {
			MemberVO vo=new MemberVO();
			try {
				getConnection();
				String sql="SELECT mem_no,mem_id,mem_pw,mem_name,mem_sex,mem_birth,"
						+"mem_email,mem_phone1,mem_phone2,mem_phone3,mem_question,mem_answer "
						+"FROM member_table "
						+"WHERE mem_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, mem_id);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setMem_no(rs.getInt(1));
				vo.setMem_id(rs.getString(2));
				vo.setMem_pw(rs.getString(3));
				vo.setMem_name(rs.getString(4));
				vo.setMem_sex(rs.getString(5));
				vo.setMem_birth(rs.getString(6));
				vo.setMem_email(rs.getString(7));
				vo.setMem_phone1(rs.getString(8));
				vo.setMem_phone2(rs.getString(9));
				vo.setMem_phone3(rs.getString(10));
				vo.setMem_question(rs.getString(11));
				vo.setMem_answer(rs.getString(12));
				rs.close();
			}catch(Exception ex) {
				System.out.println(ex.getMessage());
			}finally {
				disConnection();
			}
			return vo;
		}
	   public void MemberUpdate(MemberVO vo) {
			
	   		try {
			getConnection();
			String sql="UPDATE member_table SET mem_pw=?,mem_email=?,mem_phone=?,mem_question=?,mem_answer=? "
					+"WHERE mem_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getMem_pw());
			ps.setString(2, vo.getMem_email());
			ps.setString(3, vo.getMem_phone());
			ps.setString(4, vo.getMem_question());
			ps.setString(5, vo.getMem_answer());
			ps.setString(6, vo.getMem_id());
			
			ps.executeUpdate();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}		
		
	}
	   public List<ComVO> memberLikeData(String id) {
			// 1.회원테이블에서
			List<ComVO> list = new ArrayList<ComVO>();
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
				for (String s : tmp) { //2.홀테이블에서				
					
					int intS = Integer.parseInt(s);
					sql = "SELECT com_name,com_address,com_pic,com_meal,com_person FROM com_table WHERE com_no=?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, intS);
					rs = ps.executeQuery();
					rs.next();
					
					ComVO vo = new ComVO();
					vo.setCom_no(intS);
					//System.out.println(vo.getCom_no());
					vo.setCom_name(rs.getString(1));
					vo.setCom_address(rs.getString(2));
					vo.setCom_pic(rs.getString(3));
					vo.setCom_meal(rs.getString(4));
					vo.setCom_person(rs.getString(5));
					list.add(vo);
					rs.close();
				}
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();
			}
			return list;
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
	public int totalpage(String id) {
		int total=0;
		try {
			getConnection();
			String sql = "SELECT CEIL FROM member_table WHERE mem_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String data = rs.getString(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public boolean memberDelete(String mem_id, String mem_pw) {
		boolean bCheck=false;
		try {
			getConnection();
			String sql="SELECT mem_pw FROM member_table WHERE mem_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mem_id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(mem_pw.equals(db_pwd)) {
				sql="DELETE FROM member_table WHERE mem_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, mem_id);
				ps.executeUpdate();
				bCheck=true;
			}
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return bCheck;
	}
   public List<MemberVO> boardListData(int page)
   {
 	  List<MemberVO> list=new ArrayList<MemberVO>();
 	  try
 	  {
 		  getConnection();
           int rowSize=10;
           int start=(rowSize*page)-(rowSize-1);
           // 1 11 21 31
           int end=rowSize*page;
           String sql="SELECT mem_no,mem_id,mem_name,mem_sex,mem_birth,mem_email,mem_type,num "
        		    +"FROM (SELECT mem_no,mem_id,mem_name,mem_sex,mem_birth,mem_email,mem_type,rownum as num "
        		    +"FROM (SELECT mem_no,mem_id,mem_name,mem_sex,mem_birth,mem_email,mem_type "
        		    +"FROM member_table ORDER BY mem_no DESC)) "
        		    +"WHERE num BETWEEN "+start+" AND "+end;
           ps=conn.prepareStatement(sql);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
         	  MemberVO vo=new MemberVO();
         	  vo.setMem_no(rs.getInt(1));
         	  vo.setMem_id(rs.getString(2));
         	  vo.setMem_name(rs.getString(3));
         	  vo.setMem_sex(rs.getString(4));
         	  vo.setMem_birth(rs.getString(5));
         	  vo.setMem_email(rs.getString(6));
         	  vo.setMem_type(rs.getString(7));
         	  list.add(vo);
           }
           rs.close();
 	  }catch(Exception ex)
 	  {
 		  System.out.println(ex.getMessage());
 	  }
 	  finally
 	  {
 		  disConnection();
 	  }
 	  return list;
   }
   public int adminTotalPage()
   {
 	  int total=0;
 	  try
 	  {
 		  getConnection();
 		  String sql="SELECT CEIL(COUNT(*)/10) FROM member_table";
 		  ps=conn.prepareStatement(sql);
 		  ResultSet rs=ps.executeQuery();
 		  rs.next();
 		  total=rs.getInt(1);
 		  rs.close();
 	  }catch(Exception ex)
 	  {
 		  System.out.println(ex.getMessage());
 	  }
 	  finally
 	  {
 		  disConnection();
 	  }
 	  return total;
   }
   public int adminRowCount()
   {
 	  int total=0;
 	  try
 	  {
 		  getConnection();
 		  String sql="SELECT COUNT(*) FROM member_table";
 		  ps=conn.prepareStatement(sql);
 		  ResultSet rs=ps.executeQuery();
 		  rs.next();
 		  total=rs.getInt(1);
 		  rs.close();
 	  }catch(Exception ex)
 	  {
 		  System.out.println(ex.getMessage());
 	  }
 	  finally
 	  {
 		  disConnection();
 	  }
 	  return total;
   }
   public int adminDelete(String mem_id) {
		int result=0;
	   try {
			getConnection();
			String sql="DELETE FROM member_table WHERE mem_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mem_id);
			result=ps.executeUpdate();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return result;
	}  
   public String memberIdSearch(String mem_email){
	   String data="";
	   try
	   {
		   getConnection();
		   String sql="SELECT mem_id "
				     +"FROM member_table "
				     +"WHERE mem_email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, mem_email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   data=rs.getString(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   disConnection();
	   }
	   return data;
   }
   public String memberPwdSearch(String mem_id,String mem_question,String mem_answer){
	   String data="";
	   try
	   {
		   getConnection();
		   String sql="SELECT mem_pw "
				     +"FROM member_table "
				     +"WHERE mem_id=? and mem_question=? and mem_answer=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, mem_id);
		   ps.setString(2, mem_question);
		   ps.setString(3, mem_answer);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   data=rs.getString(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   disConnection();
	   }
	   return data;
   }
}
