package reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationCount;

public class ReservationService {

	public ArrayList<Reservation> SelectList() {
		Connection conn = getConnection();
		
		ArrayList<Reservation> rList = new ReservationDao().SelectList(conn);
		
		close(conn);
		
		return rList;
	}

	public int deleteReservation(int reNo) {
		Connection conn = getConnection();

		int result = new ReservationDao().deleteReservation(conn, reNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
				
		return result;
	}

	public ArrayList<Reservation> SelectAvailList() {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> rList = new ReservationDao().SelectAvailList(conn);
		
		close(conn);
		
		return rList;
	}

	public ArrayList<Reservation> SelectDeleteList() {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> rList = new ReservationDao().SelectDeleteList(conn);
		
		close(conn);
		
		return rList;
	}

	public ArrayList<Reservation> SelectSearchList(int[] reArr, String startDay, String endDay, long rMin,long rMax) {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> sList = new ReservationDao().SelectSearchList(conn, reArr,  startDay,  endDay,  rMin, rMax);
		
		close(conn);
		
		return sList;
	
	}

	public ArrayList<ReservationCount> SelectSearchCount(int[] reArr, String startDay, String endDay, long rMin,
			long rMax) {
		
		Connection conn = getConnection();
		
		ArrayList<ReservationCount> cList = new ReservationDao().SelectSearchCount(conn, reArr,  startDay,  endDay,  rMin, rMax);
		
		close(conn);
		
		return cList;
	}

	public ArrayList<Reservation> SelectCampList(int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Reservation> rList = new ReservationDao().SelectCampList(conn,uNo);
		
		close(conn);
		
		return rList;
	}

	
	public ArrayList<Reservation> SelectLatestList() {
		Connection conn = getConnection();
		
		ArrayList<Reservation> sList = new ReservationDao().SelectLatestList(conn);
		
		close(conn);
		
		return sList;
	}

	public ArrayList<ReservationCount> SelectLatestCount() {
	
		Connection conn = getConnection();
		
		ArrayList<ReservationCount> cList = new ReservationDao().SelectLatestCount(conn);
		
		close(conn);
		
		return cList;
	}

}
