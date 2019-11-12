package question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.*;

/**
 * Servlet implementation class QuestionFrequentListServlet
 */
@WebServlet("/freqList.qe")
public class QuestionFrequentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionFrequentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int qTag = 999;
		if(request.getParameter("q_tag") != null) {
			qTag = Integer.parseInt(request.getParameter("q_tag"));
		}
		
		int qesCount = new QuestionService().getFreqQesCount(qTag);
		int currentPage;
		int pageLimit;
		int qesLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage= 1;
		// 게시판 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		pageLimit = 5;
		qesLimit = 8;
		maxPage = (int)Math.ceil((double)qesCount / qesLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, qesCount, pageLimit, maxPage, startPage, endPage, qesLimit);		
		ArrayList<Question> qlist = new QuestionService().gerFreqQesList(qTag, currentPage, qesLimit);
		
		request.setAttribute("pi", pi);
		request.setAttribute("qlist", qlist);
		request.setAttribute("q_tag", qTag);

		request.getRequestDispatcher("/views/question/preqQesListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
