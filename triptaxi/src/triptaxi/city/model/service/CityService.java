package triptaxi.city.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import triptaxi.city.model.dao.CityDao;
import triptaxi.city.model.vo.City;
import triptaxi.planner.model.vo.CityList;;

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
		
	}

}
