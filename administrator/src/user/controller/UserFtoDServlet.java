package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.model.service.CampService;
import camp.model.vo.Attachment;
import camp.model.vo.CampDetail;
import camp.model.vo.CampInfo;
import camp.model.vo.CampMinPrice;
import camp.model.vo.CampReview;
import favorite.model.service.FavoriteService;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserFtoDServlet
 */
@WebServlet("/FtoD.user")
public class UserFtoDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFtoDServlet() {
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

		
		String location = request.getParameter("location");
		ArrayList<CampInfo> cList = new UserService().selectLocationList(location);
		ArrayList<Attachment> aList = new UserService().selectLocationAttachmentList(location);
		ArrayList<CampMinPrice> cmpList = new UserService().selectMinPrice();
		ArrayList<CampDetail> cdList = new UserService().selectDetail();
		ArrayList<CampReview> crList = new UserService().selectReview();
		
		
		
		System.out.println("코드 : "+code);
		System.out.println("코드리스트 : "+codeList);
		System.out.println("로케이션 : "+location);
		System.out.println("cList : "+cList);
		System.out.println("aList : "+aList);
		System.out.println("cmpList : "+cmpList);
		System.out.println("cdList : "+cdList);
		System.out.println("crList : "+crList);
		
		
		
		
		
		
		
		
		request.getSession().setAttribute("cList", cList);
		request.getSession().setAttribute("aList", aList);
		request.getSession().setAttribute("cmpList", cmpList);
		request.getSession().setAttribute("cdList", cdList);
		request.getSession().setAttribute("crList", crList);
		
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