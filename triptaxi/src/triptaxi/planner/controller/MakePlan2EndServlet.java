package triptaxi.planner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.planner.model.service.PlannerService;

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
		char plannerPublic=request.getParameter("endPublic")==null?'Y':'N';
		
		switch(request.getParameter("endTheme")) {
		case "familyTrip":plannerTheme="가족여행"; break;
		case "soloTrip":plannerTheme="나홀로여행"; break;
		case "coupleTrip":plannerTheme="커플여행"; break;
		case "friendTrip": plannerTheme="친구여행"; break;
		case "businessTrip": plannerTheme="비즈니스여행"; break;
		}
		int result = new PlannerService().plannerEnd(plannerId, plannerName, plannerDate, plannerTheme, plannerPublic);
		
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
