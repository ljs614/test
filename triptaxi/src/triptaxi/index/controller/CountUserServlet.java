package triptaxi.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jdk.nashorn.api.scripting.JSObject;
import triptaxi.city.model.service.CityService;

/**
 * Servlet implementation class MainDayCityServlet
 */
@WebServlet("/countUser")
public class CountUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result=new CityService().countUser();
		int result1=new CityService().countPlanner();
		int result2=new CityService().countAttraction();
		JSONObject jobj=new JSONObject();
		jobj.put("result", result);
		jobj.put("result1", result1);
		jobj.put("result2", result2);
		
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(jobj,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
