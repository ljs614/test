package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.Tour;

/**
 * Servlet implementation class MakePlan2EndServlet
 */
@WebServlet("/makePlan2End")
public class MakePlan2EndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakePlan2EndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String plannerId = request.getParameter("endPlannerId");
		String plannerName = request.getParameter("endPlanTitle");
		String plannerDate = request.getParameter("endStartDay");
		String plannerTheme="";
		PlannerService service=new PlannerService();
		char plannerPublic=request.getParameter("endPublic")==null?'Y':'N';
		
		switch(request.getParameter("endTheme")) {
		case "familyTrip":plannerTheme="가족여행"; break;
		case "soloTrip":plannerTheme="나홀로여행"; break;
		case "coupleTrip":plannerTheme="커플여행"; break;
		case "friendTrip": plannerTheme="친구여행"; break;
		case "businessTrip": plannerTheme="비즈니스여행"; break;
		}
		int result = service.plannerEnd(plannerId, plannerName, plannerDate, plannerTheme, plannerPublic);
		
		HashSet<String> tourList=new HashSet<String>();
		List<PlannerDay> pdList=service.selectPlannerDayList(plannerId);
		List list=new ArrayList();
		for(int i=0; i<pdList.size(); i++) {
			if(pdList.get(i).getTourList()!=null) {					
				String[] tours=pdList.get(i).getTourList().split(",");
				for(int j=0; j<tours.length; j++) {
					tourList.add(tours[j]);
				}
			}
		}
		switch(plannerTheme) {
		case "가족여행":plannerTheme="family_trip"; break;
		case "나홀로여행":plannerTheme="solo_trip"; break;
		case "커플여행":plannerTheme="couple_trip"; break;
		case "친구여행": plannerTheme="friend_trip"; break;
		case "비즈니스여행": plannerTheme="business_trip"; break;
		}
		Iterator<String> it=tourList.iterator();
		while(it.hasNext()) {
			service.updateThemeUp(it.next(), plannerTheme);
		}
		
		response.sendRedirect("/triptaxi/planner/plannerView?plannerId="+plannerId);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
