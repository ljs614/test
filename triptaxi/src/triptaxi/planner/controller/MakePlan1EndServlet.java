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
//		System.out.println(request.getParameter("jsonData"));
//		System.out.println(request.getParameter("planTitle"));
//		System.out.println(request.getParameter("startDay"));
//		
		String plannerName = request.getParameter("planTitle");
		String plannerDate = request.getParameter("startDay");
		System.out.println(plannerDate);
	
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date to=null;
		try {
			to = transFormat.parse(plannerDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		String month = plannerDate.substring(5, 7);
	
		PlannerService service = new PlannerService(); 
		Gson gson = new Gson();
		
		List<JsonCityCount> list = gson.fromJson(request.getParameter("jsonData"), 
													new TypeToken<List<JsonCityCount>>(){}.getType());
		
		String imageUrl = service.selectCityImg(list.get(0).getCity());
		
		String plannerId = service.insertPlanner(plannerName, plannerDate, imageUrl);
		
		Planner planner = new Planner();
		planner.setPlannerId(plannerId);
		planner.setPlannerName(plannerName);
		planner.setPlannerDate(to);
		
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
		
		List<Tour> AttrList = new ArrayList<Tour>();
		
		if(result>0) {
			dayList = service.selectPlannerDayList(plannerId);
			AttrList = service.selectTourList("tt_attraction", "city", list.get(0).getCity());
		}
		
		for(PlannerDay p : dayList) {
			System.out.println(p.getPlannerDayNo());
		}
		for(Tour t : AttrList) {
			System.out.println(t.getTourName());
		}
		System.out.println("json : " + gson.toJson(planner));
		
		request.setAttribute("planner", gson.toJson(planner));
		request.setAttribute("dayList", gson.toJson(dayList));
		request.setAttribute("tourList", gson.toJson(AttrList));
		request.getRequestDispatcher("/views/planner/makePlan2.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
