package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationCount;

/**
 * Servlet implementation class ReservationNewSearchSerlvet
 */
@WebServlet("/newReservation.li")
public class ReservationNewSearchSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationNewSearchSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String arr[] = request.getParameterValues("progress");
		
		int[] reArr = new int[]{0,0,0,0};
		
		for(int i = 0; i < arr.length; i++) {
			
			reArr[i] = Integer.parseInt(arr[i]);
					
		}
			
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		
		long rMin = Long.parseLong(request.getParameter("rMin"));   
		long rMax = Long.parseLong(request.getParameter("rMax")); 
		
		ArrayList<Reservation> sList = new ReservationService().SelectSearchList(reArr, startDay, endDay, rMin, rMax);
		ArrayList<ReservationCount> cList = new ReservationService().SelectSearchCount(reArr, startDay, endDay, rMin, rMax); 
			
		String nArr = String.join(",", arr);
		
		
		request.setAttribute("sList", sList);
		request.setAttribute("cList", cList);
		request.setAttribute("startDay", startDay);
		request.setAttribute("endDay", endDay);
		request.setAttribute("rMin", rMin + "");
		request.setAttribute("rMax", rMax + "");
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
