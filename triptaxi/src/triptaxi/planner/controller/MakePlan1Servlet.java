package triptaxi.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.CityList;
import triptaxi.user.model.vo.User;


/**
 * Servlet implementation class MakePlan1Servlet
 */
@WebServlet("/makePlan1")
public class MakePlan1Servlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakePlan1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  HttpSession session = request.getSession();
	  User loginUser = (User)session.getAttribute("loginUser");
	  Gson gson = new Gson();
	  
	  if(loginUser!=null) {
		  List<CityList> list = new PlannerService().selectCityList("Asia");
		  request.setAttribute("asiaList", gson.toJson(list));
		  session.setAttribute("loginUser", session.getAttribute("loginUser"));
		  request.getRequestDispatcher("/views/planner/makePlan1.jsp").forward(request, response);
		  
	  }else {
		  System.out.println("에러페이지 연결");
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