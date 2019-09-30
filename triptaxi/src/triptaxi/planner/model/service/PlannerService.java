package triptaxi.planner.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
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
	
	public String insertPlanner(String plannerName, String plannerDate, String plannerWriter, String imgUrl) {
		Connection conn = getConnection();
		int result = dao.insertPlanner(conn, plannerName, plannerDate, plannerWriter, imgUrl);
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
		
		List<Tour> tourList = dao.selectTourList(conn, table, col, city);
		
		close(conn);
		return tourList;
		
	}
	
	public List<Tour> selectFestivalList(String table, String col, String city, String col2, String month){
		Connection conn = getConnection();
		
		List<Tour> tourList = dao.selectFestivalList(conn, table, col, city, col2, month);
		close(conn);
		return tourList;
	}
	
	public void updateTitle(String plannerId, String title) {
		Connection conn=getConnection();
		int result=dao.updateTitle(conn, plannerId, title);
		if(result>0) {
			commit(conn);
		}else {
			result=-1;
			rollback(conn);
		}
		close(conn);
		
	}
	
	public void updateCoverImg(String plannerId, String coverImg) {
		Connection conn=getConnection();
		int result=dao.updateCoverImg(conn, plannerId, coverImg);
		if(result>0) {
			commit(conn);
		}else {
			result=-1;
			rollback(conn);
		}
		close(conn);
	}
	
	public List<Planner> selectPlannerList(){
		Connection conn=getConnection();
		List<Planner> list=dao.selectPlannerList(conn);
		close(conn);
		return list;
	}
	
	public String selectCityImg(String cityName) {
		Connection conn = getConnection();
		String url = dao.selectCityImg(conn, cityName);
		
		close(conn);
		return url;
	}
	
	public int updateStartDate(String plannerId, String date) {
		Connection conn = getConnection();
		int result = dao.updatStartDate(conn, plannerId, date);
		close(conn);
		return result;
		
	}
	
	public List<PlannerDay> deletePlannerDay(String plannerId, int dayNo){
		Connection conn = getConnection();
		
		int result = dao.deletePlannerDay(conn, plannerId, dayNo);
		
		List<PlannerDay> list = new ArrayList<PlannerDay>();
		
		if(result>0) {
			list = dao.selectPlannerDayList(conn, plannerId);
			
			for(int i=0;i<list.size();i++) {
				result = dao.updatePlannerDayNo(conn, list.get(i).getPlannerDayId(), (i+1));
				
				if(result>0) {
					commit(conn);
					list = dao.selectPlannerDayList(conn, plannerId);
				}else {
					rollback(conn);
					return null;
				}
			}
		}
		close(conn);
		return list;
	}
	
	public int insertPlannerDayOne(PlannerDay pd) {
		Connection conn = getConnection();
		
		int result = dao.insertPlannerDay(conn, pd);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<String> selectShareUser(String plannerId) {
		Connection conn=getConnection();
		List<String> shareUsers=dao.selectShareUser(conn, plannerId);
		close(conn);
		return shareUsers;
		
	}
	
///////////////////////////추가한 부분/////////////////////////////////////////////////////
	public String selectPlannerTourList(String plannerId, int dayNo) {
		Connection conn = getConnection();
		String tourList = dao.selectPlannerTourList(conn, plannerId, dayNo);
		close(conn);
		return tourList;
	}
	
	public int updateDayTourList(String tourList, String plannerId, int dayNo) {
		Connection conn = getConnection();
		int result = dao.updateDayTourList(conn, tourList, plannerId, dayNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/////추가
	public void plannerCountUp(String plannerId) {
		Connection conn = getConnection();
		int result = dao.plannerCountUp(conn, plannerId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}
	
	public int refreshDay(String plannerId, int dayNo) {
		Connection conn = getConnection();
		int result = dao.refreshDay(conn, plannerId, dayNo);
		
		close(conn);
		return result;
	}
	
	public int plannerEnd(String plannerId, String plannerName, String plannerDate, String plannerTheme, char plannerPublic) {
		Connection conn = getConnection();
		int result = dao.plannerEnd(conn, plannerId, plannerName, plannerDate, plannerTheme, plannerPublic);
		close(conn);
		return result;
	}
	
	


}
