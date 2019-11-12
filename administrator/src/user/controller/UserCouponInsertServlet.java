package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserCouponInsertServlet
 */
@WebServlet("/insertCoupon.user")
public class UserCouponInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCouponInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		String inCode = request.getParameter("inCode");
		
		int result = new UserService().insertCoupon(uno,inCode);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "쿠폰 추가에 성공 하였습니다");
			request.getRequestDispatcher("coupon.user").forward(request, response);
			
		}else {
			request.getSession().setAttribute("msg", "쿠폰 추가에 실패 하였습니다");
			request.getRequestDispatcher("coupon.user").forward(request, response);
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
