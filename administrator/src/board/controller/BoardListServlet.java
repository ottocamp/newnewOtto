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
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bTag = Integer.parseInt(request.getParameter("b_tag"));
		BoardService boardService = new BoardService();
		
		// 태그가 공지사항(0)인 게시글의 총 수 
		int listCount = boardService.getListCount(bTag);
		
		int currentPage; // 현재 페이지
		int pageLimit; // 페이징에 보여질 최대 수
		int maxPage; // 가장 마지막 페이지의 수
		int startPage; // 페이징의 시작 수
		int endPage; // 페이징의 마지막 수
		
		int boardLimit = 12; // 한 페이지의 최대 게시글 수
		
		
		currentPage= 1;
		// 게시판 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		pageLimit = 5;
		// (전체 게시글 / 한페이지에 보여질 개수)의 결과를 올림 처리
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		ArrayList<Board> blist = boardService.selectList(bTag, currentPage, boardLimit);

		request.setAttribute("pi", pi);
		request.setAttribute("bTag", bTag);
		request.setAttribute("blist", blist);	
		
		
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
