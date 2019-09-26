package triptaxi.planner.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.Tour;

/**
 * Servlet implementation class makePlan2Servlet
 */
@WebServlet("/makePlan2")
public class makePlan2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public makePlan2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("plannerId"));
		String plannerId = request.getParameter("plannerId");
		PlannerService service = new PlannerService();
		
		Planner planner = service.selectPlanner(plannerId);
		
		List<PlannerDay> dayList = new ArrayList<PlannerDay>();
		dayList = service.selectPlannerDayList(plannerId);
		
		List<Tour> attrList = new ArrayList<Tour>();
		attrList = service.selectTourList("tt_attraction", "city", dayList.get(0).getCityName());

		
		Gson gson = new Gson();

		String date = new SimpleDateFormat("yyyy-MM-dd").format(planner.getPlannerDate());
	
		JSONObject list = new JSONObject();
		list.put("plannerId", planner.getPlannerId());
		list.put("plannerName", planner.getPlannerName());
		list.put("plannerDate", date);
		list.put("plannerId", planner.getPlannerId());
		list.put("dayList", dayList);
		list.put("attrList", attrList);

		response.setContentType("application/json;charset=UTF-8");
	    new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
