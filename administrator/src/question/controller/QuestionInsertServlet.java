package question.controller;

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
 * Servlet implementation class QuestionInsertServlet
 */
@WebServlet("/insert.qe")
public class QuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User u = (User)request.getSession().getAttribute("loginUser");
		int userNo = 9999;
		if(u != null) {
			userNo = u.getUserNo();
		}
		
		String camNo = (String)request.getParameter("boardTag");
		String title = (String)request.getParameter("bTitle");
		String content = (String)request.getParameter("content");
		String writer = (String)request.getParameter("memName");
		String pwd = (String)request.getParameter("memPwd");		
		int result = 0;
		
		
		Question q = new Question();
		
		if(writer != null) {
			
			int checkIdPwd = new QuestionService().checkIdPwd(writer);
			if(checkIdPwd > 0) {
				request.getSession().setAttribute("msg", "사용할 수 없는 임시ID입니다");
				
				System.out.println(checkIdPwd);

				response.sendRedirect(request.getContextPath() + "/getName.ca");
			}else {
				
				q.setqTitle(title);
				q.setqContent(content);
				q.setqWriter(writer);
				q.setPwd(pwd);
				q.setUserNo(userNo);
				q.setaWriter(camNo);
				
				result = new QuestionService().insertQuestion(q);

				
				if(result > 0) {
					request.getSession().setAttribute("msg", "문의가 작성되었습니다");
				}else {
					request.getSession().setAttribute("msg", "문의 작성에 실패하였습니다");
				}

				
				
				if(userNo != 9999) {
					response.sendRedirect(request.getContextPath() + "/myList.qe");
				}else {
					response.sendRedirect(request.getContextPath() + "/freqList.qe");
				}
			}
			
			
		}else {

			q.setqTitle(title);
			q.setqContent(content);
			q.setqWriter(writer);
			q.setPwd(pwd);
			q.setUserNo(userNo);
			q.setaWriter(camNo);
			
			result = new QuestionService().insertQuestion(q);

			
			if(result > 0) {
				request.getSession().setAttribute("msg", "문의가 작성되었습니다");
			}else {
				request.getSession().setAttribute("msg", "문의 작성에 실패하였습니다");
			}

			
			
			if(userNo != 9999) {
				response.sendRedirect(request.getContextPath() + "/myList.qe");
			}else {
				response.sendRedirect(request.getContextPath() + "/freqList.qe");
			}
			
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
