package favorite.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.model.vo.Attachment;
import camp.model.vo.CampInfo;
import favorite.model.service.FavoriteService;
import user.model.vo.User;

/**
 * Servlet implementation class UserFavoriteSelectServelt
 */
@WebServlet("/select.favorite")
public class UserFavoriteSelectServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFavoriteSelectServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		
		int uno = loginUser.getUserNo();
		
		ArrayList<CampInfo> cList = new FavoriteService().selectList(uno);
		ArrayList<Attachment> aList = new FavoriteService().selectAttachmentList();
		
		request.setAttribute("cList", cList);
		request.setAttribute("aList", aList);
		
		request.getRequestDispatcher("views/user/userFavorite.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
