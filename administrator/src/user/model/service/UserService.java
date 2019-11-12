package user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import coupon.model.dao.CouponDao;
import coupon.model.vo.Coupon;
import reservation.model.vo.Reservation;

import static common.JDBCTemplate.*;

import user.model.dao.UserDao;
import user.model.vo.IpInfo;
import user.model.vo.User;
import user.model.vo.UserPropic;
import user.model.vo.UserReservation;


public class UserService {

	public int userInsert(User user) {
		Connection con = getConnection();
		
		int result = new UserDao().userInsert(con,user);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		

		return result;
	}

	public User loginUser(String userId, String userPwd) {
		
		Connection con = getConnection();
		
		User user = new UserDao().loginUser(con, userId, userPwd);
		
		
		
		
		return user;
	}

	public int loginBlock(int userNo, String flag) {
		
		Connection con = getConnection();
		
		int result = new UserDao().loginBlock(con,userNo,flag);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int ipInfo(int uno,String ip, String country,String flag) {
		Connection con = getConnection();
		int result = new UserDao().ipInfo(con,uno,ip,country,flag);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public ArrayList<IpInfo> selectIpInfo(int uno) {
		
		Connection con = getConnection();
		
		ArrayList<IpInfo> ipinfo = new UserDao().selectIpInfo(con,uno);
		
		close(con);
		
		return ipinfo;
	}

	public String selectFlag(int uno) {
		Connection con = getConnection();
		
		String flag = new UserDao().selectFlag(con,uno);
		
		close(con);
		
		return flag;
	}

	public User searchUser(String userId) {
		
		Connection con = getConnection();
		
		User searchUser = new UserDao().searchUser(con,userId);
		
		close(con);
		
		return searchUser;
	}

	public int insertUserPropic(UserPropic userpropic) {
		Connection con = getConnection();
		
		int result = new UserDao().insertUserPropic(con,userpropic);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public UserPropic selectUserPropic(int uno) {
		Connection con = getConnection();
		
		UserPropic userpropic= new UserDao().selectUserPropic(con,uno);
		
		close(con);
		
		
		return userpropic;
	}

	public ArrayList<UserReservation> SelectCampList(int uNo) {
		
		Connection con = getConnection();
		
		ArrayList<UserReservation> urList = new UserDao().SelectCampList(con,uNo);

		close(con);
		
		return urList;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new UserDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int emailCheck(String userEmail) {
		Connection conn = getConnection();
		int result = new UserDao().emailCheck(conn, userEmail);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Coupon> selectCouponList(int uno) {
		Connection conn = getConnection();
		
		ArrayList<Coupon> ucList = new UserDao().selectCouponList(conn,uno);
		
		close(conn);
		
		return ucList;
	}

	public int updateUserPwd(int uno, String pwd) {
		
		Connection con = getConnection();
		
		int result = new UserDao().updateUserPwd(con, uno,pwd);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
		
		
	}

	public int updateUserPhone(int uno, String phone) {
		Connection con = getConnection();
		
		int result = new UserDao().updateUserPhone(con, uno,phone);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int updateUserEmail(int uno, String email) {
		Connection con = getConnection();
		
		int result = new UserDao().updateUserEmail(con, uno,email);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int insertCoupon(int uno, String inCode) {
		Connection con = getConnection();
		
		int result = new UserDao().insertCoupon(con, uno,inCode);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public ArrayList<Integer> selectTotalInfo(int uno) {
		Connection con = getConnection();
		
		ArrayList<Integer> totalInfo = new UserDao().selectTotalInfo(con,uno);
		
		close(con);
		
		return totalInfo;
	}

	public int reservationChange(int reNo, int reStatus) {
		Connection con = getConnection();
		
		int result = new UserDao().reservationChange(con, reNo,reStatus);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public void insertJoincode(String uid, String rcode) {
		Connection con = getConnection();
		
		int result = new UserDao().insertJoincode(con, uid,rcode);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
	}

	public int deleteRcode(String uid, String rcode) {
		
		Connection con = getConnection();
		
		int result = new UserDao().deleteRcode(con, uid,rcode);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int acceptUser(String uid) {
		
		Connection con = getConnection();
		
		int result = new UserDao().acceptUser(con, uid);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int selectUserNo(String uid) {

		Connection con = getConnection();
		
		int uno = new UserDao().selectUserNo(con,uid);
		
		
		return uno;
	}

	public int userWithdraw(int uno) {

		Connection con = getConnection();
		
		int result = new UserDao().userWithdraw(con, uno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int pwdFindUser(String uid, String uemail) {

		
		Connection con = getConnection();
		
		//유저 수를 세는것이므로 커밋 롤백 할 필요 없음
		int result = new UserDao().pwdFindUser(con, uid,uemail);
		
		
		return result;
	}

	public int resetPwd(String uid, String pwd1) {
		Connection con = getConnection();
		
		int result = new UserDao().resetPwd(con, uid,pwd1);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}
	
	
	

}
