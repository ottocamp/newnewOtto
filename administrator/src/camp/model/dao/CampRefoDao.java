package camp.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import camp.model.vo.CampRefoOptionEnter;
import camp.model.vo.CampRefoSiteEnter;

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
	
	//캠핑장 사이트를 끌어오는 DAO 
	public ArrayList<CampRefoSiteEnter> selectSiteList(Connection conn, int cNo) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<CampRefoSiteEnter> sList = new ArrayList<CampRefoSiteEnter>();

			
		String sql = prop.getProperty("selectCampReSiList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sList.add(new CampRefoSiteEnter(rset.getString(1),
												rset.getString(2),
												rset.getString(3),
												rset.getInt(4),
												rset.getInt(5),
												rset.getInt(6),
												rset.getInt(7)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("0-3" + sList);
		return sList;
	}

	public ArrayList<CampRefoOptionEnter> selectOptionList(Connection conn, int cNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CampRefoOptionEnter> oList = new ArrayList<CampRefoOptionEnter>();
		
		String sql = prop.getProperty("selectCampReOpList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				oList.add(new CampRefoOptionEnter(rset.getString(1),
												  rset.getString(2),
												  rset.getInt(3),
												  rset.getInt(4),
												  rset.getInt(5)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("1-3" + oList);
		return oList;
	}

}
	
	

