package triptaxi.city.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.city.model.dao.CityDao;
import triptaxi.city.model.vo.City;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;;

public class CityService {
	
	private CityDao dao=new CityDao();
	
	public List<City> selectCityList(){
		Connection conn=getConnection();
		List<City> list=dao.selectCityList(conn);
		close(conn);
		return list;
	}
	
	public List<CityList> selectAllCityList() {
		Connection conn = getConnection();
		List<CityList> list = dao.selectAllCityList(conn);
		close(conn);
		return list;
	}
	
	public City cityChoice(String cityName) {
		Connection conn=getConnection();
		City c=dao.cityChoice(conn, cityName);
		close(conn);
		return c;
	}
	
	public List<Planner> cityPlanList(String cityName){
		Connection conn=getConnection();
		List<Planner> p=dao.cityPlanList(conn, cityName);
		close(conn);
		return p;
	}
	
	public List<Attraction> attractionList(String cityName){
		Connection conn=getConnection();
		List<Attraction> a=dao.attractionList(conn, cityName);
		close(conn);
		return a;
	}
	public List<Attraction> activityList(String cityName){
		Connection conn=getConnection();
		List<Attraction> a=dao.activityList(conn, cityName);
		close(conn);
		return a;
	}
	
	public List<Attraction> festivalList(String cityName){
		Connection conn=getConnection();
		List<Attraction> a=dao.festivalList(conn, cityName);
		close(conn);
		return a;
	}
	
	public List<City> matchingCity(String ct,String wt){
		Connection conn=getConnection();
		List<City> list=dao.matchingCity(conn,ct,wt);
		close(conn);
		return list;
	}
	
	public int countUser() {
		Connection conn=getConnection();
		int result=dao.countUser(conn);
		close(conn);
		return result;
	}
	
	public int countPlanner() {
		Connection conn=getConnection();
		int result=dao.countPlanner(conn);
		close(conn);
		return result;
	}
	
	public int countAttraction() {
		Connection conn=getConnection();
		int result=dao.countAttraction(conn);
		close(conn);
		return result;
	}
	
//	public List<DayCity> selectDayCity(){
//		Connection conn=getConnection();
//		String todayCity = "";
//			// 오늘의 시티를 가져옴
//			todayCity = dao.getTodayCity(conn);
//			System.out.println("todayCity >> select : " + todayCity);
//			if(todayCity.equals("")) {
//				// 오늘의 시티가 없으면 만들어서 가져옴
//				todayCity = dao.insertGetTodayCity(conn);	
//			}
//			
//			
//			System.out.println("todayCity >> insertGetTodayCity : " + todayCity);
//		
//		List<DayCity> a=dao.selectDayCity(conn,todayCity);
//		close(conn);
//		return a;
//	}

}
















