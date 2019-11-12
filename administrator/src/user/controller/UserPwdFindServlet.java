package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.RandomCode;

/**
 * Servlet implementation class UserPwdFindServlet
 */
@WebServlet("/pwdfind.user")
public class UserPwdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPwdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		
		String uid = request.getParameter("userId").toLowerCase();
		String uemail = request.getParameter("userEmail").toLowerCase();
		
		int result = new UserService().pwdFindUser(uid,uemail);
		
		if(result>0) {
			
			//메일발송
			String rcode = new RandomCode().RandomCode(5);
			new UserService().insertJoincode(uid,rcode);
			request.setAttribute("uid", uid);
			request.setAttribute("uemail", uemail);
			request.setAttribute("rcode", rcode);
			request.getRequestDispatcher("views/pwdemail/mailSend.jsp").forward(request, response);
				
		
		}else {
			request.setAttribute("msg", "일치하는 유저가 없습니다");
			request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
			
		}
		
		
		
		
		
		response.setContentType("text/html; charset=utf-8");
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
