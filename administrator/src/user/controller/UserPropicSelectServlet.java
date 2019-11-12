package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import user.model.service.UserService;
import user.model.vo.User;
import user.model.vo.UserPropic;

/**
 * Servlet implementation class UserPropicSelect
 */
@WebServlet("/propic.select")
public class UserPropicSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPropicSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		
		
		UserPropic userpropic= new UserService().selectUserPropic(uno);
		
		
		
		if(userpropic!=null) {
		
		response.setContentType("application/json; charset=utf-8"); 
		
		Gson gson = new Gson();
		gson.toJson(userpropic, response.getWriter());
		}else {
			
		UserPropic noprofile= new UserPropic(99999,"no#.jpg","no#.jpg");
		Gson gson = new Gson();
		gson.toJson(noprofile, response.getWriter());
				
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
