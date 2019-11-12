package favorite.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.model.service.CampService;
import favorite.model.service.FavoriteService;
import user.model.vo.User;

/**
 * Servlet implementation class UserFavoriteDeleteServlet
 */
@WebServlet("/delete.favorite")
public class UserFavoriteDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFavoriteDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		int code = Integer.parseInt(request.getParameter("Code"));
		
		int result = new FavoriteService().campCancel(uno,code);
		
		if(result > 0) {
			
			request.getSession().setAttribute("msg", "목록에서 삭제 하였습니다.");
			response.sendRedirect("select.favorite");
			
		}else {
			request.getSession().setAttribute("msg", "목록에서 삭제 실패.");
			response.sendRedirect("select.favorite");			
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
