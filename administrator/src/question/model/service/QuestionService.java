package question.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import question.model.dao.QuestionDao;
import question.model.vo.Question;

public class QuestionService {

	public int getFreqQesCount(int qTag) {
		Connection conn = getConnection();
		
		
		int qesCount = new QuestionDao().getFreqQesCount(conn, qTag);
		
		close(conn);
		
		return qesCount;
	}

	
	public ArrayList<Question> gerFreqQesList(int qTag, int currentPage, int qesLimit) {
		Connection conn = getConnection();
			
		
		ArrayList<Question> qlist = new QuestionDao().getFreqQesList(conn, qTag, currentPage, qesLimit);
		
		close(conn);
		
		return qlist;
	}


	public int searchFreqCount(String keyWord, int qTag) {
		Connection conn = getConnection();

		int listCount = new QuestionDao().searchFreqCount(conn, keyWord, qTag);
		
		close(conn);
		
		return listCount;
	}


	public ArrayList<Question> searchFreqQuestion(String keyWord, int qTag, int currentPage, int qesLimit) {
		Connection conn = getConnection();

		ArrayList<Question> qlist = new QuestionDao().searchFreqQuestion(conn, keyWord, qTag, currentPage, qesLimit);
		
		close(conn);			
		
		return qlist;
	}


	public Question getNoMemQuestion(String memId, String memPwd) {
		Connection conn = getConnection();
		
		Question q = new QuestionDao().getNoMemQuestion(conn, memId, memPwd);
		close(conn);
		
		return q;
	}

	

	public int myQesCount(int userNo) {
		Connection conn = getConnection();
		
		int count = new QuestionDao().myQesCount(conn, userNo);
		
		close(conn);

		return count;
	}


	public ArrayList<Question> getMyQuestion(int userNo, int currentPage, int qesLimit) {
		Connection conn = getConnection();
		
		ArrayList<Question> qlist = new QuestionDao().getMyQuestion(conn, userNo, currentPage, qesLimit);
		
		close(conn);
		
		return qlist;
	}


	public int searchMyQesCount(int userNo, String keyWord) {
		Connection conn = getConnection();
		
		int qesCount = new QuestionDao().searchMyQesCount(conn, userNo, keyWord);
		
		close(conn);
		
		return qesCount;
	}


	public ArrayList<Question> searchMyQuestion(int userNo, String keyWord, int currentPage, int qesLimit) {
		Connection conn = getConnection();

		ArrayList<Question> qlist = new QuestionDao().searchMyQuestion(conn, userNo, keyWord, currentPage, qesLimit);
		
		close(conn);
		
		return qlist;
	}


	public int getAdminListCount() {
		Connection conn = getConnection();
		
		int listCount = new QuestionDao().getAdminListCount(conn);
		
		close(conn);
		
		return listCount;
	}


	public ArrayList<Question> getAdminList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Question> qlist = new QuestionDao().getAdminListCount(conn, currentPage, boardLimit);
		
		close(conn);
		
		return qlist;
	}


	public String getQesWriter(int getqNo) {
		Connection conn = getConnection();
		
		String qesWriter = new QuestionDao().getQesWriter(conn, getqNo);
		
		close(conn);
		
		return qesWriter;
	}


	public int getListCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new QuestionDao().getListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}


	public ArrayList<Question> getAnswerList(int userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Question> qlist = new QuestionDao().getAnswerList(conn, userNo, currentPage, boardLimit);
		
		close(conn);
		
		return qlist;
	}


	public int searchAdminListCount(String keyWord) {
		Connection conn = getConnection();
		
		int listCount = new QuestionDao().searchAdminListCount(conn, keyWord);
		
		close(conn);
		
		return listCount;
	}


	public int searchListCount(int userNo, String keyWord) {
		Connection conn = getConnection();
		
		int listCount = new QuestionDao().searchListCount(conn, userNo, keyWord);
		
		close(conn);
		
		return listCount;
	}


	public ArrayList<Question> searchAdminList(String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Question> qlist = new QuestionDao().searchAdminList(conn, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return qlist;
	}


	public ArrayList<Question> searchAnswerList(int userNo, String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Question> qlist = new QuestionDao().searchAnswerList(conn, userNo, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return qlist;
	}


	public int insertAnswer(String answer, int qNo) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().insertAnswer(conn, answer, qNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			
		close(conn);
		
		return result;
	}


	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().insertQuestion(conn, q);
			
		close(conn);
		
		return result;
	}


	public int checkIdPwd(String writer) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().checkIdPwd(conn, writer);
		
		close(conn);
		
		return result;
	}




	
	
}
