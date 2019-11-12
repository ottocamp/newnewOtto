package camp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.model.service.CampRefoService;
import camp.model.service.CampService;
import camp.model.vo.Attachment;
import camp.model.vo.CampRefoEnter;

/**
 * Servlet implementation class CampReservationServlet
 */
@WebServlet("/campRe.re")
public class CampReservationEnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampReservationEnterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		System.out.println(cNo);
		
		System.out.println("0");
		ArrayList<CampRefoEnter> eList = new CampRefoService().selectCampList(cNo);

		
		ArrayList<Attachment> aList = new CampService().selectMainAttachmentList();
		
		System.out.println(eList);

		System.out.println(aList);
			
		request.setAttribute("eList", eList);
		request.setAttribute("aList", aList);
		
		request.getRequestDispatcher("views/reservation/reservationFormView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
