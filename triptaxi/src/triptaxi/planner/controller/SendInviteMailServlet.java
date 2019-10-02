package triptaxi.planner.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.user.model.service.UserService;
import triptaxi.user.model.vo.User;

/**
 * Servlet implementation class SendInviteMailServlet
 */
@WebServlet("/invite")
public class SendInviteMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendInviteMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        HttpSession hSession=request.getSession();
        String email=request.getParameter("email");
        String plannerName=request.getParameter("plannerName");
        String plannerId=request.getParameter("plannerId");
        User user=(User)hSession.getAttribute("loginUser");
        String str="";
        String sendText="";
        boolean email_tf=false;
        List<String> shareUser=new PlannerService().selectShareUser(plannerId);
        for(int i=0; i<shareUser.size(); i++) {
        	String sue=(shareUser.get(i)).split(",")[2];
        	String sui=(shareUser.get(i)).split(",")[0];
        	if(sue.equals(email)) {
        		email_tf=true;
        		break;
        	}
        	User user2=new UserService().selectOne(sui);
        	if(user2!=null&&!user2.getUserId().equals(user.getUserId())&&user2.getEmail().equals(email)) {
        		email_tf=true;
        		break;
        	}
        }
        if(user.getEmail().equals(email)) {
        	str="자기 자신은 초대할 수 없습니다.";
        }else if(email_tf){
        	str="이미 초대된 승객입니다.";
        }else{
		    sendText+="<h4>"+user.getUserName()+"님의 택시에 탑승하세요.</h4><br>";
		    sendText+="<center>";
		    sendText+="<div style='width:700px;border:1px solid #cecece;border-top:1px solid #49506a;font-size:20px'>";
			sendText+="<img src='http://rclass.iptime.org:9999/triptaxi/images/logo.png' width='250px' class='CToWUd'>";
//		    sendText+="<img src='http://localhost:9090/triptaxi/images/logo.png' width='250px' class='CToWUd'>";
			sendText+="<div style='width:100%;border-bottom:1px solid #cecece;text-align:left'>";
			sendText+="<div style='width:600px;margin:0 auto;margin-bottom:34px;margin-top:60px'>";
			sendText+="<span style='color:#363636;font-size:16px;line-height:22px'>";
			sendText+="<b>"+user.getUserName()+"</b>님이 '"+plannerName+"' 일정만들기에 초대하였습니다.<br>";
			sendText+="함께 즐거운 여행을 계획해 보세요!";
			sendText+="</span>";
			sendText+="<br><br>";
			sendText+="<center><br>";
			sendText+="<a href='"+"http://rclass.iptime.org:9999/triptaxi/planner/inviteYes?plannerId="+plannerId+"&email="+email+"' style='display:block;height:50px;padding-left:30px;padding-right:30px;font-size:20px;color:white;line-height:48px;margin:0 auto;text-align:center;display:inline-block;border-radius:10px;text-decoration:none;margin-top:35px;border:1px solid #f7870f;background:#fe931f;background-position:95% center' target='_blank' data-saferedirecturl='https://www.google.com/url?q=http://www.earthtory.com/ko/mypage/et_1908080923330125223001565267013?type%3Dplan_sub%26gdb_srl%3D294271%26iv_code%3D9c2809c566c96acfd6d125d287d511e1&amp;source=gmail&amp;ust=1570005044430000&amp;usg=AFQjCNGvyU7Y19qzobN6SlLhWVyb8px_yw'>";
//			sendText+="<a href='"+"http://localhost:9090/triptaxi/planner/inviteYes?plannerId="+plannerId+"&email="+email+"' style='display:block;height:50px;padding-left:30px;padding-right:30px;font-size:20px;color:white;line-height:48px;margin:0 auto;text-align:center;display:inline-block;border-radius:10px;text-decoration:none;margin-top:35px;border:1px solid #49506a;background:#49506a;background-position:95% center' target='_blank' data-saferedirecturl='https://www.google.com/url?q=http://www.earthtory.com/ko/mypage/et_1908080923330125223001565267013?type%3Dplan_sub%26gdb_srl%3D294271%26iv_code%3D9c2809c566c96acfd6d125d287d511e1&amp;source=gmail&amp;ust=1570005044430000&amp;usg=AFQjCNGvyU7Y19qzobN6SlLhWVyb8px_yw'>";
		    sendText+="탑승하기 >";
		    sendText+="</a>";
			sendText+="</center><br><br>";
			sendText+="</div></div></div>";
			sendText+="<span style='font-size:16px;color:#b3b3b3'>※ 본 메일은 발신전용으로 회신하실 경우 답변되지 않습니다.</span>";
			sendText+="<p style='color:#808080;font-size:13px'>Copyright ⓒ 2019 TripTaxi, All Right Reserved</p>";
			sendText+="</center>";
		    try{
		        //편지보낸시간
		        msg.setSentDate(new Date());
		         
		        InternetAddress from = new InternetAddress() ;
		         
		         
		        from = new InternetAddress("triptaxi<triptaxi123@gmail.com>");
		         
		        // 이메일 발신자
		        msg.setFrom(from);
		         
		        // 이메일 수신자
		        InternetAddress to = new InternetAddress(email);
		        msg.setRecipient(Message.RecipientType.TO, to);
		         
		        // 이메일 제목
		        msg.setSubject("triptaxi 초대 메세지", "UTF-8");
		        
		        // 이메일 내용
		        msg.setText(sendText, "UTF-8");
		         
		        // 이메일 헤더
		        msg.setHeader("content-Type", "text/html");
		         
		        //메일보내기
		        javax.mail.Transport.send(msg);
		        str="초대 되었습니다.";
		        new PlannerService().insertPlannerList(plannerId, user.getUserId(), email);
		         
		    }catch (AddressException addr_e) {
		    	str="이메일을 입력하세요";
		    }catch (MessagingException msg_e) {
		    	str="잘못된 이메일 입니다.";
		    }
        }
        response.getWriter().append(str);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	class MyAuthentication extends Authenticator {
	      
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "triptaxi123@gmail.com";       // 구글 ID
	        String pw = "taxi123123";          // 구글 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}

}
