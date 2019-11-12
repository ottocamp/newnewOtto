package aQuestion.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import aQuestion.model.vo.aQuestion;
import camp.model.dao.CampDao;
import static common.JDBCTemplate.*;

public class aQuestionDao {
	
	private Properties prop = new Properties();
	
	public aQuestionDao() {
		String fileName = CampDao.class.getResource("/sql/aQuestion/question-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	public ArrayList<aQuestion> selectList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<aQuestion> qList = new ArrayList<aQuestion>();
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				qList.add(new aQuestion(rset.getInt(1),
										rset.getString(2),
										rset.getString(3),
										rset.getDate(4),
										rset.getInt(5) + "",
										rset.getString(6),
										rset.getString(7),
										rset.getInt(8),
										rset.getInt(9)));					
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return qList;
	}

	public int answerQuestion(Connection conn, String qCode, String comment) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("answerQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, comment);
			pstmt.setInt(2, Integer.parseInt(qCode));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
}
