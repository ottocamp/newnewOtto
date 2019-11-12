package reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationSimpleService;
import reservation.model.vo.ReservationInsert;

/**
 * Servlet implementation class ReservationInsertForm
 */
@WebServlet("/ReInFo.rif")
public class ReservationInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String cName = request.getParameter("campname");
		String rName = request.getParameter("name");
		String rPwd = request.getParameter("password");
		String rPhone = request.getParameter("phone");
		String rCar = request.getParameter("licenceNumber");
		String rMessage = request.getParameter("message");
		
		ReservationInsert ri = new ReservationInsert();
		
		ri.setcName(cName);
		ri.setrName(rName);
		ri.setrPwd(rPwd);
		ri.setrPhone(rPhone);
		ri.setrCar(rCar);
		ri.setrMessage(rMessage);
		
		
		int result = new ReservationSimpleService().InsertReservation(ri);
		
		if(result > 0) {
			
			response.sendRedirect("views/reservation/reservationCompleteView.jsp");
		} else {
			request.setAttribute("msg", "널값이떴대");
	    	request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
