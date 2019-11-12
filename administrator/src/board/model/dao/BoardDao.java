package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.Comment;


public class BoardDao {
	
	Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int getListCount(Connection conn, int bTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("listCount");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bTag);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	

	public ArrayList<Board> selectList(Connection conn, int bTag, int currentPage, int boardLimit) {
		PreparedStatement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<Board>();;
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			stmt.setInt(1, bTag);
			stmt.setInt(2, startRow);
			stmt.setInt(3, endRow);
			
			rset = stmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTag(rset.getInt("b_tag"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				b.setbRegion(rset.getInt("b_region"));
				
				if(rset.getInt("user_no") == 9999) {
					b.setbWriter(rset.getString("dispo_id"));
				}else {
					b.setbWriter(rset.getString("user_name"));
				}
				
				blist.add(b);
			}			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		

		return blist;
	}

	public int increaseCount(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public Board detailList(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = new Board();
		String sql = prop.getProperty("detailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b.setbNo(rset.getInt("b_no"));
				b.setbTag(rset.getInt("b_tag"));
				b.setbTitle(rset.getString("b_title"));
				b.setbCount(rset.getInt("b_count"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbContent(rset.getString("b_content"));
				b.setbRegion(rset.getInt("b_region"));
				b.setUserNo(rset.getInt("user_no"));
				
				if(rset.getInt("user_no") == 9999) {
					b.setbWriter(rset.getString("dispo_id"));
				}else {
					b.setbWriter(rset.getString("user_name"));
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public String selectPwd(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String checkPwd = "";
		
		String sql = prop.getProperty("selectPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkPwd = rset.getString("dispo_pwd");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return checkPwd;
	}

	public int deleteList(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getNextNo(Connection conn, int bTag, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int nextNo = 0;
		
		String sql = prop.getProperty("nextNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bTag);
			pstmt.setInt(2, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nextNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return nextNo;
	}

	
	public int getPreNo(Connection conn, int bNo, int bTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int preNo = 0;
		
		String sql = prop.getProperty("preNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bTag);
			pstmt.setInt(2, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				preNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return preNo;
	}
	
	
	public String getNextTitle(Connection conn, int bNo, int bTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		String nextTitle = "";
		
		String sql = prop.getProperty("nextTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bTag);
			pstmt.setInt(2, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nextTitle = rset.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return nextTitle;
	}

	public String getPreTitle(Connection conn, int bNo, int bTag) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		String preTitle = "";
		
		String sql = prop.getProperty("preTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bTag);
			pstmt.setInt(2, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				preTitle = rset.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return preTitle;
	}

	public ArrayList<Comment> getCommentList(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> cList = new ArrayList<>();
		
		String sql = prop.getProperty("getCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comment c = new Comment();
				
				c.setcNo(rset.getInt("c_no"));
				c.setcContent(rset.getString("c_content"));
				c.setReviewScore(rset.getInt("review_score"));
				c.setCampCode(rset.getInt("camp_code"));
				c.setUserNo(rset.getInt("comment_writer"));
				c.setbNo(rset.getInt("b_no"));
				
				if(rset.getInt("comment_writer") == 9999) {
					c.setcWriter(rset.getString("dispo_id"));
				}else {
					c.setcWriter(rset.getString("user_name"));
				}
				
				
				cList.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}

	public int insertComment(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getcContent());
			pstmt.setString(2, c.getDispoId());
			pstmt.setString(3, c.getDispoPwd());
			pstmt.setInt(4, c.getbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	
	public int insertMemberComment(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertMemberComment");
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getcContent());
			pstmt.setInt(2, c.getbNo());
			pstmt.setInt(3, c.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String title = b.getbTitle();		
		
		String region = "";
		
		if(!title.equals("")) {
			
			switch (b.getbRegion()) {
			case 1:
				region = "[서울]  ";
				break;
			case 2:
				region = "[경기]  ";
				break;
			case 3:
				region = "[강원]  ";
				break;
			case 4:
				region = "[경상]  ";
				break;
			case 5:
				region = "[전라]  ";
				break;
			case 6:region = "[충청]  ";
				break;
			}
			
			title = region + title;
		}
		
		
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, b.getbTag());
			pstmt.setInt(4, b.getbRegion());
			pstmt.setInt(5, b.getUserNo());
			
			if(b.getUserNo() == 9999) {
				pstmt.setString(6, b.getbWriter());
				pstmt.setString(7, b.getPwd());
			}else {
				pstmt.setString(6, "---");
				pstmt.setString(7, "---");
			}
			
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertNotice(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, b.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public String checkCommentPwd(Connection conn, int cNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String checkPwd = "";
		
		String sql = prop.getProperty("commentPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkPwd = rset.getString("dispo_pwd");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return checkPwd;
	}

	public int deleteComment(Connection conn, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int searchCount(Connection conn, String tag, String keyWord, int bTag) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0; 
		
		String sql = "";
		
			
		try {
			if(tag.equals("title")) {
				sql = prop.getProperty("titleSearchCount");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			
			}else if(tag.equals("writer")) {
				sql = prop.getProperty("writerSearchCount");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				pstmt.setString(3, keyWord);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
			}else {
				sql = prop.getProperty("contentSearchCount");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}

	
	

	
	
	public ArrayList<Board> searchBoard(Connection conn, String tag, String keyWord, int bTag, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = "";
		
		try {		
			if(tag.equals("title")) {
				sql = prop.getProperty("titleSearchBoard");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Board b = new Board();
					b.setbNo(rset.getInt("b_no"));
					b.setbTag(rset.getInt("b_tag"));
					b.setbTitle(rset.getString("b_title"));
					b.setUpdateDate(rset.getDate("update_date"));
					b.setbCount(rset.getInt("b_count"));	
					b.setbRegion(rset.getInt("b_region"));
					
					if(rset.getInt("user_no") == 9999) {
						b.setbWriter(rset.getString("dispo_id"));
					}else {
						b.setbWriter(rset.getString("user_name"));
					}
					
					blist.add(b);
				}
				
			}else if(tag.equals("writer")){
				sql = prop.getProperty("writerSearchBoard");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				pstmt.setString(3, keyWord);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Board b = new Board();
					b.setbNo(rset.getInt("b_no"));
					b.setbTag(rset.getInt("b_tag"));
					b.setbTitle(rset.getString("b_title"));
					b.setUpdateDate(rset.getDate("update_date"));
					b.setbCount(rset.getInt("b_count"));	
					b.setbRegion(rset.getInt("b_region"));
					
					if(rset.getInt("user_no") == 9999) {
						b.setbWriter(rset.getString("dispo_id"));
					}else {
						b.setbWriter(rset.getString("user_name"));
					}
					
					blist.add(b);
				}
				
			}else {
				sql = prop.getProperty("commentSearchBoard");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bTag);
				pstmt.setString(2, keyWord);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Board b = new Board();
					b.setbNo(rset.getInt("b_no"));
					b.setbTag(rset.getInt("b_tag"));
					b.setbTitle(rset.getString("b_title"));
					b.setUpdateDate(rset.getDate("update_date"));
					b.setbCount(rset.getInt("b_count"));	
					b.setbRegion(rset.getInt("b_region"));
					
					if(rset.getInt("user_no") == 9999) {
						b.setbWriter(rset.getString("dispo_id"));
					}else {
						b.setbWriter(rset.getString("user_name"));
					}
					
					blist.add(b);
				}
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		
		return blist;
	}

	public int getRegionListCount(Connection conn, int bRegion) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("regionListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bRegion);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Board> selectRegionList(Connection conn, int bRegion, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		
		String sql = prop.getProperty("selectRegionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bRegion);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTag(rset.getInt("b_tag"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				b.setbRegion(rset.getInt("b_region"));
				
				if(rset.getInt("user_no") == 9999) {
					b.setbWriter(rset.getString("dispo_id"));
				}else {
					b.setbWriter(rset.getString("user_name"));
				}
				
				blist.add(b);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}

	public int getMyBoardCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int myBoardCount = 0;
		
		String sql = prop.getProperty("myBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				myBoardCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return myBoardCount;
	}

	public ArrayList<Board> getMyBoard(Connection conn, int userNo, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		
		String sql = prop.getProperty("getMyBoard");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				
				blist.add(b);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		return blist;
	}

	public HashMap getcCount(Connection conn, ArrayList<Board> blist) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap cCount = new HashMap();
		
		String sql = prop.getProperty("getcCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(Board b : blist) {
				pstmt.setInt(1, b.getbNo());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					cCount.put(rset.getInt(1), rset.getInt(2));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return cCount;
	}

	public int searchMyCount(Connection conn, int userNo, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int myBoardCount = 0;
		
		String sql = prop.getProperty("searchMyBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				myBoardCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return myBoardCount;
	}

	public ArrayList<Board> searchMyBoard(Connection conn, int userNo, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("searchMyBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				
				blist.add(b);
			}
					
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}

	public int getMyCommentCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("myCommentCount");

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

	public ArrayList<Comment> getMyComment(Connection conn, int userNo, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> clist = new ArrayList<>();
		
		String sql = prop.getProperty("getMyComment");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comment c = new Comment();
				c.setcNo(rset.getInt("c_no"));
				c.setcContent(rset.getString("c_content"));
				c.setUpdateDate(rset.getDate("update_date"));
				c.setbNo(rset.getInt("b_no"));				
				
				clist.add(c);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		
		return clist;
	}

	public HashMap getbTitle(Connection conn, ArrayList<Comment> clist) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap bTitle = new HashMap();
		
		String sql = prop.getProperty("getbTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(Comment c : clist) {
				pstmt.setInt(1, c.getcNo());
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					bTitle.put(rset.getInt(1), rset.getString(2));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return bTitle;
	}

	public int searchMyCommentCount(Connection conn, int userNo, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("searchMyCommentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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

	public ArrayList<Comment> searchMyComment(Connection conn, int userNo, String keyWord, int currentPage,
			int boardLimit) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> clist = new ArrayList<>();
		
		String sql = prop.getProperty("searchMyComment");
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, keyWord);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comment c = new Comment();
				c.setcNo(rset.getInt("c_no"));
				c.setcContent(rset.getString("c_content"));
				c.setUpdateDate(rset.getDate("update_date"));
				c.setbNo(rset.getInt("b_no"));				
				
				clist.add(c);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		
		return clist;
	}

	public int getAllListCount(Connection conn) {
		Statement stmt =null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("allListCount");
		
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

	public ArrayList<Board> getAllListBoard(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("allListBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				
				if(rset.getInt("board_writer") == 9999) {
					b.setbWriter(rset.getString("dispo_id"));
				}else {
					b.setbWriter(rset.getString("user_name"));
				}
				
				blist.add(b);
			}
					
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}

	public int searchAllCount(Connection conn, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listcount = 0;
		
		String sql = prop.getProperty("allSearchCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setString(4, keyWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listcount = rset.getInt(1);
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listcount;
	}

	public ArrayList<Board> searchAllBoard(Connection conn, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("allSearchBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setString(4, keyWord);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				
				if(rset.getInt("board_writer") == 9999) {
					b.setbWriter(rset.getString("dispo_id"));
				}else {
					b.setbWriter(rset.getString("user_name"));
				}
				
				blist.add(b);
			}
					
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}

	public int getAllCommentCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("allCommentCount");
		
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

	public ArrayList<Comment> getAllListComment(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> clist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("allComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comment c = new Comment();
				c.setcNo(rset.getInt("c_no"));
				c.setcContent(rset.getString("c_content"));
				c.setUpdateDate(rset.getDate("update_date"));
				c.setbNo(rset.getInt("b_no"));			
				
				if(rset.getInt("comment_writer") == 9999) {
					c.setcWriter(rset.getString("dispo_id"));
				}else {
					c.setcWriter(rset.getString("user_name"));
				}		
				
				clist.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		
		
		return clist;
	}

	public int deleteComment2(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardCommentDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int searchAllCommentCount(Connection conn, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("allSearchCommentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
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

	public ArrayList<Comment> searchAllListComment(Connection conn, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> clist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("allSearchComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			pstmt.setString(3, keyWord);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comment c = new Comment();
				c.setcNo(rset.getInt("c_no"));
				c.setcContent(rset.getString("c_content"));
				c.setUpdateDate(rset.getDate("update_date"));
				c.setbNo(rset.getInt("b_no"));			
				
				if(rset.getInt("comment_writer") == 9999) {
					c.setcWriter(rset.getString("dispo_id"));
				}else {
					c.setcWriter(rset.getString("user_name"));
				}		
				
				clist.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public int getAllNoticeCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("allNoticeCount");
		
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

	public ArrayList<Board> getAllNotice(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("allNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				b.setbWriter(rset.getString("user_name"));
				
				blist.add(b);
			}
					
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}

	public int getSearchNoticeCount(Connection conn, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("searchNoticeCount");
		
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

	public ArrayList<Board> getSearchearchNotice(Connection conn, String keyWord, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		String sql = prop.getProperty("searchNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, keyWord);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("b_no"));
				b.setbTitle(rset.getString("b_title"));
				b.setUpdateDate(rset.getDate("update_date"));
				b.setbCount(rset.getInt("b_count"));	
				b.setbWriter(rset.getString("user_name"));
				
				blist.add(b);
			}
					
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blist;
	}



}
