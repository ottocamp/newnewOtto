package camp.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import camp.model.vo.Attachment;
import camp.model.vo.CampDetail;
import camp.model.vo.CampInfo;
import camp.model.vo.CampMinPrice;
import camp.model.vo.CampReview;


public class CampDao {

	private Properties prop = new Properties();
	
	public CampDao() {
		String fileName = CampDao.class.getResource("/sql/camp/camp-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<CampInfo> selectList(Connection conn) {
		Statement stmt = null;	
		ArrayList<CampInfo> cList = new ArrayList<CampInfo>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectCampList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				 
				cList.add(new CampInfo(rset.getInt(1),
										rset.getString(2),
										rset.getString(3),
										rset.getString(4),
										rset.getString(5),
										rset.getInt(6),
										rset.getString(7),
										rset.getString(8),
										rset.getString(9),
										rset.getString(10),
										rset.getString(11),
										rset.getString(12),
										rset.getString(13),
										rset.getString(14),
										rset.getInt(15)));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return cList;
	}


	public ArrayList<Attachment> selectAttachmentList(Connection conn) {

		Statement stmt = null;	
		ArrayList<Attachment> aList = new ArrayList<Attachment>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				Attachment at = new Attachment(rset.getInt(1),
												  rset.getString(2),
												  rset.getString(3),
												  rset.getString(4),
												  rset.getDate(5),
												  rset.getInt(6),
												  rset.getInt(7));
				
				aList.add(at);
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
			
		return aList;
	}


	public int campApproval(Connection conn, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("campApprval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<CampInfo> selectDetailList(Connection conn) {
		
		
		Statement stmt = null;	
		ArrayList<CampInfo> cList = new ArrayList<CampInfo>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailCampList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				 
				cList.add(new CampInfo(rset.getInt(1),
										rset.getString(2),
										rset.getString(3),
										rset.getString(4),
										rset.getString(5),
										rset.getInt(6),
										rset.getString(7),
										rset.getString(8),
										rset.getString(9),
										rset.getString(10),
										rset.getString(11),
										rset.getString(12),
										rset.getString(13),
										rset.getString(14),
										rset.getInt(15)));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return cList;
	}


	public int campCancel(Connection conn, int code) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("campCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int insertCamp(Connection conn, CampInfo c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCamp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getcName());
			pstmt.setString(2, c.getcAddress());
			pstmt.setString(3, c.getcPhone());
			pstmt.setString(4, c.getcUrl());
			pstmt.setInt(5, c.getcTheme());
			pstmt.setString(6, c.getcAvailableDate());
			pstmt.setString(7, c.getcPosting());
			pstmt.setString(8, c.getcRefundment());
			pstmt.setString(9, c.getcEtc());
			pstmt.setString(10, c.getcOperName());
			pstmt.setString(11, c.getcOperNO());
			pstmt.setString(12, c.getcOption());
			pstmt.setInt(13, c.getcUserNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}


	public ArrayList<CampInfo> selectMainList(Connection conn) {
		Statement stmt = null;	
		ArrayList<CampInfo> cList = new ArrayList<CampInfo>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				 
				cList.add(new CampInfo(rset.getInt(1),
										rset.getString(2),
										rset.getString(3),
										rset.getString(4),
										rset.getString(5),
										rset.getInt(6),
										rset.getString(7),
										rset.getString(8),
										rset.getString(9),
										rset.getString(10),
										rset.getString(11),
										rset.getString(12),
										rset.getString(13),
										rset.getString(14),
										rset.getInt(15)));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return cList;
	}


	public ArrayList<Attachment> selectMainAttachmentList(Connection conn) {

		Statement stmt = null;	
		ArrayList<Attachment> aList = new ArrayList<Attachment>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainAttachmentList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				Attachment at = new Attachment(rset.getInt(1),
												  rset.getString(2),
												  rset.getString(3),
												  rset.getString(4),
												  rset.getDate(5),
												  rset.getInt(6),
												  rset.getInt(7));
				
				aList.add(at);
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
			
		return aList;
	}


	public ArrayList<CampInfo> selectLocationList(Connection conn, String newcheckInDate, String location) {
		PreparedStatement pstmt = null;	
		ArrayList<CampInfo> cList = new ArrayList<CampInfo>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newcheckInDate);
			pstmt.setString(2, "%" + location + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				cList.add(new CampInfo(rset.getInt(1),
										rset.getString(2),
										rset.getString(3),
										rset.getString(4),
										rset.getString(5),
										rset.getInt(6),
										rset.getString(7),
										rset.getString(8),
										rset.getString(9),
										rset.getString(10),
										rset.getString(11),
										rset.getString(12),
										rset.getString(13),
										rset.getString(14),
										rset.getInt(15)));
				
				
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return cList;
	}


	public ArrayList<Attachment> selectLocationAttachmentList(Connection conn, String newcheckInDate, String location) {
		Statement stmt = null;	
		ArrayList<Attachment> aList = new ArrayList<Attachment>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainAttachmentList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				Attachment at = new Attachment(rset.getInt(1),
												  rset.getString(2),
												  rset.getString(3),
												  rset.getString(4),
												  rset.getDate(5),
												  rset.getInt(6),
												  rset.getInt(7));
				
				aList.add(at);
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
			
		return aList;
	}


	public ArrayList<CampMinPrice> selectMinPrice(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<CampMinPrice> cmpList = new ArrayList<CampMinPrice>();
		
		String sql = prop.getProperty("selectMinPrice");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				cmpList.add(new CampMinPrice(rset.getInt(1),
											rset.getInt(2)));
				
				
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return cmpList;
	}


	public ArrayList<CampDetail> selectDetail(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<CampDetail> cdList = new ArrayList<CampDetail>();
		
		String sql = prop.getProperty("selectDetail");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				cdList.add(new CampDetail(rset.getInt(1),
										rset.getInt(2),
										rset.getString(3),
										rset.getString(4),
										rset.getInt(5),
										rset.getInt(6),
										rset.getInt(7),
										rset.getInt(8),
										rset.getString(9)));

			}
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return cdList;
	}


	public ArrayList<CampReview> selectReview(Connection conn) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<CampReview> crList = new ArrayList<CampReview>();
		
		String sql = prop.getProperty("selectReview");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				crList.add(new CampReview(rset.getInt(1),
										rset.getInt(2),
										rset.getString(3),
										rset.getInt(4),
										rset.getString(5),
										rset.getString(6),
										rset.getString(7),
										rset.getString(8),
										rset.getInt(9)));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		
		return crList;
	}


	public ArrayList<CampInfo> getName(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;		
		ArrayList<CampInfo> ci = new ArrayList<>();
		
		String sql = prop.getProperty("getName");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				CampInfo c = new CampInfo();
				
				c.setcName(rset.getString("camp_name"));
				c.setcUserNo(rset.getInt("user_no"));
				
				ci.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);			
		}
		
		return ci;
	}


	
}
