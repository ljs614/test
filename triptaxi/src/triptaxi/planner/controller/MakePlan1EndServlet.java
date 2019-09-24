package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.JsonCityCount;
import triptaxi.planner.model.vo.PlannerDay;

/**
 * Servlet implementation class MakePlan1EndServlet
 */
@WebServlet("/makePlan1End")
public class MakePlan1EndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakePlan1EndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getParameter("jsonData"));
//		System.out.println(request.getParameter("planTitle"));
//		System.out.println(request.getParameter("startDay"));
//		
		String plannerName = request.getParameter("planTitle");
		String plannerDate = request.getParameter("startDay");
		
		PlannerService service = new PlannerService(); 
		Gson gson = new Gson();
		List<JsonCityCount> list = gson.fromJson(request.getParameter("jsonData"), 
													new TypeToken<List<JsonCityCount>>(){}.getType());
		
		for(JsonCityCount c : list) {
			System.out.println(c.toString());
		}
		
		String plannerId = service.insertPlanner(plannerName, plannerDate);
		
		int dayNo = 1;
		int result = 0;
		
		List<PlannerDay> dayList = new ArrayList<PlannerDay>();

		
		if(plannerId != null) {
			for(int i=0;i<list.size();i++) {
				int count = list.get(i).getCount();
				for(int j=0;j<count;j++) {
					PlannerDay pd = new PlannerDay(null, dayNo, list.get(i).getCity(),null,plannerId);
					dayList.add(pd);
				}
			}			
			result = service.insertPlannerDay(dayList);
		}
		
		if(result>0) {
			dayList = service.selectPlannerDayList(plannerId);
			service.selectTourList(list.get(0).getCity());
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
