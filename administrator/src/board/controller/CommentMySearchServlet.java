package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Comment;
import board.model.vo.PageInfo;
import user.model.vo.User;

/**
 * Servlet implementation class CommentMySearchServlet
 */
@WebServlet("/mySearch.co")
public class CommentMySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentMySearchServlet() {
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
		
		int listCount;
		int currentPage;
		int boardLimit;
		int pageLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new BoardService().searchMyCommentCount(userNo, keyWord);

		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));			
		}
		
		pageLimit = 5;
		boardLimit = 8;

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		ArrayList<Comment> clist = new BoardService().searchMyComment(userNo, keyWord, currentPage, boardLimit);
		HashMap bTitle = new BoardService().getbTitle(clist);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("clist", clist);
		request.setAttribute("bTitle", bTitle);
		request.setAttribute("keyWord", keyWord);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/commentMyListView.jsp");
		
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
