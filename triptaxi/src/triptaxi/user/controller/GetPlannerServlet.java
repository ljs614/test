package triptaxi.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.Planner;
import triptaxi.user.model.service.UserService;

/**
 * Servlet implementation class GetPlannerServlet
 */
@WebServlet("/user/planner")
public class GetPlannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPlannerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		String plannerType=request.getParameter("plannerType");
		PlannerService pService=new PlannerService();
		List<Planner> pList=new ArrayList<Planner>();
		System.out.println(plannerType);
		if(plannerType.equals("완성된 일정")) {
			pList=new UserService().selectPlanner(userId);
		}
		List<String[]> pwList=new ArrayList<String[]>();
		String[] cities=new String[pList.size()];
		for(int i=0; i<pList.size(); i++) {
			List<String> userList=pService.selectShareUser(pList.get(i).getPlannerId());
			String[] userArr=new String[userList.size()];
			for(int j=0; j<userArr.length; j++) {
				userArr[j]=userList.get(j);
			}
			pwList.add(userArr);
			cities[i]=pService.selectPlannerDayList(pList.get(i).getPlannerId()).get(0).getCityName();
		}
		
		Gson gson=new Gson();
		JSONObject jList=new JSONObject();
		jList.put("plannerList", pList);
		jList.put("userList",pwList);
		jList.put("cities", cities);
		response.getWriter().append(gson.toJson(jList));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
