package sales.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import reservation.model.dao.ReservationDao;
import sales.model.vo.CampDaySales;
import sales.model.vo.CampMonthSales;
import sales.model.vo.CampSales;
import sales.model.vo.CampYearSales;
import sales.model.vo.SiteDaySales;
import sales.model.vo.SiteMonthSales;
import sales.model.vo.SiteYearSales;
import sales.model.vo.TopCampSales;
import sales.model.vo.TopMemberSales;

import static common.JDBCTemplate.*;

public class SalesDao {

	private Properties prop = new Properties();
	
	public SalesDao() {
		String fileName = ReservationDao.class.getResource("/sql/sales/sales-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<CampSales> selectList(Connection conn, String startDate, String endDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CampSales> csList = new ArrayList<CampSales>();
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate + " 23:59:59");
					
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				csList.add(new CampSales(rset.getInt(1),
										rset.getInt(2),
										rset.getString(3),
										rset.getString(4),
										rset.getInt(5),
										rset.getString(6),
										rset.getString(7),
										rset.getString(8)));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return csList;
	}

	public ArrayList<CampMonthSales> selectMonthList(Connection conn, String startDate, String endDate) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CampMonthSales> smList = new ArrayList<CampMonthSales>();
		
		String sql = prop.getProperty("selectMonthList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				smList.add(new CampMonthSales(rset.getString(2),
											rset.getInt(5),
											rset.getString(4),
											rset.getInt(1),
											rset.getInt(3)));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return smList;
	}

	public ArrayList<CampYearSales> selectYearList(Connection conn, String startDate, String endDate) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CampYearSales> syList = new ArrayList<CampYearSales>();
		
		String sql = prop.getProperty("selectYearList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				syList.add(new CampYearSales(rset.getString(2),
											rset.getInt(5),
											rset.getString(4),
											rset.getInt(1),
											rset.getInt(3)));
							
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return syList;
	}

	public ArrayList<CampDaySales> selectDayList(Connection conn, String startDate, String endDate) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CampDaySales> sdList = new ArrayList<CampDaySales>();
		
		String sql = prop.getProperty("selectDayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				sdList.add(new CampDaySales(rset.getString(2),
											rset.getInt(5),
											rset.getString(4),
											rset.getInt(1),
											rset.getInt(3)));
							
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sdList;
	}

	public ArrayList<SiteYearSales> selectSiteYearSales(Connection conn, String year) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<SiteYearSales> sysList = new ArrayList<SiteYearSales>();
		
		String sql = prop.getProperty("selectSiteYearSales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			pstmt.setString(2, (Integer.parseInt(year) + 1) + "");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				sysList.add(new SiteYearSales(rset.getString(2),
											rset.getInt(3),
											rset.getInt(1)));		
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return sysList;
	}

	public ArrayList<SiteMonthSales> selectSiteMonthSales(Connection conn, String year) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<SiteMonthSales> smsList = new ArrayList<SiteMonthSales>();
		
		String sql = prop.getProperty("selectSiteMonthSales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			pstmt.setString(2, (Integer.parseInt(year) + 1) + "");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				smsList.add(new SiteMonthSales(rset.getString(2),
											rset.getInt(3),
											rset.getInt(1)));		
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return smsList;
	}

	public ArrayList<SiteDaySales> selectSiteDaySales(Connection conn, String year) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<SiteDaySales> sdsList = new ArrayList<SiteDaySales>();
		
		String sql = prop.getProperty("selectSiteDaySales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			pstmt.setString(2, (Integer.parseInt(year) + 1) + "");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				sdsList.add(new SiteDaySales(rset.getString(2),
											rset.getInt(3),
											rset.getInt(1)));		
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return sdsList;
	}

	public ArrayList<TopCampSales> selectTopCampSales(Connection conn, String year) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<TopCampSales> tcsList = new ArrayList<TopCampSales>();
		
		String sql = prop.getProperty("selectTopCampSales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				tcsList.add(new TopCampSales(rset.getInt(1),
											rset.getString(2),
											rset.getString(3),
											rset.getInt(4),
											rset.getInt(5)));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return tcsList;
	}

	public ArrayList<TopMemberSales> selectTopMemberSales(Connection conn, String year) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<TopMemberSales> tmsList = new ArrayList<TopMemberSales>();
		
		String sql = prop.getProperty("selectTopMemberSales");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				tmsList.add(new TopMemberSales(rset.getInt(1),
											rset.getString(2),
											rset.getString(3),
											rset.getInt(4),
											rset.getInt(5)));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return tmsList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
