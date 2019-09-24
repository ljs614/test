package triptaxi.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import triptaxi.planner.model.service.PlannerService;

import triptaxi.planner.model.vo.CityList;

/**
 * Servlet implementation class CityListAjaxServlet
 */
@WebServlet("/cityListAjax")
public class CityListAjaxServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println(request.getParameter("continentName"));
      List<CityList> list = new PlannerService().selectCityList(request.getParameter("continentName"));

      
      response.setContentType("application/json;charset=UTF-8");
      new Gson().toJson(list, response.getWriter());
//      request.setAttribute("data", gson.toJson(list));
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}