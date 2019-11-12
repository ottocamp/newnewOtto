package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Comment;

public class BoardService {

	public int getListCount(int bTag) {
		Connection conn = getConnection();
		
		int result = new BoardDao().getListCount(conn, bTag);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectList(int bTag, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().selectList(conn, bTag, currentPage, boardLimit);
		
		close(conn);			
		
		return blist;
	}

	public Board detailList(int bNo) {
		Connection conn = getConnection();
		Board b = null;

		int result = new BoardDao().increaseCount(conn, bNo);
		
		if(result > 0) {
			b = new BoardDao().detailList(conn, bNo);			
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return b;
	}
	
	
	public Board detailListNoCount(int bNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().detailList(conn, bNo);			
		
		close(conn);
		
		
		return b;
	}
	
	

	public String selectPwd(int bNo) {
		Connection conn = getConnection();
		
		String checkPwd = new BoardDao().selectPwd(conn, bNo);
		
		close(conn);
		
		return checkPwd;
	}

	public int deleteList(int bNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteList(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public int getNextNo(int bNo, int bTag) {
		Connection conn = getConnection();
		
		int nextNo = new BoardDao().getNextNo(conn, bTag, bNo);
		
		close(conn);
		
		return nextNo;
	}

	
	public int getPreNo(int bNo, int bTag) {
		Connection conn = getConnection();
		
		int preNo = new BoardDao().getPreNo(conn, bNo, bTag);
		
		close(conn);
		
		return preNo;
	}
	
	

	public String getNextTitle(int bNo, int bTag) {
		Connection conn = getConnection();
		
		String nextTitle = new BoardDao().getNextTitle(conn, bNo, bTag);
		
		close(conn);
		
		return nextTitle;
	}

	public String getPreTitle(int bNo, int bTag) {
		Connection conn = getConnection();
		
		String preTitle = new BoardDao().getPreTitle(conn, bNo, bTag);
		
		close(conn);
		
		return preTitle;
	}

	public ArrayList<Comment> getCommentList(int bNo) {
		Connection conn = getConnection();
		
		ArrayList<Comment> cList = new BoardDao().getCommentList(conn, bNo);
		
		close(conn);
		
		
		return cList;
	}

	public ArrayList<Comment> insertComment(Comment c) {
		Connection conn = getConnection();
		ArrayList<Comment> cList = new ArrayList<>();
		
		
		int result = new BoardDao().insertComment(conn, c);
		
		if(result > 0) {
			cList = new BoardDao().getCommentList(conn, c.getbNo());
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return cList;
	}
	
	
	public ArrayList<Comment> insertMemberComment(Comment c) {
		Connection conn = getConnection();
		ArrayList<Comment> cList = new ArrayList<>();
		
		int result = new BoardDao().insertMemberComment(conn, c);
		
		if(result > 0) {
			cList = new BoardDao().getCommentList(conn, c.getbNo());
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return cList;
	}
	

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertNotice(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertNotice(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public String checkCommentPwd(int cNo) {
		Connection conn = getConnection();
		
		String checkPwd = new BoardDao().checkCommentPwd(conn, cNo);
		
		close(conn);
		
		
		return checkPwd;
	}

	public int deleteComment(int cNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteComment(conn, cNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int searchCount(String tag, String keyWord, int bTag) {
		Connection conn = getConnection();
		int listCount = 0;
		

		listCount = new BoardDao().searchCount(conn, tag, keyWord, bTag);
		
		close(conn);
		
		
		return listCount;
	}

	public ArrayList<Board> searchBoard(String tag, String keyWord, int bTag, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().searchBoard(conn, tag, keyWord, bTag, currentPage, boardLimit);
		
		close(conn);
		
		return blist;
	}

	public int getRegionListCount(int bRegion) {
		Connection conn = getConnection();
		
		int result = new BoardDao().getRegionListCount(conn, bRegion);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectRegionList(int bRegion, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().selectRegionList(conn, bRegion, currentPage, boardLimit);
		
		close(conn);
		
		return blist;
	}

	public int getMyBoardCount(int userNo) {
		Connection conn = getConnection();
		
		int myBoardCount = new BoardDao().getMyBoardCount(conn, userNo);
		
		close(conn);
		
		return myBoardCount;
	}

	public ArrayList<Board> getMyBoard(int userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().getMyBoard(conn, userNo, currentPage, boardLimit);
		
		close(conn);
		
		return blist;
	}

	public HashMap getcCount(ArrayList<Board> blist) {
		Connection conn = getConnection();
		
		HashMap cCount = new BoardDao().getcCount(conn, blist);
		
		close(conn);
		
		return cCount;
	}

	public int searchMyCount(int userNo, String keyWord) {
		Connection conn = getConnection();
		
		int myBoardCount = new BoardDao().searchMyCount(conn, userNo, keyWord);
		
		close(conn);

		return myBoardCount;
	}

	public ArrayList<Board> searchMyBoard(int userNo, String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().searchMyBoard(conn, userNo, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return blist;
	}

	public int getMyCommentCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getMyCommentCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Comment> getMyComment(int userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new BoardDao().getMyComment(conn, userNo, currentPage, boardLimit);
		
		close(conn);
		
		return clist;
	}

	public HashMap getbTitle(ArrayList<Comment> clist) {
		Connection conn = getConnection();
		
		HashMap bTitle = new BoardDao().getbTitle(conn, clist);
		
		close(conn);
		
		return bTitle;
	}

	public int searchMyCommentCount(int userNo, String keyWord) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().searchMyCommentCount(conn, userNo, keyWord);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Comment> searchMyComment(int userNo, String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new BoardDao().searchMyComment(conn, userNo, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return clist;
	}

	public int getAllListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getAllListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> getAllListBoard(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().getAllListBoard(conn, currentPage, boardLimit);
			
		return blist;
	}

	public int searchAllCount(String keyWord) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().searchAllCount(conn, keyWord);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> searchAllBoard(String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().searchAllBoard(conn, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return blist;
	}

	public int getAllCommentCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getAllCommentCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Comment> getAllListComment(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new BoardDao().getAllListComment(conn, currentPage, boardLimit);
		
		close(conn);
		
		return clist;
	}

	public int deleteComment2(int bNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteComment2(conn, bNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int searchAllCommentCount(String keyWord) {
		Connection conn = getConnection();
		
		int result = new BoardDao().searchAllCommentCount(conn, keyWord);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Comment> searchAllListComment(String keyWord, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new BoardDao().searchAllListComment(conn, keyWord, currentPage, boardLimit);
		
		close(conn);
		
		return clist;
	}

	public int getAllNoticeCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getAllNoticeCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> getAllNotice(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> blist = new BoardDao().getAllNotice(conn, currentPage, boardLimit);
			
		return blist;
	}







}
