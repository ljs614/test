package triptaxi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.user.model.service.UserService;
import triptaxi.user.model.vo.User;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/user/userupdate")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			User u=new User();
			String id=request.getParameter("user_id");
			
			String email=request.getParameter("user_email");
			String email1=request.getParameter("email1");
			email+="@"+email1;
			String phone=request.getParameter("phone");
			
			int result=new UserService().updateUser(id,email,phone);
			
			String msg=result>0?"수정완료!":"수정실패!";
			String loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.setAttribute("id", id);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
