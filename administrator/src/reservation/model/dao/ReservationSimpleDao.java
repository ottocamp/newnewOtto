package reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationSimple;

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
		//쿼리문 미완성.
		
		String sql = prop.getProperty("SimpleSelectSearchList");
		
		/*try {
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
							
			}*/
		
		return null;
	}

}
