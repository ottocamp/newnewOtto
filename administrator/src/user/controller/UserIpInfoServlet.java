package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.IpInfo;
import user.model.vo.User;

/**
 * Servlet implementation class UserIpInfo
 */
@WebServlet("/ipinfo.user")
public class UserIpInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIpInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			User loginUser =  (User)request.getSession().getAttribute("loginUser");
	
			int uno = loginUser.getUserNo();
			
			ArrayList<IpInfo> ipinfo = new UserService().selectIpInfo(uno);
			
			
			String flag = new UserService().selectFlag(uno);
	
			response.setContentType("text/html; charset=utf-8");
			
			request.setAttribute("ipinfo", ipinfo);
			request.setAttribute("flag", flag);
			request.getRequestDispatcher("views/user/userLoginInfo.jsp").forward(request, response);
			//

			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
