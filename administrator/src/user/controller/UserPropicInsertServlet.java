package user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.PropicRenamePolicy;
import user.model.service.UserService;
import user.model.vo.User;
import user.model.vo.UserPropic;

/**
 * Servlet implementation class UserPropic
 */
@WebServlet("/propic.user")
public class UserPropicInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPropicInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User loginUser =  (User)request.getSession().getAttribute("loginUser");
		String uid = loginUser.getUserId();
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;
			

			String root = request.getSession().getServletContext().getRealPath("/");
			

			String savePath = root + "/resources/userpropic/";
			
			MultipartRequest  multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new PropicRenamePolicy(uid));

			String originName = multiRequest.getOriginalFileName("upfile");
			String changeName = multiRequest.getFilesystemName("upfile");
		
			UserPropic userpropic = new UserPropic();
			userpropic.setUserNo(loginUser.getUserNo());
			userpropic.setOriginName(originName);
			userpropic.setChangeName(changeName);
			
	
			

			int result = new UserService().insertUserPropic(userpropic);
			
			if(result > 0) {
				
					request.setAttribute("msg", "사진을 성공적으로 수정하였습니다.");
					request.getRequestDispatcher("views/user/propicupdate.jsp").forward(request, response);
				
			}else {
				

					File failedFile = new File(savePath+changeName);
					failedFile.delete();
				
					request.setAttribute("msg", "사진 등록 실패");
					request.getRequestDispatcher("views/user/propicupdate.jsp").forward(request, response);
				
				
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
