package coupon.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import coupon.model.vo.Coupon;
import grade.model.dao.GradeDao;

import static common.JDBCTemplate.*;

public class CouponDao {
	
	private Properties prop = new Properties();
	
	public CouponDao() {
		String fileName = GradeDao.class.getResource("/sql/coupon/coupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Coupon> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Coupon> cList = new ArrayList<Coupon>();
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				cList.add(new Coupon(rset.getString(1),
									rset.getString(2),
									rset.getInt(3),
									rset.getString(4),
									rset.getString(5),
									rset.getString(6),
									rset.getString(7),
									rset.getInt(8),
									rset.getInt(9),
									rset.getInt(10),
									rset.getDouble(11)));
				
		
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


	public int insertCoupon(Connection conn, String cName, int cDiscount, String grade, String startDay,
			String endDay) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			pstmt.setInt(2, cDiscount);
			pstmt.setString(3, grade);
			pstmt.setString(4, startDay);
			pstmt.setString(5, endDay + " 23:59:59");
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		return result;
	}


	public int updateCoupon(Connection conn, String cCode, String cName, int cDiscount, String grade, String startDay,
			String endDay) {
	
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cName);
			pstmt.setInt(2, cDiscount);
			pstmt.setString(3, startDay);
			pstmt.setString(4, endDay);
			pstmt.setString(5, grade);
			pstmt.setString(6, cCode);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}


	public int deleteCoupon(Connection conn, String cCode) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cCode);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}


	public ArrayList<Coupon> selectAbleList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Coupon> cList = new ArrayList<Coupon>();
		
		String sql = prop.getProperty("selectAbleList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				cList.add(new Coupon(rset.getString(1),
									rset.getString(2),
									rset.getInt(3),
									rset.getString(4),
									rset.getString(5),
									rset.getString(6),
									rset.getString(7),
									rset.getInt(8),
									rset.getInt(9),
									rset.getInt(10),
									rset.getDouble(11)));
				
		
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


	

}
