package favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import favorite.model.service.FavoriteService;
import user.model.vo.User;

/**
 * Servlet implementation class FavoriteInOrDeServlet
 */
@WebServlet("/inOrde.favorite")
public class FavoriteInOrDeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteInOrDeServlet() {
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
		
		String flag =  request.getParameter("flag");
		
		if(flag.equalsIgnoreCase("I")) {
			
			int result = new FavoriteService().campInsert(uno,code);
			
			if(result > 0) {
				
				PrintWriter out = response.getWriter();	
				out.print("success");
				
			}else {
				
				PrintWriter out = response.getWriter();	
				out.print("fail");
					
			}
			
			
			
			
			
		}else {
			
			int result = new FavoriteService().campCancel(uno,code);
			
			if(result > 0) {
			
				PrintWriter out = response.getWriter();	
				out.print("success");
				
			}else {
				
				PrintWriter out = response.getWriter();	
				out.print("fail");
					
			}
			
			
			
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
