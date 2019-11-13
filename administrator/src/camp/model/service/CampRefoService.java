package camp.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import camp.model.dao.CampRefoDao;
import camp.model.vo.CampRefoOptionEnter;
import camp.model.vo.CampRefoSiteEnter;

public class CampRefoService {

	public ArrayList<CampRefoSiteEnter> selectSiteList(int cNo) {
		Connection conn = getConnection();
		
		ArrayList<CampRefoSiteEnter> sList = new CampRefoDao().selectSiteList(conn, cNo);
		
		close(conn);
		System.out.println("0-2 : " + sList);
		return sList;
	}

	public ArrayList<CampRefoOptionEnter> selectOptionList(int cNo) {
		Connection conn = getConnection();
		
		ArrayList<CampRefoOptionEnter> oList = new CampRefoDao().selectOptionList(conn, cNo);
		
		close(conn);
		System.out.println("1-2 : " + oList);
		return oList;
	}


}
