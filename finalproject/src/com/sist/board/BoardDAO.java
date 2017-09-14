package com.sist.board;

/*
 * 	1) inline View :  페이지 나누기 ==> 고급 SQL
 * 	2) SQL조립 => 순서
 * 	3) 파생 => 댓글 (Ajax) 
 */
import java.util.*;

import java.sql.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@211.238.142.41:1521:ORCL";

	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "scott", "tiger");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

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
	// 1. 목록 & and & ^ ? &name => ubuntu gnome
	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConnection();
			int rowSize = 10;
			int start = (rowSize * page) - (rowSize - 1);
			// 1 11 21 321
			int end = rowSize * page;
			String sql = "SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num  "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab "
					+ "FROM replyBoard ORDER BY group_id DESC, group_step ASC)) " + "WHERE num BETWEEN " + start
					+ "  AND " + end;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	// 데이터 추가
	public void boardInsert(BoardVO vo) {
		try {
			// DB연결
			getConnection();
			String sql = "INSERT INTO replyBoard(no,name,subject,content,pwd,group_id) "
					+ "VALUES(rb_no_seq.nextval,?,?,?,?," + "(SELECT NVL(MAX(group_id)+1,1) FROM replyBoard))";
			// SQL문장 전송
			ps = conn.prepareStatement(sql);
			// 사용자 요청 데이터를 채워서 insert를 처리
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
			// => commit()
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
	}

	// 2. 내용기능
	public BoardVO boardContentData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql = "UPDATE replyBoard SET " + "hit=hit+1 " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			ps.close();

			sql = "SELECT no,name,subject,content,regdate,hit " + "FROM replyBoard " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}

	// 3. 찾기
	// 4. 수정
public BoardVO replyBoardUpdateData(int no) {
		
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content,regdate,hit "
					+"FROM replyBoard "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();
			
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return vo;
	}
	public boolean replyBoardUpdate(BoardVO vo) {
		boolean bCheck=false;
		try {
			getConnection();
			String sql="SELECT pwd FROM replyBoard "
								+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				//수정
				sql="UPDATE replyBoard SET "
						+"name=?,subject=?,content=? "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
		}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return bCheck;
	}
	// 5. 삭제
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck = false;
		try {
			getConnection();
			String sql = "SELECT pwd FROM replyBoard " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			if (db_pwd.equals(pwd)) {
				bCheck = true;
				sql = "SELECT root,depth FROM replyBoard " + "WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				rs = ps.executeQuery();
				rs.next();
				int root = rs.getInt(1);
				int depth = rs.getInt(2);
				rs.close();
				if (depth == 0) {
					// 삭제
					sql = "DELETE FROM replyBoard " + "WHERE no=?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();

				} else {
					// 수정

					/*
					 * String msg="관리자가 삭제한 게시물입니다"; sql="UPDATE replyBoard SET "
					 * +"subject=?,content=? " +"WHERE no=?"; ps=conn.prepareStatement(sql);
					 * ps.setString(1, msg); ps.setString(2, msg); ps.setInt(3, no);
					 * ps.executeUpdate(); } if(root!=0) { sql="UPDATE replyBoard SET "
					 * +"depth=depth-1 " +"WHERE no=?"; ps=conn.prepareStatement(sql); ps.setInt(1,
					 * root); ps.executeUpdate();
					 * 
					 * String msg="관리자가 삭제한 게시물입니다"; sql="SELECT depth FROM replyBoard "
					 * +"WHERE no=?"; ps=conn.prepareStatement(sql); ps.setInt(1, root);
					 * rs=ps.executeQuery(); rs.next(); int root_depth=rs.getInt(1); rs.close();
					 * if(root_depth==0) { sql="DELETE FROM replyBoard "
					 * +"WHERE no=? AND subject=?"; ps=conn.prepareStatement(sql); ps.setInt(1,
					 * root); ps.setString(2, msg); ps.executeUpdate();
					 * 
					 * }
					 */
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return bCheck;
	}

	// 6. 답변
	public void boardReply(int pno, BoardVO vo) {
		try {
			getConnection();
			// 상위 게시물의 group_id,step,tab
			String sql = "SELECT group_id,group_step,group_tab " + "FROM replyBoard " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi = rs.getInt(1);
			int gs = rs.getInt(2);
			int gt = rs.getInt(3);
			rs.close();
			/*
			 * group_id group_step group_tab depth AAAA 100 0 0 2 =>BBBB 100 1 1 1 =>CCCC
			 * 100 2 2 1 =>DDDD 100 3 3 0 =>KKKK 100 1 1 0 EEEE 101 0 0 0
			 */
			sql = "UPDATE replyBoard SET " + "group_step=group_step+1 " + "WHERE group_id=? AND group_step>?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();

			sql = "INSERT INTO replyBoard(no,name,subject,content,pwd,group_id,group_step,group_tab,root) "
					+ "VALUES(rb_no_seq.nextval,?,?,?,?, " + "?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs + 1);
			ps.setInt(7, gt + 1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			ps.close();

			sql = "UPDATE replyBoard SET " + "depth=depth+1 " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
	}

	// 7. 총페이지
	public int boardTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10) FROM replyBoard";
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

	// 8. count
	public int boardRowCount() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM replyBoard";
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

	public List<BoardVO> boardFindData(String fs, String ss){
		List<BoardVO> list =new ArrayList<BoardVO>()	;
		try {
			//연결 (오라클)
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit "
								+"FROM freeboard "
								+"WHERE "+fs+"LIKE '&'||?||'&'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			
					BoardVO vo=new BoardVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setRegdate(rs.getDate(4));
					vo.setHit(rs.getInt(5));
					list.add(vo);
					}
		rs.close();
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}

public BoardVO boardUpdateData(int no) {
		
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content,regdate,hit "
					+"FROM freeboard "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();
			
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return vo;
	}

public boolean boardModifyData(BoardVO vo) {
	// TODO Auto-generated method stub
	return false;
}
}
