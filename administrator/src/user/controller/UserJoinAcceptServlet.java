package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

/**
 * Servlet implementation class UserJoinAcceptServlet
 */
@WebServlet("/UJAS")
public class UserJoinAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserJoinAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String uid = request.getParameter("uid");
		String rcode = request.getParameter("rcode");
		
		//알코드를 지우고 성공이면 회원 상태를 Y로 바꿔줌
		int result = new UserService().deleteRcode(uid,rcode);
		
		if(result>0) {
			
			int result2 = new UserService().acceptUser(uid);
			
			if(result2>0) {
				
				request.setAttribute("msg", "회원가입 절차가 완료 되었습니다");
				request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
				
			}else {
				
				request.setAttribute("msg", "가입 코드 등록 실패(2)");
				request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
				
			}
			
		
		}else {
			
			request.setAttribute("msg", "가입 코드 등록 실패");
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
