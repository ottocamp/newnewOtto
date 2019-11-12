package grade.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.model.service.GradeService;
import grade.model.vo.UserGrade;

/**
 * Servlet implementation class GradeSearchServlet
 */
@WebServlet("/gradeSearch.li")
public class GradeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] gArr = request.getParameterValues("grade");
		
		String[] indexArr = new String[] {"F","F","F","F"};
		
		for(int i = 0; i < gArr.length; i++) {
			
			indexArr[i] = gArr[i];
		}
		
		
		ArrayList<UserGrade> uList = new GradeService().SelectSearchGrade(indexArr);
		
		request.setAttribute("uList", uList);
		
		request.getRequestDispatcher("views/grade/gradeListView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
