package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

/**
 * Servlet implementation class UserReservationChangeServlet
 */
@WebServlet("/resChange.user")
public class UserReservationChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reNo = Integer.parseInt(request.getParameter("reNo")); 
		int reStatus = Integer.parseInt(request.getParameter("reStatus")); 	
		
		int result = new UserService().reservationChange(reNo,reStatus);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "업데이트 성공");
			response.sendRedirect("reservation.user");
			
		}else {
			request.getSession().setAttribute("msg", "업데이트 실패");
			response.sendRedirect("reservation.user");
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
