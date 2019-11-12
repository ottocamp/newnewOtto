package coupon.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.model.service.CouponService;

/**
 * Servlet implementation class CouponUpdateServlet
 */
@WebServlet("/updateCoupon.uc")
public class CouponUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		String cCode = request.getParameter("cCode");
		String cName = request.getParameter("cName");
		int cDiscount = Integer.parseInt(request.getParameter("cDiscount"));
		String Grade = request.getParameter("GRADE");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		
		int result = new CouponService().updateCounpon(cCode,cName, cDiscount, Grade, startDay, endDay);
		
		if(result > 0) {
			
			request.getSession().setAttribute("msg", "쿠폰변경에 성공하였습니다.");
			response.sendRedirect("couponList.li");		
		}else {
			request.setAttribute("msg", "쿠폰변경에 실패하였습니다");
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
