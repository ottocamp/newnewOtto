package mail.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static common.JDBCTemplate.*;

import grade.model.dao.GradeDao;
import user.model.vo.User;

public class MailDao {

	private Properties prop = new Properties();
	
	public MailDao() {
		String fileName = GradeDao.class.getResource("/sql/mail/mail-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<User> selectMailList(Connection conn, String[] sqlType, String[] sqlGrade, String startDay,
			String endDay) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> UserList = new ArrayList<User>();
		
		String sql = prop.getProperty("selectMailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDay);
			pstmt.setString(2, endDay);
			pstmt.setString(3, sqlType[0]);
			pstmt.setString(4, sqlType[1]);
			pstmt.setString(5, sqlGrade[0]);
			pstmt.setString(6, sqlGrade[1]);
			pstmt.setString(7, sqlGrade[2]);
			pstmt.setString(8, sqlGrade[3]);
			pstmt.setString(9, sqlGrade[4]);
			
	
	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				UserList.add(new User(rset.getInt("USER_NO"),
								rset.getString("USER_TYPE"),
								rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("USER_PWD"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getString("BIRTHDATE"),
								rset.getString("GENDER"),
								rset.getString("FORIGNYN"),
								rset.getString("STATUS"),
								rset.getString("GRADE"),
								rset.getString("JOIN_DATE")
						));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return UserList;
	}


	public ArrayList<User> selectTopSaleUserList(Connection conn, int[] userArr) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> UserList = new ArrayList<User>();
		
		String sql = prop.getProperty("selectTopSaleUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i : userArr) {
			pstmt.setInt(1, i);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				UserList.add(new User(rset.getInt("USER_NO"),
								rset.getString("USER_TYPE"),
								rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("USER_PWD"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getString("BIRTHDATE"),
								rset.getString("GENDER"),
								rset.getString("FORIGNYN"),
								rset.getString("STATUS"),
								rset.getString("GRADE"),
								rset.getString("JOIN_DATE")
						));
				
				
			}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return UserList;
	}


	public ArrayList<User> selectTopSaleCampList(Connection conn, int[] userArr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> UserList = new ArrayList<User>();
		
		String sql = prop.getProperty("selectTopSaleCampList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i : userArr) {
			pstmt.setInt(1, i);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				UserList.add(new User(rset.getInt("USER_NO"),
								rset.getString("USER_TYPE"),
								rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("USER_PWD"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getString("BIRTHDATE"),
								rset.getString("GENDER"),
								rset.getString("FORIGNYN"),
								rset.getString("STATUS"),
								rset.getString("GRADE"),
								rset.getString("JOIN_DATE")
						));
				
				
			}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return UserList;
	}

}
