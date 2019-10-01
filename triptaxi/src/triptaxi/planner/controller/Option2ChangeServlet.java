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
 * Servlet implementation class Option2ChangeServlet
 */
@WebServlet("/option2Change")
public class Option2ChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Option2ChangeServlet() {
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
		String receiveOption2 = request.getParameter("option2");
		String option2 = (request.getParameter("option2").equals("null"))?"":"where city_name like '%"+request.getParameter("option2")+"%'";
		

		int numPerPage=9;
		int totalData=0;
		PlannerService service = new PlannerService();

		List<PlannerFullInfo> plannerList = new ArrayList<PlannerFullInfo>();
		List<PlannerCity> plannerCity = new ArrayList<PlannerCity>();

		plannerCity = service.selectPlannerCity2(option2);
		
		String idList = "";
		if(plannerCity.size()==1) {
			idList=plannerCity.get(0).getPlannerId();
		}else {
			for(int i=0; i<plannerCity.size();i++) {
				if(i==0) {
					idList += plannerCity.get(i).getPlannerId() + "',";
				}else if(i==(plannerCity.size()-1)) {
					idList += "'" + plannerCity.get(i).getPlannerId();
				}else {
					idList += "'" + plannerCity.get(i).getPlannerId() + "',";
				}
			}	
		}
		
		String totalOption = "PLANNER_THEME IS NOT NULL AND PLANNER_PUBLIC = 'Y' AND PLANNER_ID IN ('"+ idList +"') "+ option1;

		 plannerList = service.selectPlannerFullInfo(cPage, numPerPage, totalOption);
		 totalData = service.selectCountPlanner(totalOption);
		  
		 
		 for(PlannerFullInfo p : plannerList) {
			 System.out.println(p);
		 }
		  
		 for(int i=0;i<plannerList.size();i++) { 
			 for(int j=0;j<plannerCity.size();j++){
				 if(plannerList.get(i).getPlannerId().equals(plannerCity.get(j).getPlannerId())) { 
					 plannerList.get(i).setCityList(plannerCity.get(j).getCityList()); 
					 } 
				 } 
			 }
		 
		 String pageBar = ""; int totalPage =
		 (int)Math.ceil((double)totalData/numPerPage); int pageBarSize=5; int
		 pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; int
		 pageEnd=pageNo+pageBarSize-1;
		 
		 
		 if(pageNo==1)
		 { 
			 pageBar += "<span> [이전] </span>"; 
		}else 
		{ pageBar +="<a href='javascript:fn_paging2('"+option1+","+receiveOption2+","+pageNo+")'> [이전] </a>"; 
		}
		 
		 while(!(pageNo>pageEnd || pageNo>totalPage )) {
			 if(pageNo==cPage) { 
				 pageBar += "<span> " + pageNo + " </span>"; 
			 }else { 
				 pageBar += "<a href='javascript:fn_paging2('"+option1+","+receiveOption2+","+ pageNo+")'> " + pageNo + " </a>"; 
			 } pageNo++; 
		}
		 
		 if(pageNo>totalPage) { 
			 pageBar += "<span>[다음]</span>"; 
		 }else { 
			 pageBar += "<a href='javascript:fn_paging2('"+option1+","+receiveOption2+","+ pageNo+")'> [다음] </a>"; 
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
