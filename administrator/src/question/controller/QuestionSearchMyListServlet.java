package question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.PageInfo;
import question.model.vo.Question;
import user.model.vo.User;

/**
 * Servlet implementation class QuestionSearchMyListServlet
 */
@WebServlet("/search.qe")
public class QuestionSearchMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSearchMyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		User u = (User)request.getSession().getAttribute("loginUser");
		int userNo = u.getUserNo();
		String keyWord = (String)request.getParameter("keyWord");
		
		
		int qesCount = new QuestionService().searchMyQesCount(userNo, keyWord);
		int currentPage;
		int pageLimit;
		int qesLimit;
		int startPage;
		int endPage;
		int maxPage;
		
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		pageLimit = 5;
		qesLimit = 8;
		maxPage = (int)Math.ceil((double)qesCount / qesLimit);
		startPage = (currentPage - 1) / pageLimit  * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		
		PageInfo pi = new PageInfo(currentPage, qesCount, pageLimit, maxPage, startPage, endPage, qesLimit);		
		ArrayList<Question> qlist = new QuestionService().searchMyQuestion(userNo, keyWord, currentPage, qesLimit);
		
		request.setAttribute("pi", pi);
		request.setAttribute("qlist", qlist);
		request.setAttribute("keyWord", keyWord);
		
		request.getRequestDispatcher("views/question/questionListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
