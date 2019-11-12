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
import grade.model.vo.UserGradeIndex;

/**
 * Servlet implementation class GradeListUpdateServlet
 */
@WebServlet("/GradeListUpdate.li")
public class GradeListUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeListUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<UserGradeIndex> uiList = (ArrayList<UserGradeIndex>) request.getSession().getAttribute("uiList");
		
		for(UserGradeIndex ui : uiList){
			
			switch(ui.getGafterGrade()){
			
			case "MVP" : ui.setGafterGrade("A"); break;
			case "VIP" : ui.setGafterGrade("B"); break;
			case "FAMILY" : ui.setGafterGrade("C"); break;
			case "WELCOME" : ui.setGafterGrade("D"); break;
			
			}
		
		}
		
		System.out.println("여기로왔다");
		
		int result = new GradeService().updateListGrade(uiList);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "등급변경에 성공하였습니다.");
			response.sendRedirect("userGrade.li");
		}else {
			request.setAttribute("msg", "회원등급 업데이트에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		

		/*PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
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
