package grade.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Properties;
import static common.JDBCTemplate.*;

import grade.model.vo.UserGrade;
import grade.model.vo.UserGradeIndex;

public class GradeDao {
	private Properties prop = new Properties();
	
	public GradeDao() {
		String fileName = GradeDao.class.getResource("/sql/grade/grade-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public ArrayList<UserGrade> SelectUserGrade(Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<UserGrade> gList = new ArrayList<UserGrade>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				UserGrade ug = new UserGrade(rset.getInt("USER_NO"),
									rset.getString("USER_NAME"),
									rset.getString("GRADE"),
									rset.getString("JOIN_DATE"),
									rset.getInt("SUM(RE_COST)"),
									rset.getString("EMAIL"));
	
				gList.add(ug);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		
			
		return gList;
	}


	public int updateGrade(Connection conn, int userNo, String grade) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<UserGrade> SelectSearchGrade(Connection conn, String[] indexArr) {

		PreparedStatement pstmt = null;
		ArrayList<UserGrade> sList = new ArrayList<UserGrade>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("SelectSearchGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, indexArr[0]);
			pstmt.setString(2, indexArr[1]);
			pstmt.setString(3, indexArr[2]);
			pstmt.setString(4, indexArr[3]);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				UserGrade ug = new UserGrade(rset.getInt("USER_NO"),
									rset.getString("USER_NAME"),
									rset.getString("GRADE"),
									rset.getString("JOIN_DATE"),
									rset.getInt("SUM(RE_COST)"),
									rset.getString("EMAIL"));
	
				sList.add(ug);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		
			
		return sList;
	}


	public int updateListGrade(Connection conn, ArrayList<UserGradeIndex> uiList) {
	
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateGrade");
		
		try {
			for(UserGradeIndex ugi : uiList) {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ugi.getGafterGrade());
			pstmt.setInt(2, ugi.getGuserNo());
			
			result = pstmt.executeUpdate();
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
