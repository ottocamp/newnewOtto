package camp.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import camp.model.dao.CampRefoDao;
import camp.model.vo.CampRefoEnter;

public class CampRefoService {

	public ArrayList<CampRefoEnter> selectCampList(int cNo) {
		Connection conn = getConnection();
		
		ArrayList<CampRefoEnter> eList = new CampRefoDao().selectCampReList(conn, cNo);
		
		close(conn);
		
		return eList;
	}


}
