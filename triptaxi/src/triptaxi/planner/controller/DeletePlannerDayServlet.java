package triptaxi.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.PlannerDay;

/**
 * Servlet implementation class DeletePlannerDayServlet
 */
@WebServlet("/deletePlannerDay")
public class DeletePlannerDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePlannerDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("plannerId"));
		System.out.println(request.getParameter("dayNo"));
		
		List<PlannerDay> list = new PlannerService().deletePlannerDay(request.getParameter("plannerId"), Integer.parseInt(request.getParameter("dayNo")));
		
		Gson gson = new Gson();
		
		if(list!=null) {
			response.setContentType("text/csv;charset=UTF-8");
			response.getWriter().append(gson.toJson(list));
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
