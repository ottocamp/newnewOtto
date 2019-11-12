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
 * Servlet implementation class AnswerSearchServlet
 */
@WebServlet("/search.an")
public class AnswerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String keyWord = (String)request.getParameter("keyWord");
		User u = (User)request.getSession().getAttribute("loginUser");
		int userNo = u.getUserNo();
		
		System.out.println(keyWord);
		
		int listCount = 0;
		int currentPage;
		int boardLimit;
		int pageLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		if(u.getUserType().equals("A")) {
			listCount = new QuestionService().searchAdminListCount(keyWord);
		}else {
			listCount = new QuestionService().searchListCount(u.getUserNo(), keyWord);
		}
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		boardLimit = 8;
		pageLimit = 5;
		// (전체 게시글 / 한페이지에 보여질 개수)의 결과를 올림 처리
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Question> qlist = null;
		if(u.getUserType().equals("A")) {
			qlist = new QuestionService().searchAdminList(keyWord, currentPage, boardLimit);
			
			for(Question q : qlist) {
				String qesWriter = new QuestionService().getQesWriter(q.getqNo());
				q.setqWriter(qesWriter);
			}
		}else {
			qlist = new QuestionService().searchAnswerList(u.getUserNo(), keyWord, currentPage, boardLimit);
			
			for(Question q : qlist) {
				String qesWriter = new QuestionService().getQesWriter(q.getqNo());
				q.setqWriter(qesWriter);
			}
		}

		System.out.println(pi);
		System.out.println(qlist);
		
		request.setAttribute("pi", pi);
		request.setAttribute("qlist", qlist);
		request.setAttribute("keyWord", keyWord);
		
		request.getRequestDispatcher("/views/question/answerListView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
