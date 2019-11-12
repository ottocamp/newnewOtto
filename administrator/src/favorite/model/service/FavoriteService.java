package favorite.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import camp.model.vo.Attachment;
import camp.model.vo.CampInfo;
import favorite.model.dao.FavoriteDao;

public class FavoriteService {

	public ArrayList<CampInfo> selectList(int uno) {
		
		Connection conn = getConnection();
		
		ArrayList<CampInfo> cList = new FavoriteDao().selectList(conn,uno);
		
		close(conn);
		
		
		return cList;
		

	}

	public ArrayList<Attachment> selectAttachmentList() {
		Connection conn = getConnection();
		
		ArrayList<Attachment> aList = new FavoriteDao().selectAttachmentList(conn);
		
		close(conn);
		
		return aList;
	}

	public int campCancel(int uno, int code) {
		Connection conn = getConnection();
		
		int result = new FavoriteDao().campCancel(conn,uno, code);
		
		if(result > 0) {
			commit(conn);			
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;

	}

	public int campInsert(int uno, int code) {
		Connection conn = getConnection();
		
		int result = new FavoriteDao().campInsert(conn,uno,code);
		
		if(result > 0) {
			commit(conn);			
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	public static ArrayList<Integer> selectCode(int uno) {
		Connection conn = getConnection();
		
		ArrayList<Integer> codeList = new FavoriteDao().selectCode(conn,uno);
		
		return codeList;
	}

}
