package sales.model.sevice;

import java.sql.Connection;
import java.util.ArrayList;

import sales.model.dao.SalesDao;
import sales.model.vo.CampDaySales;
import sales.model.vo.CampMonthSales;
import sales.model.vo.CampSales;
import sales.model.vo.CampYearSales;
import sales.model.vo.SiteDaySales;
import sales.model.vo.SiteMonthSales;
import sales.model.vo.SiteYearSales;
import sales.model.vo.TopCampSales;
import sales.model.vo.TopMemberSales;

import static common.JDBCTemplate.*;

public class SalesService {

	public ArrayList<CampSales> selectList(String startDate, String endDate) {
		Connection conn = getConnection();
		
		ArrayList<CampSales> csList = new SalesDao().selectList(conn,startDate,endDate);
		
		close(conn);
		
		
		return csList;
	}

	public ArrayList<CampMonthSales> selectMonthList(String startDate, String endDate) {
		Connection conn = getConnection();
		
		ArrayList<CampMonthSales> cmList = new SalesDao().selectMonthList(conn,startDate,endDate);
		
		close(conn);
		
		return cmList;
	}

	public ArrayList<CampYearSales> selectYearList(String startDate, String endDate) {
		Connection conn = getConnection();
		
		ArrayList<CampYearSales> cyList = new SalesDao().selectYearList(conn,startDate,endDate);
		
		close(conn);
		
		return cyList;
	}

	public ArrayList<CampDaySales> selectDayList(String startDate, String endDate) {
		Connection conn = getConnection();
		
		ArrayList<CampDaySales> cdList = new SalesDao().selectDayList(conn,startDate,endDate);
		
		close(conn);
		
		return cdList;
	}

	public ArrayList<SiteYearSales> selectSiteYearSales(String year) {
		Connection conn = getConnection();
		
		ArrayList<SiteYearSales> sysList = new SalesDao().selectSiteYearSales(conn,year);
				
		close(conn);		
		
		return sysList;
	}

	public ArrayList<SiteMonthSales> selectSiteMonthSales(String year) {
		
		Connection conn = getConnection();
		
		ArrayList<SiteMonthSales> smsList = new SalesDao().selectSiteMonthSales(conn,year);
				
		close(conn);		
		
		return smsList;
	}

	public ArrayList<SiteDaySales> selectSiteDaySales(String year) {
		
		Connection conn = getConnection();
		
		ArrayList<SiteDaySales> sdsList = new SalesDao().selectSiteDaySales(conn,year);
				
		close(conn);		
		
		return sdsList;
	}

	public ArrayList<TopCampSales> selectTopCampSales(String year) {
		
		Connection conn = getConnection();
		
		ArrayList<TopCampSales> tcsList = new SalesDao().selectTopCampSales(conn,year);
		
		close(conn);	
		
		return tcsList;
	}

	public ArrayList<TopMemberSales> selectTopMemberSales(String year) {
		
		Connection conn = getConnection();
		
		ArrayList<TopMemberSales> tmsList = new SalesDao().selectTopMemberSales(conn,year);
		
		close(conn);
		
		return tmsList;
	}

}
