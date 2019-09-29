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

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.Tour;

/**
 * Servlet implementation class ChangeDayListServlet
 */
@WebServlet("/changeDayList")
public class ChangeDayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeDayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String plannerId = request.getParameter("plannerId");
		int dayNo = Integer.parseInt(request.getParameter("dayNo"));
		PlannerService service = new PlannerService();
		
		String tourList = service.selectPlannerTourList(plannerId, dayNo);
		System.out.println(tourList);
		
		String[] tour= tourList.split(",");
		List<Tour> list = new ArrayList();
		
		for(String a:tour) {
			Tour t = service.selectTour(a);
			list.add(t);
		}
		
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
