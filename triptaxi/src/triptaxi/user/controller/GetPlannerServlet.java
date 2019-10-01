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
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=6;
		int totalData=0;
		PlannerService pService=new PlannerService();
		UserService uService=new UserService();
		List<Planner> pList=new ArrayList<Planner>();
		if(plannerType.equals("ed_plan")) {
			totalData=uService.selectCountPlanner(userId);
			pList=uService.selectPlanner(userId, cPage, numPerPage);
		}else if(plannerType.equals("ing_plan")) {
			totalData=uService.selectCountPlannerIng(userId);
			pList=uService.selectPlannerIng(userId, cPage, numPerPage);
			
		}else {
			totalData=uService.selectCountPlannerLike(userId);
			pList=uService.selectPlannerLike(userId, cPage, numPerPage);
		}
		List<String[]> pwList=new ArrayList<String[]>();
		String[] cities=new String[pList.size()];
		for(int i=0; i<pList.size(); i++) {
			List<String> userList=pService.selectShareUser(pList.get(i).getPlannerId());
			for(int j=0; j<userList.size(); j++) {
				if(!userList.get(j).split(",")[2].equals("null")) {
					userList.remove(j);
				}
			}
			String[] userArr=new String[userList.size()];
			for(int j=0; j<userArr.length; j++) {
				userArr[j]=userList.get(j);
			}
			pwList.add(userArr);
			cities[i]=pService.selectPlannerDayList(pList.get(i).getPlannerId()).get(0).getCityName();
		}
		int[] dayList=new int[pList.size()];
		for(int i=0; i<dayList.length; i++) {
			dayList[i]=pService.plannerDayCount(pList.get(i).getPlannerId());
		}
		

		
		String pageBar="<div id='pageBar'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		if(pageNo==1) {
			pageBar+="<li><span><</span></li>";
		}else {
			pageBar+="<li><a href='javascript:fn_planner('"+plannerType+"',"+pageNo+")'><</a></li>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='cPage'><span>"+pageNo+"</span></li>";
			}else {
				pageBar+="<li><a href='javascript:fn_planner('"+plannerType+"',"+pageNo+")'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		//다음 만들기
		if(pageNo>totalPage) {
			pageBar+="<li><span>></span></li>";
		}else {
			pageBar+="<li><a href='javascript:fn_planner('"+plannerType+"',"+pageNo+")'>></a><li>";
		}
		pageBar+="</div>";
		Gson gson=new Gson();
		JSONObject jList=new JSONObject();
		jList.put("plannerList", pList);
		jList.put("userList",pwList);
		jList.put("cities", cities);
		jList.put("dayList", dayList);
		jList.put("pageBar",pageBar);
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
