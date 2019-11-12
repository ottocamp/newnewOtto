package question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class QuestionPwdCheckServelt
 */
@WebServlet("/checkPwd.qe")
public class QuestionPwdCheckServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionPwdCheckServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dd");
		request.setCharacterEncoding("UTF-8");
		String memId = (String)request.getParameter("memId");
		System.out.println(memId);
		String memPwd = (String)request.getParameter("memPwd");
		System.out.println(memPwd);
		
		Question q = new QuestionService().getNoMemQuestion(memId, memPwd);
		
		
		response.setCharacterEncoding("utf-8");
		if(q != null) {
			request.setAttribute("q", q);			
			request.getRequestDispatcher("/views/question/questionNoMemListView.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "입력된 정보가 올바르지 않습니다");
			request.getRequestDispatcher("/views/question/questionPwdCheckForm.jsp").forward(request, response);
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
