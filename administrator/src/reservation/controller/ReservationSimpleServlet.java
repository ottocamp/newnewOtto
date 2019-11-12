package reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationSimpleService;
import reservation.model.vo.ReservationSimple;

/**
 * Servlet implementation class ReservationSimpleServlet
 */
@WebServlet("/reSim.rs")
public class ReservationSimpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSimpleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("re_name");
		String pw = request.getParameter("re_pw");
		String phone =request.getParameter("re_phone");
		
		ArrayList<ReservationSimple> rsList = new ReservationSimpleService().searchList(name, pw, phone);
		
		 System.out.println("name : " + name);
	     System.out.println("pw : " + pw);
	     System.out.println("phone : " + phone);
	     
	     
	 	request.setAttribute("rsList", rsList);

	
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
