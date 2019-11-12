package reservation.model.dao;

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

import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationCount;

public class ReservationDao {
	private Properties prop = new Properties();
	
	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public ArrayList<Reservation> SelectList(Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation re = new Reservation(rset.getInt("RE_NO"),
												rset.getDate("PAYMENT_DATE"),
												rset.getString("USER_NAME"),
												rset.getString("PHONE"),
												rset.getString("RE_DATE"),
												rset.getInt("RE_COST"),
												rset.getInt("RE_STATUS") + "",
												rset.getString("CAMP_NAME"));
				
				rList.add(re);
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return rList;
	}


	public int deleteReservation(Connection conn, int reNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteReservation");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Reservation> SelectAvailList(Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAvailReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation re = new Reservation(rset.getInt("RE_NO"),
												rset.getDate("PAYMENT_DATE"),
												rset.getString("USER_NAME"),
												rset.getString("PHONE"),
												rset.getString("RE_DATE"),
												rset.getInt("RE_COST"),
												rset.getInt("RE_STATUS") + "",
												rset.getString("CAMP_NAME"));
				
				rList.add(re);
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return rList;
	}


	public ArrayList<Reservation> SelectDeleteList(Connection conn) {
		
		PreparedStatement pstmt = null;
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeleteReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation re = new Reservation(rset.getInt("RE_NO"),
												rset.getDate("PAYMENT_DATE"),
												rset.getString("USER_NAME"),
												rset.getString("PHONE"),
												rset.getString("RE_DATE"),
												rset.getInt("RE_COST"),
												rset.getInt("RE_STATUS") + "",
												rset.getString("CAMP_NAME"));
				
				rList.add(re);
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return rList;
	}


	public ArrayList<Reservation> SelectSearchList(Connection conn, int[] reArr, String startDay, String endDay,
			long rMin, long rMax) {
		
		PreparedStatement pstmt = null;
		ArrayList<Reservation> sList = new ArrayList<Reservation>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("SelectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reArr[0]);
			pstmt.setInt(2, reArr[1]);
			pstmt.setInt(3, reArr[2]);
			pstmt.setInt(4, reArr[3]);		
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			pstmt.setFloat(7, rMin);
			pstmt.setFloat(8, rMax);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Reservation re = new Reservation(rset.getInt("RE_NO"),
						rset.getDate("PAYMENT_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getString("RE_DATE"),
						rset.getInt("RE_COST"),
						rset.getInt("RE_STATUS") + "",
						rset.getString("CAMP_NAME"));

				sList.add(re);
							
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


	public ArrayList<ReservationCount> SelectSearchCount(Connection conn, int[] reArr, String startDay, String endDay,
			long rMin, long rMax) {
		
		PreparedStatement pstmt = null;
		ArrayList<ReservationCount> cList = new ArrayList<ReservationCount>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("ReservationCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reArr[0]);
			pstmt.setInt(2, reArr[1]);
			pstmt.setInt(3, reArr[2]);
			pstmt.setInt(4, reArr[3]);		
			pstmt.setString(5, startDay);
			pstmt.setString(6, endDay);
			pstmt.setFloat(7, rMin);
			pstmt.setFloat(8, rMax);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReservationCount re = new ReservationCount(rset.getInt(1),
															rset.getInt(2));

				cList.add(re);
							
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


	public ArrayList<Reservation> SelectCampList(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
//		User loginUser = getSession().getAttribute("loginUser");
//	     int userNo = loginUser.getUserNo();
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCampReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation re = new Reservation(rset.getInt("RE_NO"),
												rset.getDate("PAYMENT_DATE"),
												rset.getString("USER_NAME"),
												rset.getString("PHONE"),
												rset.getString("RE_DATE"),
												rset.getInt("RE_COST"),
												rset.getInt("RE_STATUS") + "",
												rset.getString("CAMP_NAME"));
				
				rList.add(re);
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return rList;
	}


	public ArrayList<Reservation> SelectLatestList(Connection conn) {
	
		Statement stmt = null;
		ArrayList<Reservation> sList = new ArrayList<Reservation>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("SelectLatestList");
		
		try {
			stmt = conn.createStatement();
					
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				Reservation re = new Reservation(rset.getInt("RE_NO"),
						rset.getDate("PAYMENT_DATE"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getString("RE_DATE"),
						rset.getInt("RE_COST"),
						rset.getInt("RE_STATUS") + "",
						rset.getString("CAMP_NAME"));

				sList.add(re);
							
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
				
		return sList;
	}


	public ArrayList<ReservationCount> SelectLatestCount(Connection conn) {
		
		Statement stmt = null;
		ArrayList<ReservationCount> cList = new ArrayList<ReservationCount>();
		ResultSet rset = null;
		
		String sql = prop.getProperty("SelectLatestCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				ReservationCount re = new ReservationCount(rset.getInt(1),
															rset.getInt(2));

				cList.add(re);
							
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
