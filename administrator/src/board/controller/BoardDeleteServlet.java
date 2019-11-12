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
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/delete.bo")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User u = (User)request.getSession().getAttribute("loginUser");
				
		int bTag = 9999;
		int bNo = Integer.parseInt(request.getParameter("b_no"));
		if(request.getParameter("bTag") != null) {
			bTag = Integer.parseInt(request.getParameter("bTag"));
		}
		
		
		int result = new BoardService().deleteList(bNo);
		
		
		if(result > 0) {
			int result2 = new BoardService().deleteComment2(bNo);
			request.getSession().setAttribute("msg", "게시글이 삭제되었습니다");
		}else {
			request.getSession().setAttribute("msg", "게시글 삭제에 실패하였습니다");
		}
		

		if(bTag != 9999) {
			response.sendRedirect(request.getContextPath() + "/list.bo?b_tag=" + bTag);			
		}else {
			if(u.getUserType().equals("A")) {
				response.sendRedirect(request.getContextPath() + "/allList.bo");
			}else {
				response.sendRedirect(request.getContextPath() + "/myList.bo");
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
