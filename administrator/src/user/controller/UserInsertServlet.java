package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.RandomCode;
import user.model.vo.User;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/insert.user")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		
		
		User user = new User();
		
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String uemail = request.getParameter("uemail");
		String uphone = request.getParameter("uphone");
		String upwd = request.getParameter("upwd");
		String utype = request.getParameter("utype");
		
		user.setUserId(uid);
		user.setUserName(uname);
		user.setEmail(uemail);
		user.setPhone(uphone);
		user.setUserPwd(upwd);
		user.setUserType(utype);
		int result = new UserService().userInsert(user); 
		response.setContentType("text/html; charset=utf-8");
		
		if(result>0) {
			
			//가입 성공시 상태를 R(ready로 하고)
			//JOINCODE 테이블에 랜덤코드를 넣자		
			String rcode = new RandomCode().RandomCode(10);
			new UserService().insertJoincode(uid,rcode);
			
			//uid로 uno을 얻어와 신규가입 쿠폰을 넣어주자(신규 가입 쿠폰 코드FE18GDFE)
			int uno = new UserService().selectUserNo(uid);
			new UserService().insertCoupon(uno,"FE18GDFE");
			
			
			//이메일 발송을 하는 JSP(jsp로 가면 자동으로 메일 발송)
			//uid , uemail, rcode를 보냄
			request.setAttribute("uid", uid);
			request.setAttribute("uemail", uemail);
			request.setAttribute("rcode", rcode);
			request.getRequestDispatcher("views/joinmail/mailSend.jsp").forward(request, response);
			
			

		}else {
			request.setAttribute("msg", "가입실패");
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
