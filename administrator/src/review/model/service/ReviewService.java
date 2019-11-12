package review.model.service;

import review.model.dao.ReviewDao;
import review.model.vo.UserReview;
import user.model.dao.UserDao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class ReviewService {

	public int insertReview(UserReview insertReview) {
		Connection con = getConnection();
		
		int result = new ReviewDao().insertReview(con,insertReview);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
				

		return result;

	}

	public ArrayList<UserReview> selectUserReview(int uno) {
		Connection con = getConnection();
		
		ArrayList<UserReview> userReviewList = new ReviewDao().selectUserReview(con,uno);
		
		close(con);
		
		return userReviewList;
	}

	public int deleteReview(int reNo3) {
		Connection con = getConnection();
		
		int result = new ReviewDao().deleteReview(con,reNo3);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
				

		return result;
	}

}
