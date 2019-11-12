package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import user.model.vo.User;

/**
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/delete.co")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User u = (User)request.getSession().getAttribute("loginUser");
				
		int cNo = Integer.parseInt(request.getParameter("c_no"));
		int bNo = 0;
		
		if(request.getParameter("bNo") != null) {
			bNo = Integer.parseInt(request.getParameter("bNo"));
		}
		
		
		int result = new BoardService().deleteComment(cNo);
		
		System.out.println(cNo);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "댓글이 삭제되었습니다");
		}else {
			request.getSession().setAttribute("msg", "댓글 삭제에 실패하였습니다");
		}
		
		if(bNo != 0) {	
			response.sendRedirect(request.getContextPath() + "/detail.bo?b_no=" + bNo);		
		}else {
			if(u.getUserType().equals("A")) {
				response.sendRedirect(request.getContextPath() + "/allList.co");
			}else {
				response.sendRedirect(request.getContextPath() + "/myList.co");						
			}
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
