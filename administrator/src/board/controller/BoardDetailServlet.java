package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Comment;
import user.model.vo.User;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("b_no"));
		User u = (User)request.getSession().getAttribute("loginUser");
		Board b = null;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		
		if(u != null) {
			String checkName = u.getUserType() + u.getUserNo();
			String cookieName = bNo + checkName;
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					if(c.getName().equals(cookieName)) {
						flag = true;
					}
				}
					
				if(!flag) {
					b = new BoardService().detailList(bNo);				
					Cookie c1 = new Cookie(cookieName, cookieName);
					
					c1.setMaxAge(60*60*24*1);
					response.addCookie(c1);
				}else {
					b = new BoardService().detailListNoCount(bNo);
				}
				
			}
			
		}else {
			b = new BoardService().detailListNoCount(bNo);
		}
		
		
		
		ArrayList<Comment> cList = new BoardService().getCommentList(bNo);
		
		String path = "";		
		
		if(b != null) {
			int bTag = b.getbTag();
			String nextTitle = new BoardService().getNextTitle(bNo, bTag);
			String preTitle = new BoardService().getPreTitle(bNo, bTag);

			
			request.setAttribute("b", b);
			request.setAttribute("cList", cList);
			request.setAttribute("nextTitle", nextTitle);
			request.setAttribute("preTitle", preTitle);
			path = "/views/board/boardDetailView.jsp";
		}else {
			request.setAttribute("msg", "게시글 조회에 실패하였습니다");
			path = "/views/common/errorPage.jsp";
		}		
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
