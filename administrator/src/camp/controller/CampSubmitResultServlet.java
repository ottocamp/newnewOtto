package camp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.model.service.CampService;
import camp.model.vo.Attachment;
import camp.model.vo.CampInfo;
import user.model.vo.User;

/**
 * Servlet implementation class CampSubmitResultServlet
 */
@WebServlet("/submitresult.ca")
public class CampSubmitResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampSubmitResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		
		int uNo = loginUser.getUserNo();
		
		 
		 ArrayList<CampInfo> cList = new CampService().selectSubmitResult(uNo);
		request.setAttribute("cList", cList);
		request.getRequestDispatcher("views/camp/campSubmitResultView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
