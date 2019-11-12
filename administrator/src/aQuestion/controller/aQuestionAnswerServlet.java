package aQuestion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aQuestion.model.service.aQuestionService;

/**
 * Servlet implementation class aQuestionAnswerServlet
 */
@WebServlet("/answer.qa")
public class aQuestionAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aQuestionAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String qCode_index = request.getParameter("qCode");
		
		String[] index = qCode_index.split(",");
		
		String qCode = index[0];
		String comment = index[1];
		
		int result = new aQuestionService().answerQuestion(qCode, comment);
		
		if(result > 0) {
			
			request.getSession().setAttribute("msg", "문의 답변에 성공하였습니다.");
			response.sendRedirect("Question.li");
		}else {
			request.setAttribute("msg", "문의 답변에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
