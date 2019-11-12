package review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import review.model.vo.UserReview;


import static common.JDBCTemplate.*;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

	public int insertReview(Connection con, UserReview insertReview) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql =  prop.getProperty("insertReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, insertReview.getReNo());
			pstmt.setInt(2, insertReview.getuNo());
			pstmt.setString(3, insertReview.getuId());
			pstmt.setInt(4, insertReview.getcCode());
			pstmt.setString(5, insertReview.getcName());
			pstmt.setString(6, insertReview.getReDate());
			pstmt.setString(7, insertReview.getrTitle());
			pstmt.setString(8, insertReview.getrContent());
			pstmt.setInt(9, insertReview.getrNum());
			pstmt.setInt(10, insertReview.getReNo());
			pstmt.setInt(11, insertReview.getuNo());
			pstmt.setString(12, insertReview.getuId());
			pstmt.setInt(13, insertReview.getcCode());
			pstmt.setString(14, insertReview.getcName());
			pstmt.setString(15, insertReview.getReDate());
			pstmt.setString(16, insertReview.getrTitle());
			pstmt.setString(17, insertReview.getrContent());
			pstmt.setInt(18, insertReview.getrNum());
			
			
			result = pstmt.executeUpdate();

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<UserReview> selectUserReview(Connection con, int uno) {
		
		PreparedStatement pstmt = null;
		ArrayList<UserReview> userReviewList = new ArrayList<UserReview>();
		ResultSet rset = null;
		UserReview userReview = null;
		
		String sql =  prop.getProperty("selectUserReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				userReview = new UserReview();
				userReview.setReNo(rset.getInt(1));
				userReview.setuNo(rset.getInt(2));
				userReview.setuId(rset.getString(3));
				userReview.setcCode(rset.getInt(4));
				userReview.setcName(rset.getString(5));
				userReview.setReDate(rset.getString(6));
				userReview.setrTitle(rset.getString(7));
				userReview.setrContent(rset.getString(8));
				userReview.setrNum(rset.getInt(9));
			
				userReviewList.add(userReview);
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		return userReviewList;
	}

	public int deleteReview(Connection con, int reNo3) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql =  prop.getProperty("deleteReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reNo3);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
	
		return result;
	}

}
