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
		String userId=request.getParameter("userId");
		String plannerId=request.getParameter("plannerId");
		PlannerService service=new PlannerService();
		Planner planner=service.selectPlanner(userId, plannerId);
		List<Attraction[]> list=new ArrayList<Attraction[]>();
		String view;
		
		if(planner!=null) {
			String[] days=planner.getPlannerPlan().split("/");
			for(int i=0; i<days.length; i++) {
				String[] tours=days[i].split(",");
				Attraction[] atts=new Attraction[tours.length];
				for(int j=0; j<tours.length; j++) {
					atts[j]=service.selectAttraction(tours[j]);
				}
				list.add(atts);
			}
			request.setAttribute("planner", planner);
			request.setAttribute("atts", list);
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
