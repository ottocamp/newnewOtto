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
import sales.model.vo.TopMemberSales;
import user.model.vo.User;

/**
 * Servlet implementation class MailTopSailUser
 */
@WebServlet("/SaleTopMail.li")
public class MailTopSailUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailTopSailUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<TopMemberSales> tmsList = (ArrayList<TopMemberSales>)request.getSession().getAttribute("tmsList");
		
		String index = request.getParameter("count");
		
		int Count = Integer.parseInt(index.split(",")[0]);
		String year = index.split(",")[1];
		
		ArrayList<TopMemberSales> yeartmsList = new ArrayList<TopMemberSales>();
		
		for(TopMemberSales t : tmsList) {
			
			if(t.getsYear().equals(year)) {
					
				yeartmsList.add(t);
				
			}
			
		}
		
		int[] UserArr = new int[Count];
		
		for(int i = 0; i < Count; i++) {

			UserArr[i] = yeartmsList.get(i).getsUserNo();

		}
		
		ArrayList<User> UserList = new MailService().selectTopSaleUserList(UserArr);
		ArrayList<Coupon> cList = new CouponService().selectAbleList();
		
		request.getSession().removeAttribute("tmsList");
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
