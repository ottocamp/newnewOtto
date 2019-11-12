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
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/updatepwd.user")
public class UserPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");	
		int uno = loginUser.getUserNo();
	
		String pwd = request.getParameter("pwd");
		
		
		int result = new UserService().updateUserPwd(uno,pwd);
		
		if(result>0) {
			request.setAttribute("msg", "비밀번호를 성공적으로 수정하였습니다.");
			request.getRequestDispatcher("views/user/pwdupdate.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "비밀번호변경 실패");
			request.getRequestDispatcher("views/user/pwdupdate.jsp").forward(request, response);
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
