package triptaxi.planner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.PlannerDay;

/**
 * Servlet implementation class InsertPlannerDayServlet
 */
@WebServlet("/insertPlannerDay")
public class InsertPlannerDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPlannerDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PlannerDay pd = new PlannerDay();
		pd.setPlannerDayNo(Integer.parseInt(request.getParameter("dayNo"))+1);
		pd.setCityName(request.getParameter("cityName"));
		pd.setPlannerId(request.getParameter("plannerId"));
		int result = new PlannerService().insertPlannerDayOne(pd);
		
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
