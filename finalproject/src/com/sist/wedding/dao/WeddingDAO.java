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
	private final String url = "jdbc:oracle:thin:@211.238.142.41:1521:ORCL";

	// 드라이버 등록
	public WeddingDAO() {
		try { // 컴파일 exception이므로 반드시 예외처리를 해줘야한다.
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			System.out.println("dao:" + ex.getMessage());
		}
	}

	// 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
		} catch (Exception ex) {
			System.out.println("getConncetion:" + ex.getMessage());
		}
	}

	// 닫기
	public void disConnection() {
		try {
			if (ps != null)
				ps.close(); // Input, OutputStream //output으로 값을 보내고 input으로 가져온다.
			if (conn != null)
				conn.close(); // Socket //연결하고 값을 보내고 받아오는 방식 jdbc
		} catch (Exception ex) {
		}
	}

	public void comInsert() {
		try {
			getConnection();
			WeddingManager wm = new WeddingManager();
			List<ComVO> list = wm.weddingAllData();

			for (ComVO vo : list) {
				String sql = "INSERT INTO COMM_TABLE VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

				ps = conn.prepareStatement(sql);

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
		} catch (Exception ex) {
			System.out.println("comInsert:" + ex.getMessage());
		} finally {
			disConnection();
		}

	}

	/* hall_table insert */
	public void innerHallInsert() {
		try {
			getConnection();
			WeddingManager wm = new WeddingManager();
			List<InnerHallVO> list = wm.innerHallData();

			for (InnerHallVO vo : list) {
				String sql = "INSERT INTO HALL_TABLE VALUES(?,?,?,?,?,?,?,?)";

				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getHall_no());
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
		} catch (Exception ex) {
			System.out.println("comInsert:" + ex.getMessage());
		} finally {
			disConnection();
		}
	}

	/* 홀 리뷰 리스트 */
	public List<ReviewVO> reviewListData(int page, int roSize, String rOrder) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			getConnection();
			int rowSize = roSize;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			String order= rOrder; //받을 번호 
			String sql = "select review_no, review_title,review_regdate, review_writer, review_comment, review_fscore,review_tscore, review_mscore, review_pscore, review_sscore,com_no, num, img "
					+ "from (select review_no, review_title,review_regdate, review_writer, review_comment, review_fscore,review_tscore, review_mscore, review_pscore, review_sscore,com_no, rownum as num, img "
					+ "from (select review_no, review_title,review_regdate, review_writer, review_comment, review_fscore,review_tscore, review_mscore, review_pscore, review_sscore,review_table.com_no, img_table.img_src as img  "
					+ "from review_table, img_table " + "where review_Table.com_no = img_table.com_no "
					+ "and MOD(img_no,5)=1 order by "+ order +" DESC )) " + "where num BETWEEN " + start + " AND " + end;

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ReviewVO vo = new ReviewVO();

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
				vo.setPage_no(rs.getInt(12));
				vo.setImg_src(rs.getString(13));

				list.add(vo);
			}
			rs.close();

		} catch (Exception ex) {
			System.out.println("reviewListData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	/* 메인 리뷰 페이지 */
	public int reviewTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/9) FROM review_table ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println("reviewTotalPage:" + ex.getMessage());

		} finally {
			disConnection();
		}
		return total;

	}

	/* 웨딩홀 상세정보 */
	public ComVO WeddingDetailData(int com_no) {
		ComVO vo = new ComVO();
		try {
			getConnection();
			String sql = "SELECT com_no, com_name, com_pic, com_address, com_address2, com_type, com_menu, com_meal, com_person, com_event, com_check "
					+ "FROM comm_table " + "WHERE com_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ResultSet rs = ps.executeQuery();
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

		} catch (Exception ex) {
			System.out.println("reviewListData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}

	public ReviewVO ReviewDetailData(int com_no) {
		ReviewVO rVo = new ReviewVO();
		try {
			getConnection();
			String sql = "SELECT review_no, review_title, review_regdate, review_writer,review_comment, "
					+ "review_fscore, review_tscore, review_mscore, review_pscore, review_sscore, com_no "
					+ "FROM review_table " + "WHERE com_no=? ";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			rVo.setReview_no(rs.getInt(1));
			rVo.setReview_title(rs.getString(2));
			rVo.setReview_regdate(rs.getString(3));
			rVo.setReview_writer(rs.getString(4));
			rVo.setReview_comment(rs.getString(5));
			rVo.setReview_fscore(rs.getInt(6));
			rVo.setReview_tscore(rs.getInt(7));
			rVo.setReview_mscore(rs.getInt(8));
			rVo.setReview_pscore(rs.getInt(9));
			rVo.setReview_sscore(rs.getInt(10));
			rVo.setCom_no(rs.getInt(11));
			rs.close();
			ps.close();

		} catch (Exception ex) {
			System.out.println("reviewDetailData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return rVo;
	}

	/* 웨딩홀 이미지 insert */
	public void imgDataInsert() {
		try {
			getConnection();
			WeddingManager wm = new WeddingManager();
			List<ImgVO> list = wm.weddingImageData();

			for (ImgVO vo : list) {
				String sql = "INSERT INTO IMG_TABLE VALUES(?,?,?,?)";

				ps = conn.prepareStatement(sql);

				ps.setInt(1, vo.getImg_no());
				ps.setString(2, vo.getImg_title());
				ps.setString(3, vo.getImg_src());
				ps.setInt(4, vo.getCom_no());
				ps.executeUpdate();
				ps.close();
				System.out.println("들어가나?");

			}
		} catch (Exception ex) {
			System.out.println("imgInsert:" + ex.getMessage());
		} finally {
			disConnection();
		}
	}
	/*홀 이미지*/
	public ImgVO HallImageData(int com_no, int i) {
		ImgVO iVo = new ImgVO();
		try {
			getConnection();
			// 1부터 4까지
			String sql = "SELECT img_no, img_title, img_src, com_no " + "FROM img_table " + "WHERE com_no=? "
					+ "and MOD(img_no,5)=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ps.setInt(2, i);

			ResultSet rs = ps.executeQuery();
			rs.next();
			iVo.setImg_no(rs.getInt(1));
			iVo.setImg_title(rs.getString(2));
			iVo.setImg_src(rs.getString(3));
			iVo.setCom_no(rs.getInt(4));

			rs.close();
			ps.close();

		} catch (Exception ex) {
			System.out.println("reviewDetailData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return iVo;
	}

	/*견적 옵션 insert*/

	public void estiDataInsert() {
		   try {
			   getConnection();
			   WeddingManager wm=new WeddingManager();
			   List<OptVO> list=wm.estiAllData();
			  
			   for(OptVO vo:list) {
				   String sql="INSERT INTO ESTI_TABLE VALUES(?,?,?,?,?,?,?,?,?,?)";
				   
				   ps=conn.prepareStatement(sql);
				  
				   ps.setString(1, vo.getCom_title());
				   ps.setString(2, vo.getOpt_name());
				   ps.setString(3, vo.getOpt_price());
				   ps.setString(4,vo.getOpt_sel());
				   ps.setString(5,vo.getOpt_con());
				   ps.setInt(6,vo.getCom_no());
				   ps.setInt(7,vo.getOpt_no());
				   ps.setInt(8,  vo.getHall_no());
				   ps.setString(9, vo.getTot_price());
				   ps.setInt(10, vo.getEsti_no());
				   ps.executeUpdate();
				   ps.close();
				   System.out.println("들어가나?");
			
			   }
			   }catch(Exception ex) {
				   System.out.println("EstiInsert:"+ex.getMessage());
			   }finally {
				   disConnection();
			   }
	}
	/*견적 리스트 */
	public List<OptVO> estiListData(int page, int roSize) {
		List<OptVO> list = new ArrayList<OptVO>();
		try {
			getConnection();
			int rowSize = roSize;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;

	
			String sql = "SELECT com_title, opt_name,opt_price,tot_price, hall_no, img, esti_no, com_num, no "
					+ "FROM (SELECT com_title, opt_name, opt_price,tot_price,hall_no, img,esti_no, com_num, rownum as no "
					+ "FROM (SELECT com_title, opt_name, opt_price, tot_price,hall_no, comm_table.com_pic as img,esti_no,comm_table.com_no as com_num "
					+ "from esti_table, comm_table "
					+ "where esti_table.com_title=comm_table.com_name "
					+ "and opt_sel like '%명' "
					+ "order by esti_no asc)) "
					+ "where no between "+start+"and " +end;
	
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OptVO vo = new OptVO();
				
				
				vo.setCom_title(rs.getString(1));
				vo.setOpt_name(rs.getString(2));
				vo.setOpt_price(rs.getString(3));
				vo.setTot_price(rs.getString(4));
				vo.setHall_no(rs.getInt(5));
				vo.setCom_pic(rs.getString(6));
				vo.setEsti_no(rs.getInt(7));
				vo.setNo(rs.getInt(8));
				vo.setCom_no(rs.getInt(9)) ;
	
			
				list.add(vo);
			}
			rs.close();

		} catch (Exception ex) {
			System.out.println("EstiListData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
	
	/* 견적 리스트 페이지 */
	public int estiTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/9) FROM esti_table ";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println("estiTotalPage:" + ex.getMessage());

		} finally {
			disConnection();
		}
		return total;

	}

	
	public OptVO EstiDetailData(int com_no) {		
		OptVO vo= new OptVO();
		try {
			getConnection();
			String sql = "SELECT com_no,com_title, opt_name, opt_price, opt_sel, opt_con, opt_no,hall_no, tot_price, esti_no "
					+ "FROM esti_table " + "WHERE com_no = ? ";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ResultSet rs = ps.executeQuery();
			
				rs.next();
				vo.setCom_no(rs.getInt(1));
				vo.setCom_title(rs.getString(2));
				vo.setOpt_name(rs.getString(3));
				vo.setOpt_price(rs.getString(4));
				vo.setOpt_sel(rs.getString(5));
				vo.setOpt_con(rs.getString(6));		
				vo.setOpt_no(rs.getInt(7));
				vo.setHall_no(rs.getInt(8));
				vo.setTot_price(rs.getString(9));
				vo.setEsti_no(rs.getInt(10));
				
			rs.close();

		} catch (Exception ex) {
			System.out.println("reviewListData :" + ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}
	
	
	
	/*견적서 웨딩홀 선택*/
	 public List<ComVO> estiComListData()
	   {
		   List<ComVO> list=
				   new ArrayList<ComVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT com_no,com_name,com_pic "
					     +"FROM comm_table ";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   ComVO vo=new ComVO();
				   vo.setCom_no(rs.getInt(1));
				   vo.setCom_name(rs.getString(2));
				   vo.setCom_pic(rs.getString(3));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println("estiComData:"+ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	 
	 /*견적서 내부 홀 선택, com_no 가져오기 */
	 public String reserveInnerHall(int com_no) {
		 String data="";
		 
		 try {
			 getConnection();
			 String sql= "SELECT com_no FROM comm_table "
					 +"WHERE com_no=? ";
		
			 
			 ps= conn.prepareStatement(sql);
			 ps.setInt(1, com_no);
			 ResultSet rs= ps.executeQuery();
			 rs.next();
			 
			
			 rs.close();
		 }catch(Exception ex) {
			 System.out.println("InnerHall1:"+ex.getMessage());
		 }finally {
			disConnection();
		 }
		 return data;
	 }

	 /*2차작업 :HallVO 가져오기*/
	 public InnerHallVO reserveInnerHallInfo(int com_no) {
		 InnerHallVO vo= new InnerHallVO();		 
		 try {
			 getConnection();
			 String sql="SELECT com_no, hall_name, hall_style, hall_fmenu, hall_price, hall_people, hall_time FROM hall_table "
					 	+"WHERE (com_no, hall_no) IN "
					 	+"(SELECT com_no, MAX(hall_no) FROM hall_table "
					 	+"GROUP BY com_no )"
					 	+"AND com_no=? ";
	
					 	
			ps = conn.prepareStatement(sql);
			ps.setInt(1, com_no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setCom_no(rs.getInt(1));
			vo.setHall_name(rs.getString(2));
			vo.setHall_style(rs.getString(3));
			vo.setHall_fmenu(rs.getString(4));
			vo.setHall_price(rs.getString(5));
			vo.setHall_people(rs.getString(6));
			vo.setHall_time(rs.getString(7));
			
			rs.close();
	 
		 }catch(Exception ex) {
			 System.out.println("InnerHall2:"+ex.getMessage());
		 }finally {
			 disConnection();
		 }return vo;
	 }
	 
	 /*optNO max 값 가져오기 */
		public String estiMaxOption(int com_no) {
			String data = "";
			
			try {
				getConnection();
				String sql = "SELECT opt_no FROM esti_table "
						+"WHERE (hall_no, opt_no, esti_no) IN "
						+"(SELECT hall_no, max(opt_no), "
						+"(SELECT max(esti_no) as est_no from esti_table "
						+"WHERE com_no=? "
						+"group by com_no) "
						+"FROM esti_table "
						+"GROUP BY hall_no) "
						+"and com_no=? ";
				
			
				ps = conn.prepareStatement(sql);
				ps.setInt(1, com_no);
				ps.setInt(2, com_no);
				ResultSet rs = ps.executeQuery();
				rs.next();
				data = rs.getString(1);
				rs.close();
				
			} catch (Exception ex) {
				System.out.println("maxOption:"+ex.getMessage());
			} finally {
				disConnection();
			}
			
			return data;
		}
	 
		/*가져온  max 값을 넣어서 option 출력하기 */
		public List<OptVO> optionListData (int com_no, int max_no, int start_no) {
			List<OptVO> list = new ArrayList<OptVO>();
			
			try {
				getConnection();	//미리 설정되어있는 Connection 주소 얻기
				
				int end = max_no;
				int start= start_no;
			
				
				String sql = "select com_no, opt_name, opt_sel, opt_price, tot_price, opt_con, hall_no from esti_table "
							+"where (hall_no, com_no) IN "
							+"(select min(hall_no), com_no "
							+"from esti_table "
							+"group by com_no) "
							+"and com_no= ? " 
							+"and opt_no between " +start + "and "+end ;
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, com_no);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					OptVO vo=new OptVO();
					vo.setCom_no(rs.getInt(1));
					vo.setOpt_name(rs.getString(2));
					vo.setOpt_sel(rs.getString(3));
					vo.setOpt_price(rs.getString(4));
					vo.setTot_price(rs.getString(5));
					vo.setOpt_con(rs.getString(6));
					vo.setHall_no(rs.getInt(7));
					list.add(vo);
				}	rs.close();
				
			} catch (Exception ex) {
				System.out.println("optionListData() : "+ex.getMessage());
			} finally {
				disConnection();	//반환
			}
			
			return list;
		}
		
		public void myEstiInsert(EstiVO vo) {
			try {
				getConnection();
				String sql="INSERT INTO MY_ESTI VALUE( "
						+ "MY_ESTI_PK.nextval,?,?,?,?,?,SYSDATE,0) ";
				ps=conn.prepareStatement(sql);
				
				ps.setString(1, vo.getMy_com());
				ps.setString(2, vo.getMy_hall());
				ps.setString(3, vo.getMy_opt());
				ps.setString(4, vo.getMy_inwon());
				ps.setString(5, vo.getMy_price());
				
				ps.executeUpdate();
						
			}catch(Exception ex) {
				System.out.println(ex.getMessage());
			}finally {
				disConnection();
			}
		}
		
}
