package grade.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.model.service.GradeService;
import grade.model.vo.UserGrade;

/**
 * Servlet implementation class GradeUpdateServlet
 */
@WebServlet("/grade.up")
public class GradeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNoGrade = request.getParameter("userNo");
		int userNo = Integer.parseInt(userNoGrade.split(",")[0]);
		String grade = userNoGrade.split(",")[1];
		
		System.out.println(userNo);
		System.out.println(grade);
		
		
		int result = new GradeService().updateGrade(userNo, grade);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
		}
		
		
		/*if(result >0) {
			ArrayList<UserGrade> uList = new GradeService().SelectUserGrade();
			
			request.setAttribute("uList", uList);
			request.getSession().setAttribute("msg", "성공적으로 회원등급을 변경하였습니다");
			
			request.getRequestDispatcher("views/grade/gradeListView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "회원등급 업데이트에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
