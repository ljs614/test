package triptaxi.planner.model.service;

import java.sql.Connection;
import java.util.List;

import triptaxi.planner.model.dao.PlannerDao;
import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;

import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.close;

public class PlannerService {
	
	private PlannerDao dao=new PlannerDao();
	
	public Planner selectPlanner(String userId, String plannerId) {
		Connection conn=getConnection();
		
		Planner planner=dao.selectPlanner(conn, userId, plannerId);
		
		close(conn);
		return planner;
	}
	
	public Attraction selectAttraction(String attraction_id) {
		Connection conn=getConnection();
		
		Attraction att=dao.selectAttraction(conn, attraction_id);
		close(conn);
		return att;
	}
	
	public List<CityList> selectCityList(String continentName){
	      Connection conn = getConnection();
	      List<CityList> list = dao.selectCityList(conn, continentName);
	      close(conn);

	      return list;
	   }

}
