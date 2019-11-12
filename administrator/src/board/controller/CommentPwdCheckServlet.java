package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class CommentPwdCheckServlet
 */
@WebServlet("/pwdCheck.co")
public class CommentPwdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentPwdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dd");
		int cNo = Integer.parseInt(request.getParameter("c_no"));
		System.out.println(cNo);
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		System.out.println(bNo);

		String pwd = (String)request.getParameter("pwd");		
		System.out.println(pwd);

		
		String checkPwd = new BoardService().checkCommentPwd(cNo);
		
		if(pwd.equals(checkPwd)) {
			request.setAttribute("cNo", cNo);
			request.setAttribute("bNo", bNo);
			request.getRequestDispatcher("/delete.co").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "잘못된 비밀번호입니다");
			response.sendRedirect(request.getContextPath() + "/detail.bo?b_no=" + bNo);
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
