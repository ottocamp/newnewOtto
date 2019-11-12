package mail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.model.service.CouponService;
import coupon.model.vo.Coupon;
import mail.model.service.MailService;
import user.model.vo.User;

/**
 * Servlet implementation class MailListServlet
 */
@WebServlet("/MailList.li")
public class MailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] uType = request.getParameterValues("uType");
		String[] uGrade = request.getParameterValues("GRADE");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		
		String[] sqlType = new String[] {"F","F"};
		String[] sqlGrade = new String[]{"F","F","F","F","F"};
		
		for(int i = 0; i < uType.length; i++) {
			
			sqlType[i] = uType[i];
		}
		
		for(int i = 0; i < uGrade.length; i++) {
			
			sqlGrade[i] = uGrade[i];
		}
		
		ArrayList<User> UserList = new MailService().selectMailList(sqlType,sqlGrade,startDay,endDay);
		ArrayList<Coupon> cList = new CouponService().selectAbleList();
		
		
		request.setAttribute("UserList", UserList);
		request.setAttribute("cList", cList);
		
		request.getRequestDispatcher("views/mail/MailSendFormView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
