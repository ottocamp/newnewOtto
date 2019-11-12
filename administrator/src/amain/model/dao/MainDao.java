package amain.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import grade.model.dao.GradeDao;
import amain.model.vo.MainAccumJoin;
import amain.model.vo.MainBoardIndex;
import amain.model.vo.MainIndexBar;
import amain.model.vo.MainJoinCount;
import static common.JDBCTemplate.*;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao() {
		String fileName = GradeDao.class.getResource("/sql/main/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public ArrayList<MainAccumJoin> selectMAJList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MainAccumJoin> majList = new ArrayList<MainAccumJoin>();
		
		String sql = prop.getProperty("selectMAJList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				majList.add(new MainAccumJoin(rset.getString(1),
												rset.getInt(2)));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return majList;
	}

	public ArrayList<MainBoardIndex> selectMBILIst(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MainBoardIndex> mbiList = new ArrayList<MainBoardIndex>();
		
		String sql = prop.getProperty("selectMBILIst");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				mbiList.add(new MainBoardIndex(rset.getInt(1),
												rset.getString(2),
												rset.getString(3),
												rset.getDate(4),
												rset.getInt(5),
												rset.getInt(6),
												rset.getInt(7),
												rset.getString(8),
												rset.getString(9),
												rset.getString(10),
												rset.getInt(11),
												rset.getString(12)));			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return mbiList;
	}

	public ArrayList<MainIndexBar> selectMIBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MainIndexBar> mibList = new ArrayList<MainIndexBar>();
		
		String sql = prop.getProperty("selectMIBList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				mibList.add(new MainIndexBar(rset.getInt(1),
												rset.getInt(2),
												rset.getInt(3),
												rset.getInt(4)));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return mibList;
	}

	public ArrayList<MainJoinCount> selectMJCList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MainJoinCount> mjcList = new ArrayList<MainJoinCount>();
		
		String sql = prop.getProperty("selectMJCList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				mjcList.add(new MainJoinCount(rset.getString(1),
											rset.getInt(2)));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		
		return mjcList;
	}

}
