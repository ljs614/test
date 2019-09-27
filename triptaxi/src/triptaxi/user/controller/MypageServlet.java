package triptaxi.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import triptaxi.user.model.vo.User;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/user/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("loginUser");
		String view="";
		String[] cities= {"/나트랑/Nahtrang2.jpg","/다낭/Danang2.jpg","/라스베이거스/Lasvegas2.jpg","/라오스/Laos2.jpg","/런던/UnitedKingdom2.jpg","/로마/Rome2.jpg","/로스앤젤레스/Losangeles2.jpg","/방콕/Bangkok2.jpg","/베이징/Beijing2.jpg","/싱가포르/Singapore2.jpg","/칭다오/Qingdao2.jpg","/파리/Paris2.jpg","/푸켓/Phuket2.jpg"};
		int index=(int)(Math.random()*13);
		String choice=cities[index];
		request.setAttribute("cityImg", choice);
		if(user!=null) {
			view="/views/login/mypage.jsp";
		}else {
			view="/";
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
