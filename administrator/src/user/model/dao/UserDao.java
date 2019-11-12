package user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import coupon.model.vo.Coupon;
import reservation.model.vo.Reservation;

import static common.JDBCTemplate.*;

import user.model.vo.IpInfo;
import user.model.vo.User;
import user.model.vo.UserPropic;
import user.model.vo.UserReservation;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String fileName = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	
	

	public int userInsert(Connection con, User user) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query =  prop.getProperty("insertUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUserType());
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPwd());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getEmail());
			
			result= pstmt.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}




	public User loginUser(Connection con, String userId, String userPwd) {

		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =  prop.getProperty("loginUser");
		
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User(rset.getInt("USER_NO"),
								rset.getString("USER_TYPE"),
								rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("USER_PWD"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getString("BIRTHDATE"),
								rset.getString("GENDER"),
								rset.getString("FORIGNYN"),
								rset.getString("STATUS"),
								rset.getString("GRADE"),
								rset.getString("JOIN_DATE")
						);
	

			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return user;
	}




	public int loginBlock(Connection con, int userNo, String flag) {
       
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query =  prop.getProperty("loginBlock");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, flag);
			pstmt.setInt(2, userNo);
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}




	public int ipInfo(Connection con,int uno, String ip, String country,String flag) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query =  prop.getProperty("ipInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setString(2, ip);
			pstmt.setString(3, country);
			pstmt.setString(4, flag);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}




	public ArrayList<IpInfo> selectIpInfo(Connection con, int uno) {
		
		ArrayList<IpInfo> ipinfo = new ArrayList<IpInfo>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query =  prop.getProperty("selectIpInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			

				while(rset.next()) {
				
				IpInfo ip = new IpInfo();
				ip.setCountry(rset.getString("CONNECT_COUNTRY"));
				ip.setDate(rset.getString("CONNECT_DATE"));
				ip.setIp(rset.getString("IP"));
				ip.setSof(rset.getString("SOF"));
				
				ipinfo.add(ip);
				
				}
				
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return ipinfo;
	}




	public String selectFlag(Connection con, int uno) {
		
		String flag ="";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query =  prop.getProperty("selectFlag");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				flag=rset.getString("FORIGNYN");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return flag;
	}




	public User searchUser(Connection con,String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User searchUser = null;
		
		String query =  prop.getProperty("selectUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				searchUser = new User();
				searchUser.setUserNo(rset.getInt("USER_NO"));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return searchUser;
	}




	public int insertUserPropic(Connection con, UserPropic userpropic) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query =  prop.getProperty("insertUserPropic");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userpropic.getUserNo());
			pstmt.setString(2, userpropic.getOriginName());
			pstmt.setString(3, userpropic.getChangeName());
			pstmt.setInt(4, userpropic.getUserNo());
			pstmt.setString(5, userpropic.getOriginName());
			pstmt.setString(6, userpropic.getChangeName());
			
			result =  pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		
		
		return result;
	}




	public UserPropic selectUserPropic(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		UserPropic userpropic = null;
		
		String query =  prop.getProperty("selectUserPropic");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userpropic = new UserPropic(rset.getInt(1),rset.getString(2),rset.getString(3));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		
		return userpropic;
	}




	public ArrayList<UserReservation> SelectCampList(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserReservation> urList = new ArrayList<UserReservation>();
		UserReservation ure = null;
		
		String query =  prop.getProperty("SelectCampList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
								ure = new UserReservation(rset.getInt("RE_NO"),
														rset.getInt("RP_NO"),	
														rset.getDate("PAYMENT_DATE"),
														rset.getString("RE_DATE"),
														rset.getInt("RE_COST"),
														""+rset.getInt("RE_STATUS")+"",
														rset.getString("PAYMENT_TYPE"),
														rset.getInt("USER_NO"),
														rset.getInt("CAMP_CODE"),
														rset.getString("CAMP_NAME")
														);
			
				urList.add(ure);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return urList;
	}




	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}




	public int emailCheck(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}




	public ArrayList<Coupon> selectCouponList(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Coupon> ucList = new ArrayList<Coupon>();
		
		String sql = prop.getProperty("selectUserCouponList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ucList.add(new Coupon(rset.getString(1),
									rset.getString(2),
									rset.getInt(3),
									rset.getString(4),
									rset.getString(5),
									rset.getString(6),
									rset.getString(7),
									rset.getInt(8),
									rset.getInt(9),
									rset.getInt(10),
									rset.getDouble(11)));
	
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return ucList;
		
	}




	public int updateUserPwd(Connection con, int uno, String pwd) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String sql = prop.getProperty("updateUserPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		return result;
	}




	public int updateUserPhone(Connection con, int uno, String phone) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String sql = prop.getProperty("updateUserPhone");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		return result;
	
	}




	public int updateUserEmail(Connection con, int uno, String email) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String sql = prop.getProperty("updateUserEmail");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, uno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		return result;
	}




	public int insertCoupon(Connection con, int uno, String inCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertCoupon");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setString(2, inCode);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		return result;
	}




	public ArrayList<Integer> selectTotalInfo(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ArrayList<Integer> totalInfo = new ArrayList<Integer>();
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectTotalInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalInfo.add(rset.getInt(1));
				totalInfo.add(rset.getInt(2));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return totalInfo;
	}




	public int reservationChange(Connection con, int reNo, int reStatus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("reservationChange");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reStatus);
			pstmt.setInt(2, reNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}




	public int insertJoincode(Connection con, String uid, String rcode) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String sql = prop.getProperty("insertJoincode");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, rcode);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}




	public int deleteRcode(Connection con, String uid, String rcode) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String sql = prop.getProperty("deleteRcode");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, rcode);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}




	public int acceptUser(Connection con, String uid) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String sql = prop.getProperty("acceptUser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}




	public int selectUserNo(Connection con, String uid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int uno =0;
		
		String sql = prop.getProperty("selectUserNo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				uno = rset.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return uno;
	}




	public int userWithdraw(Connection con, int uno) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String sql = prop.getProperty("userWithdraw");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			
			result = pstmt.executeUpdate(); 
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	public int pwdFindUser(Connection con, String uid, String uemail) {
		
		PreparedStatement pstmt = null;
		int result =0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("pwdFindUser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, uemail);
			
			rset =  pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(result);
				
		
		return result;
	}




	public int resetPwd(Connection con, String uid, String pwd1) {
		
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String sql = prop.getProperty("resetPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd1);
			pstmt.setString(2, uid);
			
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
