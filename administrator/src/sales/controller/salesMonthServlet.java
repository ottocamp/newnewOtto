package sales.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sales.model.sevice.SalesService;
import sales.model.vo.CampDaySales;
import sales.model.vo.CampMonthSales;
import sales.model.vo.CampSales;
import sales.model.vo.CampYearSales;

/**
 * Servlet implementation class salesMonthServlet
 */
@WebServlet("/salesMonth.sm")
public class salesMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public salesMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String day = (String)request.getParameter("day");
		
		String startDate = day.split(",")[0];
		String endDate = day.split(",")[1];
			
		ArrayList<CampSales> csList = new SalesService().selectList(startDate, endDate);
		ArrayList<CampMonthSales> cmList = new SalesService().selectMonthList(startDate, endDate);
		ArrayList<CampYearSales> cyList = new SalesService().selectYearList(startDate, endDate);
		ArrayList<CampDaySales> cdList = new SalesService().selectDayList(startDate, endDate);
		
		request.setAttribute("csList", csList);
		request.setAttribute("cmList", cmList);
		request.setAttribute("cyList", cyList);
		request.setAttribute("cdList", cdList);
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		request.getRequestDispatcher("views/sales/salesMonthView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
