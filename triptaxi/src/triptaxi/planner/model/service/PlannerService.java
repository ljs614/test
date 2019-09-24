package triptaxi.planner.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.planner.model.dao.PlannerDao;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.JsonCityCount;
import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.PlannerDay;

public class PlannerService {
	
	private PlannerDao dao=new PlannerDao();
	
	public Planner selectPlanner(String userId, String plannerId) {
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
	
	public int insertPlannerDay(List<JsonCityCount> list ,String plannerId) {
		Connection conn = getConnection();
		int result = 0;
		int dayNo = 1;
		for(int i=0;i<list.size();i++) {
			int count = list.get(i).getCount();
			
			for(int j=0;j<count;j++) {
				result = dao.insertPlannerDay(conn, dayNo, list.get(i).getCity(), plannerId);
				dayNo++;
				if(result==0) {
					rollback(conn);
					return 0;
				}
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

}
