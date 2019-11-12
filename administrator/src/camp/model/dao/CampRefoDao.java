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


import camp.model.vo.CampRefoEnter;

public class CampRefoDao {

	private Properties prop = new Properties();
	
	public CampRefoDao() {
		
		String fileName = CampDao.class.getResource("/sql/camp/campReSelect-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// 구문의 전체적인 stmt 수정. 어태치먼트를 참고할것
	public ArrayList<CampRefoEnter> selectCampReList(Connection conn, int cNo) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<CampRefoEnter> eList = null;

			//쿼리 수정해야함.
		String sql = prop.getProperty("selectCampReList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cNo);
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return eList;
	}

}
	
	

