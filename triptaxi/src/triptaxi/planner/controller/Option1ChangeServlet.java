package triptaxi.planner.controller;

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

import triptaxi.city.model.service.CityService;
import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.PlannerCity;
import triptaxi.planner.model.vo.PlannerFullInfo;

/**
 * Servlet implementation class OptionChangeServlet
 */
@WebServlet("/option1Change")
public class Option1ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Option1ChangeServlet() {
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
		
		String option1 = request.getParameter("option1");
		
		String totalOption = "PLANNER_THEME IS NOT NULL AND PLANNER_PUBLIC = 'Y' " + option1;

		int numPerPage=9;
		int totalData=0;
		PlannerService service = new PlannerService();

		List<PlannerFullInfo> plannerList = new ArrayList<PlannerFullInfo>();
		List<PlannerCity> plannerCity = new ArrayList<PlannerCity>();

		totalData = service.selectCountPlanner(totalOption);
		plannerList = service.selectPlannerFullInfo(cPage, numPerPage, totalOption);
	
		String idList = "";
		if(plannerList.size()==1) {
			idList=plannerList.get(0).getPlannerId();
		}else {
			for(int i=0; i<plannerList.size();i++) {
				if(i==0) {
					idList += plannerList.get(i).getPlannerId() + "',";
				}else if(i==(plannerList.size()-1)) {
					idList += "'" + plannerList.get(i).getPlannerId();
				}else {
					idList += "'" + plannerList.get(i).getPlannerId() + "',";
				}
			}	
		}
		
		plannerCity = service.selectPlannerCity(idList);

		for(int i=0;i<plannerList.size();i++) {
			for(int j=0;j<plannerCity.size();j++) {
				if(plannerList.get(i).getPlannerId().equals(plannerCity.get(j).getPlannerId())) {
					plannerList.get(i).setCityList(plannerCity.get(j).getCityList());
				}
			}
		}
		
		String pageBar = "";
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		
		if(pageNo==1) {
			pageBar += "<span> [이전] </span>";
		}else {
			pageBar += "<a href='javascript:fn_paging1('"+option1+","+pageNo+")'> [이전] </a>";
		}

		while(!(pageNo>pageEnd || pageNo>totalPage )) {
			if(pageNo==cPage) {
				pageBar += "<span> " + pageNo + " </span>";
			}else {
				pageBar += "<a href='javascript:fn_paging1('"+option1+","+pageNo+")'> " + pageNo + " </a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";
		}else {
			pageBar += "<a href='javascript:fn_paging1('"+option1+","+pageNo+")'> [다음] </a>";
		}
		
		JSONObject list = new JSONObject();
		list.put("cPage", cPage);
		list.put("pageBar", pageBar);
		list.put("totalData", totalData);
		list.put("plannerList", plannerList);
		
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
