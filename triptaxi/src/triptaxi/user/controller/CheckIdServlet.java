package triptaxi.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.user.model.service.UserService;
import triptaxi.user.model.vo.User;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/checkIdDuplicate")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		System.out.println(userId);
	
		//비지니스처리로직
		//DB에 userId와 일치하는 id가  user table에 있는지 
		//확인하고 있으면 true, 없으면 false반환하기!
		boolean check=new UserService().selectOne(userId)!=null?true:false;
		
		User u=new UserService().selectOne(userId);
		if(u==null) check=false;
		else check=true;
		request.setAttribute("check", check);
		
		//view선택!
		RequestDispatcher rd=request.getRequestDispatcher("/views/login/checkId.jsp");
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
