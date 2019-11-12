package favorite.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import favorite.model.service.FavoriteService;
import user.model.vo.User;

/**
 * Servlet implementation class FavoriteCheckServlet
 */
@WebServlet("/checkFavorite")
public class FavoriteCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int code =  Integer.parseInt(request.getParameter("code"));
		
		ArrayList<Integer> codeList = FavoriteService.selectCode(uno);
		
		request.setAttribute("code", code);
		request.setAttribute("codeList", codeList);
		request.getRequestDispatcher("views/mainPage/detail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
