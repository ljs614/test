package triptaxi.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.city.model.service.CityService;
import triptaxi.planner.model.service.PlannerService;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.PlannerCity;
import triptaxi.planner.model.vo.PlannerFullInfo;

/**
 * Servlet implementation class OptionChangeServlet
 */
@WebServlet("/optionChange")
public class OptionChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptionChangeServlet() {
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
		String option2 = (request.getParameter("option2").equals("null"))?"":"AND city like '%"+request.getParameter("option2")+"%'";
		
		String totalOption = "PLANNER_THEME IS NOT NULL AND PLANNER_PUBLIC = 'Y' "+option2+" " + option1;

		int numPerPage=9;
		int totalData=0;
		PlannerService service = new PlannerService();

		List<PlannerFullInfo> plannerList = new ArrayList<PlannerFullInfo>();
		List<PlannerCity> plannerCity = new ArrayList<PlannerCity>();

		totalData = service.selectCountPlanner(totalOption);
		plannerList = service.selectPlannerFullInfo(cPage, numPerPage, totalOption);
	
		String idList = "";
		for(int i=0; i<plannerList.size();i++) {
			if(i==0) {
				idList += plannerList.get(i).getPlannerId() + "',";
			}else if(i==(plannerList.size()-1)) {
				idList += "'" + plannerList.get(i).getPlannerId();
			}else {
				idList += "'" + plannerList.get(i).getPlannerId() + "',";
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
			pageBar += "<a href='javascript:fn_planner('"+option1+","+receiveOption2+","+pageNo+")'> [이전] </a>";
		}

		while(!(pageNo>pageEnd || pageNo>totalPage )) {
			if(pageNo==cPage) {
				pageBar += "<span> " + pageNo + " </span>";
			}else {
				pageBar += "<a href='javascript:fn_planner('"+option1+","+receiveOption2+","+pageNo+")'> " + pageNo + " </a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";
		}else {
			pageBar += "<a href='javascript:fn_planner('"+option1+","+receiveOption2+","+pageNo+")'> [다음] </a>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("totalData", totalData);
		request.setAttribute("plannerList", plannerList);
		
		List<CityList> list = new CityService().selectAllCityList();
		
		request.setAttribute("cityList", list);
		request.getRequestDispatcher("/views/planner/planMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
