package triptaxi.planner.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.Tour;

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
	
		String plannerName = request.getParameter("planTitle");
		String plannerDate = request.getParameter("startDay");
	
	
		PlannerService service = new PlannerService(); 
		Gson gson = new Gson();
		
		List<JsonCityCount> list = gson.fromJson(request.getParameter("jsonData"), 
				new TypeToken<List<JsonCityCount>>(){}.getType());
		
		
		String imageUrl = service.selectCityImg(list.get(0).getCity());
		String plannerId = service.insertPlanner(plannerName, plannerDate, imageUrl);
		
		int dayNo = 1;
		int result = 0;
		
		List<PlannerDay> dayList = new ArrayList<PlannerDay>();
		
		if(plannerId != null) {
			for(int i=0;i<list.size();i++) {
				int count = list.get(i).getCount();
				for(int j=0;j<count;j++) {
					PlannerDay pd = new PlannerDay(null, dayNo, list.get(i).getCity(),null,plannerId);
					dayNo++;
					dayList.add(pd);
				}
			}			
			result = service.insertPlannerDay(dayList);
		}
		
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/views/planner/makePlan2.jsp?plannerId="+plannerId);
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
