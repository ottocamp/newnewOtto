package reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import reservation.model.vo.ReservationInsert;
import reservation.model.vo.ReservationSimple;
import static common.JDBCTemplate.*;

public class ReservationSimpleDao {
	private Properties prop = new Properties();
	
	public ReservationSimpleDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservationSimple-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<ReservationSimple> searchList(Connection conn, String name, String pw, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReservationSimple> rsList = new ArrayList<ReservationSimple>();
		
		String sql = prop.getProperty("SimpleSelectSearchList");
		

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, name);
				pstmt.setString(2, pw);
				pstmt.setString(3, phone);

				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					rsList.add(new ReservationSimple(rset.getString(1),
													 rset.getString(2),
													 rset.getString(3),
													 rset.getString(4),
													 rset.getString(5),
													 rset.getString(6)));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		return rsList;
	}

	public int InsertReservation(Connection conn, ReservationInsert ri) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("InsertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, ri.getrName());
			pstmt.setString(2, ri.getrPwd());
			pstmt.setString(3, ri.getrPhone());
			pstmt.setString(4, ri.getrCar());
			pstmt.setString(5, ri.getrMessage());
			pstmt.setString(6, ri.getcName());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

			System.out.println(result);
		return result;
	}

}
