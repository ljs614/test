package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.Tour;

/**
 * Servlet implementation class ChangeTourListServlet
 */
@WebServlet("/changeTourList")
public class ChangeTourListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeTourListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String table = request.getParameter("table");
		String cityName = request.getParameter("cityName");
		String select = request.getParameter("select");
		PlannerService service = new PlannerService();

		List<Tour> tourList = new ArrayList();
		
		if(table.equals("tt_attraction") || table.equals("tt_activity")) {
			service.selectTourList(table, "city", cityName);
		}else if(table.equals("tt_festival")) {
			service.selectFestivalList(table, "city", cityName, "category", select+"월");
		}else if(table.equals("tt_clip")) {
			
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
