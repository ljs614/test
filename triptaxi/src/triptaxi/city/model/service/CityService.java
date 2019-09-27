package triptaxi.city.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

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

}
















