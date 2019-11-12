package amain.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import amain.model.dao.MainDao;
import amain.model.vo.MainAccumJoin;
import amain.model.vo.MainBoardIndex;
import amain.model.vo.MainIndexBar;
import amain.model.vo.MainJoinCount;

public class MainService {

	public ArrayList<MainAccumJoin> selectMAJList() {
		Connection conn = getConnection();
	
		ArrayList<MainAccumJoin> majList = new MainDao().selectMAJList(conn);
		
		close(conn);
		
		return majList;
	}

	public ArrayList<MainBoardIndex> selectMBILIst() {
		Connection conn = getConnection();
		
		ArrayList<MainBoardIndex> mbiList = new MainDao().selectMBILIst(conn);
				
		close(conn);
		
		return mbiList;
	}

	public ArrayList<MainIndexBar> selectMIBList() {
		Connection conn = getConnection();
		
		ArrayList<MainIndexBar> mibList = new MainDao().selectMIBList(conn);
		
		close(conn);
		
		return mibList;
	}

	public ArrayList<MainJoinCount> selectMJCList() {
		Connection conn = getConnection();
		ArrayList<MainJoinCount> mjcList = new MainDao().selectMJCList(conn);
		
		close(conn);
		
		return mjcList;
	}

}
