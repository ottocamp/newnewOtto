package question.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import question.model.vo.Question;

public class QuestionDao {

	Properties prop = new Properties();
	
	public QuestionDao() {
		String fileName = QuestionDao.class.getResource("/sql/question/question-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int getFreqQesCount(Connection conn, int qTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int qesCount = 0;
		
		String sql = "";
		
		try {
			
			if(qTag == 999) {
				sql = prop.getProperty("freqQesCount");				
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					qesCount = rset.getInt(1);
				}
			}else {
				sql = prop.getProperty("freqTagQesCount");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qTag);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					qesCount = rset.getInt(1);
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qesCount;
	}
	
	
	public ArrayList<Question> getFreqQesList(Connection conn, int qTag, int currentPage, int qesLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();		
		
		String sql = "";
		
		
		
		
		try {

			if(qTag == 999) {
				sql = prop.getProperty("getFreqQesList");	
				pstmt = conn.prepareStatement(sql);
				int startRow = (currentPage - 1) * qesLimit + 1;
				int endRow = startRow + qesLimit - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Question q = new Question();
					q.setqTitle(rset.getString("q_title"));
					q.setqContent(rset.getString("q_content"));
					q.setqTag(rset.getInt("q_tag"));
					q.setqNo(rset.getInt("q_no"));
					
					
					qlist.add(q);
				}
				
			}else {
				sql = prop.getProperty("getFreqTagQesList");
				pstmt = conn.prepareStatement(sql);
				int startRow = (currentPage - 1) * qesLimit + 1;
				int endRow = startRow + qesLimit - 1;
				
				pstmt.setInt(1, qTag);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Question q = new Question();
					q.setqTitle(rset.getString("q_title"));
					q.setqContent(rset.getString("q_content"));
					q.setqTag(rset.getInt("q_tag"));
					q.setqNo(rset.getInt("q_no"));
					
					
					qlist.add(q);
				}
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return qlist;
	}


	public int searchFreqCount(Connection conn, String keyWord, int qTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int qesCount = 0;

		String sql = "";
		
		try {
			
			if(qTag == 999) {
				sql = prop.getProperty("searchFreqCount");	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyWord);
				pstmt.setString(2, keyWord);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					qesCount = rset.getInt(1);
				}
				
			}else {
				sql = prop.getProperty("searchTagFreqCount");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyWord);
				pstmt.setString(2, keyWord);
				pstmt.setInt(3, qTag);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					qesCount = rset.getInt(1);
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qesCount;
	}


	public ArrayList<Question> searchFreqQuestion(Connection conn, String keyWord, int qTag, int currentPage, int qesLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();

		String sql = ""; 
		
		try {
			
			if(qTag == 999) {
				sql = prop.getProperty("searchFreqQuestion");	
				pstmt = conn.prepareStatement(sql);
				int startRow = (currentPage - 1) * qesLimit + 1;
				int endRow = startRow + qesLimit - 1;
				
				pstmt.setString(1, keyWord);
				pstmt.setString(2, keyWord);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Question q = new Question();
					q.setqTitle(rset.getString("q_title"));
					q.setqContent(rset.getString("q_content"));
					q.setqTag(rset.getInt("q_tag"));
					q.setqNo(rset.getInt("q_no"));
					
					
					qlist.add(q);
				}
				
			}else {
				sql = prop.getProperty("searchFreqTagQuestion");
				pstmt = conn.prepareStatement(sql);
				int startRow = (currentPage - 1) * qesLimit + 1;
				int endRow = startRow + qesLimit - 1;
				
				pstmt.setInt(1, qTag);
				pstmt.setString(2, keyWord);
				pstmt.setString(3, keyWord);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);

				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Question q = new Question();
					q.setqTitle(rset.getString("q_title"));
					q.setqContent(rset.getString("q_content"));
					q.setqTag(rset.getInt("q_tag"));
					q.setqNo(rset.getInt("q_no"));
					
					
					qlist.add(q);
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return qlist;
	}


	public Question getNoMemQuestion(Connection conn, String memId, String memPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question q = null;
		
		String sql = prop.getProperty("getNoMemQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Question();
				
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setaWriter(rset.getString("user_name"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}


	public int myQesCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("myQesCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	


	public ArrayList<Question> getMyQuestion(Connection conn, int userNo, int currentPage, int qesLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("getMyQuestion");
		int startRow = (currentPage - 1) * qesLimit + 1;
		int endRow = startRow + qesLimit - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setaWriter(rset.getString("user_name"));
				
				qlist.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return qlist;
	}


	public int searchMyQesCount(Connection conn, int userNo, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		int qesCount = 0;
		
		String sql = prop.getProperty("serachMyQesCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qesCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return qesCount;
	}


	public ArrayList<Question> searchMyQuestion(Connection conn, int userNo, String keyWord, int currentPage, int qesLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("searchMyQuestion");
		int startRow = (currentPage - 1) * qesLimit + 1;
		int endRow = startRow + qesLimit - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setaWriter(rset.getString("user_name"));
				
				qlist.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return qlist;
	}


	public int getAdminListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("adminAnswerListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}


	public ArrayList<Question> getAdminListCount(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("adminAnswerList");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setqNo(rset.getInt("q_no"));
				
				qlist.add(q);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qlist;
	}


	public String getQesWriter(Connection conn, int getqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String qesWriter = "";
		
		String sql = prop.getProperty("getQesWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				if(rset.getInt("user_no") == 9999) {
					qesWriter = rset.getString("dispo_id");
				}else {
					qesWriter = rset.getString("user_name");
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return qesWriter;
	}


	public int getListCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("answerListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}


	public ArrayList<Question> getAnswerList(Connection conn, int userNo, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("answerList");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setqNo(rset.getInt("q_no"));
				
				qlist.add(q);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qlist;
	}


	public int searchAdminListCount(Connection conn, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("searchAdminCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}


	public int searchListCount(Connection conn, int userNo, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("searchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}


	public ArrayList<Question> searchAdminList(Connection conn, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("searchAdminList");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setqNo(rset.getInt("q_no"));
				
				qlist.add(q);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qlist;
	}


	public ArrayList<Question> searchAnswerList(Connection conn, int userNo, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> qlist = new ArrayList<>();
		
		String sql = prop.getProperty("searchAnswerList");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Question q = new Question();
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setUpdateDate(rset.getDate("update_date"));
				q.setAns(rset.getString("ans"));
				q.setAnsYN(rset.getString("ans_yn"));
				q.setqNo(rset.getInt("q_no"));
				
				qlist.add(q);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qlist;
	}


	public int insertAnswer(Connection conn, String answer, int qNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, qNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			if(q.getUserNo() == 9999) {
				pstmt.setString(3, q.getqWriter());
				pstmt.setString(4, q.getPwd());
			}else {
				pstmt.setString(3, "---");
				pstmt.setString(4, "---");
			}
			
			pstmt.setInt(5, q.getUserNo());
			pstmt.setInt(6, Integer.parseInt(q.getaWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}


	public int checkIdPwd(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("checkIdPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	

}