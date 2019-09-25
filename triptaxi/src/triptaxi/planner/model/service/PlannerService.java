package triptaxi.planner.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import triptaxi.planner.model.dao.PlannerDao;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerDay;
import triptaxi.planner.model.vo.Tour;

public class PlannerService {
	
	private PlannerDao dao=new PlannerDao();
	
	public Planner selectPlanner(String plannerId) {
		Connection conn=getConnection();
		
		Planner planner=dao.selectPlanner(conn, plannerId);
		
		close(conn);
		return planner;
	}
	
	public List<CityList> selectCityList(String continentName){
	      Connection conn = getConnection();
	      List<CityList> list = dao.selectCityList(conn, continentName);
	      close(conn);

	      return list;
	   }
	
	public String insertPlanner(String plannerName, String plannerDate) {
		Connection conn = getConnection();
		int result = dao.insertPlanner(conn, plannerName, plannerDate);
		String plannerId = null;
		if(result>0) {
			commit(conn);
			plannerId = dao.selectPlannerId(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return plannerId;
	}
	
	public int insertPlannerDay(List<PlannerDay> dayList) {
		Connection conn = getConnection();
		int result = 0;
		for(int i=0;i<dayList.size();i++) {
			result = dao.insertPlannerDay(conn, dayList.get(i));
			if(result==0) {
				rollback(conn);
				return 0;
			}
		}
		
		commit(conn);
		close(conn);
		
		return result;
	}
	
	public List<PlannerDay> selectPlannerDayList(String plannerId){
		Connection conn=getConnection();
		List<PlannerDay> list=dao.selectPlannerDayList(conn, plannerId);
		close(conn);
		return list;
	}
	
	public Tour selectTour(String tourId) {
		Connection conn=getConnection();
		String table="";
		String idName="";
		if(tourId.substring(0, 2).equals("at")) {
			table="TT_ATTRACTION";
			idName="ATTRACTION_ID";
		}else if(tourId.substring(0, 2).equals("ac")) {
			table="TT_ACTIVITY";
			idName="ACTIVITY_ID";
		}else{
			table="TT_FESTIVAL";
			idName="FESTIVAL_ID";
		}
		Tour tour=dao.selectTour(conn, tourId, table, idName);
		close(conn);
		return tour;
	}
	
	
	public List<Tour> selectTourList(String table, String col, String city){
		Connection conn = getConnection();
		
//		수정해야됨
		List<Tour> tourList = dao.selectTourList(conn, table, col, city);
		
		close(conn);
		return tourList;
		
	}
	
	public int updateTitle(String plannerId, String title) {
		Connection conn=getConnection();
		int result=dao.updateTitle(conn, plannerId, title);
		if(result>0) {
			commit(conn);
		}else {
			result=-1;
			rollback(conn);
		}
		close(conn);
		return result;
	}


}
