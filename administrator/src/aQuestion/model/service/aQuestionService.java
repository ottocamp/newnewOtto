package aQuestion.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import aQuestion.model.dao.aQuestionDao;
import aQuestion.model.vo.aQuestion;
import static common.JDBCTemplate.*;

public class aQuestionService {

	public ArrayList<aQuestion> selectList() {
		Connection conn = getConnection();
		
		ArrayList<aQuestion> qList = new aQuestionDao().selectList(conn);
		
		close(conn);
		
		
		return qList;
	}

	public int answerQuestion(String qCode, String comment) {
		Connection conn = getConnection();
		
		
		int result = new aQuestionDao().answerQuestion(conn, qCode, comment);
		
		if(result > 0) {
			commit(conn);			
		}else {
			rollback(conn);
		}
		close(conn);
			
		return result;
	}

}
