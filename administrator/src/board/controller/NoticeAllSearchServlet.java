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
import board.model.vo.Board;
import board.model.vo.Comment;
import board.model.vo.PageInfo;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeAllSearchServlet
 */
@WebServlet("/allSearch.no")
public class NoticeAllSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAllSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyWord = (String)request.getParameter("keyWord");
		
		int listCount = new BoardService().getSearchNoticeCount(keyWord);
		int currentPage;
		int startPage;
		int endPage;
		int maxPage;
		int pageLimit;
		int boardLimit;
		
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
		ArrayList<Board> blist = new BoardService().getSearchearchNotice(keyWord, currentPage, boardLimit);
		HashMap cCount = new BoardService().getcCount(blist);
		
		request.setAttribute("pi", pi);
		request.setAttribute("blist", blist);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("cCount", cCount);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/noticeAllListView.jsp");
		
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