package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.Question;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeFreqInsertServlet
 */
@WebServlet("/freqInsert.no")
public class NoticeFreqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFreqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User u = (User)request.getSession().getAttribute("loginUser");
		
		
		int tag = Integer.parseInt(request.getParameter("boardTag"));	
		String title = (String)request.getParameter("bTitle");	
		String content = (String)request.getParameter("content");
		int writer = u.getUserNo();

		Question q = new Question();
		q.setqTag(tag);
		q.setqTitle(title);
		q.setqContent(content);
		q.setUserNo(writer);
		
		int result = new QuestionService().insertFreq(q);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "Q&A가 등록되었습니다");
		}else {
			request.getSession().setAttribute("msg", "Q&A가 등록에 실패하였습니다");
		}
		

		response.sendRedirect(request.getContextPath() + "/allNotice.bo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
