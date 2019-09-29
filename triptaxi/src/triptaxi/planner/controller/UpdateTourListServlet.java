package triptaxi.planner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.planner.model.service.PlannerService;

/**
 * Servlet implementation class UpdateTourList
 */
@WebServlet(name = "UpdateTourListServlet", urlPatterns = { "/updateTourList" })
public class UpdateTourListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTourListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlannerService service = new PlannerService();
		
		String plannerId = request.getParameter("plannerId");
		int dayNo = Integer.parseInt(request.getParameter("dayNo"));
		String tourId = request.getParameter("tourId");
		String tourList = service.selectPlannerTourList(plannerId, dayNo);
	
		if(tourList!=null) {
			tourList += ","+tourId;
		}else {
			tourList = tourId;
		}
		int result = service.updateDayTourList(tourList, plannerId, dayNo);
		if(result>0) {
			response.setContentType("text/csv;charset=UTF-8");
			response.getWriter().append("true");
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
