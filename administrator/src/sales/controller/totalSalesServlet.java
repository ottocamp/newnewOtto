package sales.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sales.model.sevice.SalesService;
import sales.model.vo.CampSales;
import sales.model.vo.SiteDaySales;
import sales.model.vo.SiteMonthSales;
import sales.model.vo.SiteYearSales;
import sales.model.vo.TopCampSales;
import sales.model.vo.TopMemberSales;

/**
 * Servlet implementation class totalSalesServlet
 */
@WebServlet("/total.sa")
public class totalSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public totalSalesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String year = request.getParameter("year");
		
		ArrayList<SiteYearSales> sysList = new SalesService().selectSiteYearSales(year);
		ArrayList<SiteMonthSales> smsList = new SalesService().selectSiteMonthSales(year);
		ArrayList<SiteDaySales> sdsList = new SalesService().selectSiteDaySales(year);
		ArrayList<CampSales> csList = new SalesService().selectList(year + "-01-01", year + "-12-31");
		ArrayList<TopCampSales> tcsList = new SalesService().selectTopCampSales(year);
		ArrayList<TopMemberSales> tmsList = new SalesService().selectTopMemberSales(year);
		
		request.setAttribute("sysList", sysList);
		request.setAttribute("smsList", smsList);
		request.setAttribute("sdsList", sdsList);
		request.setAttribute("csList", csList);
		request.setAttribute("tcsList", tcsList);
		request.setAttribute("tmsList", tmsList);
		
		request.getRequestDispatcher("views/sales/saleTotalDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
