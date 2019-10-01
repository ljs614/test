package triptaxi.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import triptaxi.user.model.service.UserService;
import triptaxi.user.model.vo.User;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("userId");
		String pw=request.getParameter("password");
//	System.out.println(pw);
		
		
		String saveId=request.getParameter("saveId");
		String location=request.getParameter("location");
		String parameter=request.getParameter("parameter");
		UserService service=new UserService();
		User u=service.selectId(id,pw);
		
	
		String msg="";
		String view="";
		String loc="/";
		loc=location+"?"+parameter;
		if(location.replace("/triptaxi", "").equals("/UserEnroll")) {
			loc="/triptaxi";
		}
		if(u!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginUser", u);
		
			if(saveId != null) {
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(3*24*60*60);//초단위계산
				response.addCookie(c);				
			}else {
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
			int result=service.checkInvite(u.getUserId(),u.getEmail());
			
			
			
			
			
			
			
			response.sendRedirect(loc);
			
		}else {
			//로그인이 안됨!
			loc=loc.replace("/triptaxi", "");
			msg="아이디나 패스워드가 일치하지 않습니다.!";
			view="/views/common/msg.jsp";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request,response);
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
