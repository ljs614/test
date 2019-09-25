package triptaxi.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;


import triptaxi.user.model.service.UserService;
import triptaxi.user.model.vo.User;


/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/UserEnrollEnd")
public class UserEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//client가 보낸 값 받기!
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "잘못된 요청입니다. -관리자문의-");
////			request.setAttribute("loc","/board/boardForm");
//			request.getRequestDispatcher("/views/common/msg.jsp")
//			.forward(request, response);
//		}
//		
//		String saveDir=getServletContext().getRealPath("/");
//		saveDir+="/upload/User";  //폴더만들어
//		
//		int maxSize=1024*1024*1024;//1GB
//		
//		MultipartRequest mr=new MultipartRequest(request,saveDir,maxSize,"UTF-8",
//				new MyFileRenamePolicy());
//		
//		String id=mr.getParameter("userId");//userId_
//		String pw=mr.getParameter("password");
//		String name=mr.getParameter("userName");
//		char gender=mr.getParameter("gender").charAt(0);
//		String month=mr.getParameter("birthmonth");
//		String day=mr.getParameter("birthday");
//		if(month.length()==1) {
//			month="0"+month;
//		}
//		if(day.length()==1) {
//			day="0"+day;
//		}
//		String birthday=mr.getParameter("birthyear")+month+day;
//		
//		
//		String phone=mr.getParameter("phone");
//		String email=mr.getParameter("email");
////		String profile=mr.getFilesystemName("profile");
//		System.out.println(birthday);
//		User u=new User();
//		u.setUserId(id);
//		u.setPassword(pw);
//		u.setUserName(name);
//		u.setGender(gender);
//		u.setBirthday(birthday);
//		u.setPhone(phone);
//		u.setEmail(email);
//		u.setProfile(profile);
		
		String id=request.getParameter("userId");//userId_
		String pw=request.getParameter("password");
		String name=request.getParameter("userName");
		char gender=request.getParameter("gender").charAt(0);
		String month=request.getParameter("birthmonth");
		String day=request.getParameter("birthday");
		if(month.length()==1) {
			month="0"+month;
		}
		if(day.length()==1) {
			day="0"+day;
		}
		String birthday=request.getParameter("birthyear")+month+day;
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
		
		User u=new User(id,pw,name,gender,birthday,email,phone);
		
		
		//비지니스로직!
		//사용자가 보내준 데이터를 DB에 저장하고 결과를 반환
		int result=new UserService().insertUser(u);
		
		String msg=result>0?"가입완료!":"가입실패!";
		String loc="/";

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
