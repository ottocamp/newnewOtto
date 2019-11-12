package coupon.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import coupon.model.dao.CouponDao;
import coupon.model.vo.Coupon;
import static common.JDBCTemplate.*;

public class CouponService {

	public ArrayList<Coupon> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> cList = new CouponDao().selectList(conn);
		
		close(conn);
		
		return cList;
		
	}

	public int insertCounpon(String cName, int cDiscount, String grade, String startDay, String endDay) {
		
		Connection conn = getConnection();
		
		int result = new CouponDao().insertCoupon(conn, cName, cDiscount, grade, startDay, endDay);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateCounpon(String cCode, String cName, int cDiscount, String grade, String startDay, String endDay) {
		
		Connection conn = getConnection();
		
		int result = new CouponDao().updateCoupon(conn, cCode, cName, cDiscount, grade, startDay, endDay);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteCoupon(String cCode) {
	
		Connection conn = getConnection();
		
		int result = new CouponDao().deleteCoupon(conn, cCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public ArrayList<Coupon> selectAbleList() {
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> cList = new CouponDao().selectAbleList(conn);
		
		close(conn);
		
		return cList;
	}



}
