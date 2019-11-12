package mail.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mail.model.dao.MailDao;
import user.model.vo.User;


public class MailService {

	public ArrayList<User> selectMailList(String[] sqlType, String[] sqlGrade, String startDay, String endDay) {
		Connection conn = getConnection();
		
		ArrayList<User> UserList = new MailDao().selectMailList(conn,sqlType,sqlGrade,startDay,endDay);
		
		close(conn);
		
		return UserList;
	}

	public ArrayList<User> selectTopSaleUserList(int[] userArr) {

		Connection conn = getConnection();
		
		ArrayList<User> UserList = new MailDao().selectTopSaleUserList(conn,userArr);
		
		close(conn);
		
		return UserList;
	}

	public ArrayList<User> selectTopSaleCampList(int[] userArr) {
		
		Connection conn = getConnection();
		
		ArrayList<User> UserList = new MailDao().selectTopSaleCampList(conn,userArr);
		
		close(conn);
		
		return UserList;
	}

}
