package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import triptaxi.planner.model.service.PlannerService;

import com.google.gson.Gson;
import com.triptaxi.attraction.model.vo.Attraction;
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.Tour;

/**
 * Servlet implementation class PlannerViewServlet
 */
@WebServlet("/planner/plannerView")
public class PlannerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlannerViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String plannerId=request.getParameter("plannerId");
		PlannerService service=new PlannerService();
		service.plannerCountUp(plannerId);
		Planner planner=service.selectPlanner(plannerId);
		String view;
		Tour[] tourList=null;
		if(planner!=null) {
			List<PlannerDay> pdList=service.selectPlannerDayList(plannerId);
			List list=new ArrayList();
			for(int i=0; i<pdList.size(); i++) {
				if(pdList.get(i).getTourList()!=null) {					
					String[] tours=pdList.get(i).getTourList().split(",");
					tourList=new Tour[tours.length];
					for(int j=0; j<tours.length; j++) {
						tourList[j]=service.selectTour(tours[j]);
					}
					list.add(tourList);
				}else {
					list.add(pdList.get(i).getCityName());
				}
			}
			request.setAttribute("planner", planner);
			request.setAttribute("jlist", gson.toJson(list));
			view="/views/planner/planView.jsp";
			
		}else {
			view="/";
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
