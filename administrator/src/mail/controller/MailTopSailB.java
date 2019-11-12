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
import sales.model.vo.TopCampSales;
import sales.model.vo.TopMemberSales;
import user.model.vo.User;

/**
 * Servlet implementation class MailTopSailB
 */
@WebServlet("/SaleTopBMail.li")
public class MailTopSailB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailTopSailB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<TopCampSales> tcsList = (ArrayList<TopCampSales>)request.getSession().getAttribute("tcsList");
		
		String index = request.getParameter("count");
		
		int Count = Integer.parseInt(index.split(",")[0]);
		String year = index.split(",")[1];
		
		ArrayList<TopCampSales> yeartcsList = new ArrayList<TopCampSales>();
		
		for(TopCampSales t : tcsList) {
			
			if(t.getsYear().equals(year)) {
					
				yeartcsList.add(t);
				
			}
			
		}
		
		int[] UserArr = new int[Count];
		
		for(int i = 0; i < Count; i++) {

			UserArr[i] = yeartcsList.get(i).getsCampCode();

		}
		
		ArrayList<User> UserList = new MailService().selectTopSaleCampList(UserArr);
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
