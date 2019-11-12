package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardRegionListServlet
 */
@WebServlet("/regionList.bo")
public class BoardRegionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardRegionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bRegion = Integer.parseInt(request.getParameter("b_region"));
		
		
		int listCount = new BoardService().getRegionListCount(bRegion);
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		boardLimit = 12;
		pageLimit = 5;
		
		maxPage = (int)(listCount / boardLimit) + 1;
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = (startPage - 1) + pageLimit;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Board> blist = new BoardService().selectRegionList(bRegion, currentPage, boardLimit);
		
		request.setAttribute("blist", blist);
		request.setAttribute("pi", pi);
		request.setAttribute("bTag", 1);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardListView.jsp");
		
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
