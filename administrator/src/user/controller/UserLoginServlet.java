package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.user")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String ip = request.getParameter("ip");
		String country = request.getParameter("country");
		String ccode = request.getParameter("ccode");
		

		User loginUser = new UserService().loginUser(userId, userPwd);


		response.setContentType("text/html; charset=utf-8");
		

		if(loginUser != null) {
			
			
				int uno = loginUser.getUserNo();
				
				if(loginUser.getStatus().equalsIgnoreCase("R")) {
					PrintWriter out = response.getWriter();
					out.print("ready");		
					return;
				}
				
				if(loginUser.getStatus().equalsIgnoreCase("N")) {
					PrintWriter out = response.getWriter();
					out.print("withdraw");		
					return;
				}
				
				
				
				


				if(loginUser.getForignYN().equalsIgnoreCase("n") && !ccode.equals("KR")) {
					
					int result = new UserService().ipInfo(uno,ip,country,"해외 로그인 차단");
					PrintWriter out = response.getWriter();
					out.print("block");

				}else {
					
	
				String flag = new UserService().selectFlag(uno);
				
				
				
				int result = new UserService().ipInfo(uno,ip,country,"성공");
				

				HttpSession session = request.getSession();
				
				
				session.setAttribute("loginUser", loginUser);
				PrintWriter out = response.getWriter();

				out.print("success");
				
				}


			
		}else { 
			
			
			User searchUser = new UserService().searchUser(userId);
			
			if(searchUser != null) {
				//해당 아이디가 있으므로 비번이 틀린 경우 
				int result = new UserService().ipInfo(searchUser.getUserNo(),ip,country,"비밀번호 불일치");	
				PrintWriter out = response.getWriter();
				out.print("pwdError");
			}else {
				PrintWriter out = response.getWriter();
				out.print("noUser");
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
