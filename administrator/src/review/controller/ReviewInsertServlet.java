package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.UserReview;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/insert.review")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		
		
		int reNo2 = Integer.parseInt(request.getParameter("reNo2")); 
		
		int uNo = loginUser.getUserNo();
		String uId = loginUser.getUserId();

		int cCode = Integer.parseInt(request.getParameter("cCode"));
		String cName = request.getParameter("cName");
		String reDate = request.getParameter("reDate");
		String rTitle = request.getParameter("rTitle");
		String rContent = request.getParameter("rContent");
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		
	
		
		UserReview insertReview = new UserReview();
		insertReview.setReNo(reNo2);
		insertReview.setuNo(uNo);
		insertReview.setuId(uId);
		insertReview.setcCode(cCode);
		insertReview.setcName(cName);
		insertReview.setReDate(reDate);
		insertReview.setrTitle(rTitle);
		insertReview.setrContent(rContent);
		insertReview.setrNum(rNum);
		
		int result = new ReviewService().insertReview(insertReview);
		
		if(result>0) {
			
			int result2 = new UserService().reservationChange(reNo2,5);
			
			if(result2>0) {
				request.getSession().setAttribute("msg", "리뷰 등록 성공");
				response.sendRedirect("selectreview.user");
			}else {
				request.getSession().setAttribute("msg", "리뷰 등록 실패(2)");
				response.sendRedirect("selectreview.user");
			}
			
			

			
		}else {
			request.getSession().setAttribute("msg", "리뷰 등록 실패");
			response.sendRedirect("selectreview.user");
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
