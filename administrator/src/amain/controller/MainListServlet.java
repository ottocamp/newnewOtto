package amain.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import amain.model.service.MainService;
import amain.model.vo.MainAccumJoin;
import amain.model.vo.MainBoardIndex;
import amain.model.vo.MainIndexBar;
import amain.model.vo.MainJoinCount;

/**
 * Servlet implementation class MainListServlet
 */
@WebServlet("/main.li")
public class MainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MainAccumJoin> majList = new MainService().selectMAJList();
		ArrayList<MainBoardIndex> mbiList = new MainService().selectMBILIst();
		ArrayList<MainIndexBar> mibList = new MainService().selectMIBList();
		ArrayList<MainJoinCount> mjcList = new MainService().selectMJCList();
		
		request.setAttribute("majList", majList);
		request.setAttribute("mbiList", mbiList);
		request.setAttribute("mibList", mibList);
		request.setAttribute("mjcList", mjcList);
		
		request.getRequestDispatcher("views/common/Adminmenubar.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
