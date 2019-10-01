package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.city.model.service.CityService;
import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.PlannerCity;
import triptaxi.planner.model.vo.PlannerFullInfo;

/**
 * Servlet implementation class PlanMainServlet
 */
@WebServlet("/planMain")
public class PlanMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=9;
		int totalData=0;
		PlannerService service = new PlannerService();
		
		List<PlannerFullInfo> plannerList = new ArrayList<PlannerFullInfo>();
		List<PlannerCity> plannerCity = new ArrayList<PlannerCity>();
		
		plannerList = service.selectPlannerFullInfo("PLANNER_THEME IS NOT NULL AND PLANNER_PUBLIC = 'Y' ORDER BY PLANNER_LIKE DESC");
		plannerCity = service.selectPlannerCity();
		
		
		List<CityList> list = new CityService().selectAllCityList();
		
		request.setAttribute("cityList", list);
		request.getRequestDispatcher("/views/planner/planMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
