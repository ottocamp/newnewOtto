package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/insert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String title = (String)request.getParameter("bTitle");
		String content = (String)request.getParameter("content");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
	
		
		Board b = new Board();
		b.setbTitle(title);
		b.setbContent(content);
		b.setUserNo(userNo);
		
		int result = new BoardService().insertNotice(b);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "공지가 작성되었습니다");
		}else {
			request.getSession().setAttribute("msg", "공지 작성에 실패하였습니다");
		}
		

		response.sendRedirect(request.getContextPath() + "/list.bo?b_tag=0");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
