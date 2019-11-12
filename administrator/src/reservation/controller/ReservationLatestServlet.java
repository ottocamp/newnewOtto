package reservation.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationCount;

/**
 * Servlet implementation class ReservationLatestServlet
 */
@WebServlet("/latestList.li")
public class ReservationLatestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationLatestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		ArrayList<Reservation> sList = new ReservationService().SelectLatestList();
		ArrayList<ReservationCount> cList = new ReservationService().SelectLatestCount(); 
			
		String nArr = "1,2,3,4";
		
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.DATE, -30);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDay = sdf.format(cal.getTime());
		String endDay = sdf.format(today);
		
		request.setAttribute("sList", sList);
		request.setAttribute("cList", cList);
		request.setAttribute("startDay", startDay);
		request.setAttribute("endDay", endDay);
		request.setAttribute("rMin", "1");
		request.setAttribute("rMax", "10000000");
		request.setAttribute("nArr", nArr);
		
	
		request.getRequestDispatcher("views/reservation/reservationSearchResult.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
