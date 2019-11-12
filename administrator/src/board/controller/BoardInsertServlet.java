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
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int tag = Integer.parseInt(request.getParameter("boardTag"));	
		
		String title = (String)request.getParameter("bTitle");		

		int region = 0;
		if(tag == 1) {
			region = Integer.parseInt(request.getParameter("regionTag"));
			
		}
		
		String content = (String)request.getParameter("content");
		String writer = (String)request.getParameter("memName");
		String pwd = (String)request.getParameter("memPwd");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
	

		
		Board b = new Board();
		b.setbTag(tag);
		b.setbRegion(region);
		b.setbTitle(title);
		b.setbContent(content);
		b.setbWriter(writer);
		b.setPwd(pwd);
		b.setUserNo(userNo);
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글이 작성되었습니다");
		}else {
			request.getSession().setAttribute("msg", "게시글 작성에 실패하였습니다");
		}
		

		response.sendRedirect(request.getContextPath() + "/list.bo?b_tag=" + tag);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
