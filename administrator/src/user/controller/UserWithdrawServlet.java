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
 * Servlet implementation class UserWithdrawServlet
 */
@WebServlet("/withdraw.user")
public class UserWithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserWithdrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		int result = new UserService().userWithdraw(uno);
		
		if(result>0) {
			request.getSession().invalidate();
			request.setAttribute("msg", "회원 탈퇴 완료");
			request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "회원 탈퇴 실패");
			request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
			
			
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
