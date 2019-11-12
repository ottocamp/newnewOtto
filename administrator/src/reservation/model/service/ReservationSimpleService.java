package reservation.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import reservation.model.dao.ReservationSimpleDao;
import reservation.model.vo.ReservationInsert;
import reservation.model.vo.ReservationSimple;

public class ReservationSimpleService {

	public ArrayList<ReservationSimple> searchList(String name, String pw, String phone) {
		
		Connection conn = getConnection();
		
		ArrayList<ReservationSimple> rsList = new ReservationSimpleDao().searchList(conn, name, pw, phone);
		
		close(conn);
		
		return rsList;
		
		
	}

	public int InsertReservation(ReservationInsert ri) {
		Connection conn = getConnection();
		
		int result = new ReservationSimpleDao().InsertReservation(conn, ri);
		
		close(conn);
		
		return result;
	}

}
