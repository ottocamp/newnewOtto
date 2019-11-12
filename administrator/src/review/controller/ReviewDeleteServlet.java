package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import user.model.service.UserService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/delete.review")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reNo3 = Integer.parseInt(request.getParameter("reNo3")); 
		
		int result = new ReviewService().deleteReview(reNo3);
		
		if(result>0) {
			
			int result2 = new UserService().reservationChange(reNo3,4);
			
			if(result2>0) {
				request.getSession().setAttribute("msg", "리뷰 삭제 성공");
				response.sendRedirect("selectreview.user");
			}else {
				request.getSession().setAttribute("msg", "리뷰 삭제 실패(2)");
				response.sendRedirect("selectreview.user");
			}
			
			

			
		}else {
			request.getSession().setAttribute("msg", "리뷰 삭제 실패");
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
