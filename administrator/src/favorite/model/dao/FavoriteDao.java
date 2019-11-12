package favorite.model.dao;

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

import camp.model.dao.CampDao;
import camp.model.vo.Attachment;
import camp.model.vo.CampInfo;

public class FavoriteDao {
	
	private Properties prop = new Properties();
	
	public FavoriteDao() {
		String fileName = FavoriteDao.class.getResource("/sql/favorite/favorite-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	

	public ArrayList<CampInfo> selectList(Connection conn, int uno) {
		
		PreparedStatement pstmt = null;
		ArrayList<CampInfo> cList = new ArrayList<CampInfo>();
		ResultSet rset = null;
		String sql = prop.getProperty("selectCampList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
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







	public int campCancel(Connection conn, int uno, int code) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("favoriteCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			pstmt.setInt(2, code);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}







	public int campInsert(Connection conn, int uno, int code) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("favoriteInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, code);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		

		
		return result;
	}







	public ArrayList<Integer> selectCode(Connection conn, int uno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<Integer> codeList = new ArrayList<Integer>();
		
		String sql = prop.getProperty("selectCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				int code = rset.getInt(1);
				
				codeList.add(code);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return codeList;
	}

}
