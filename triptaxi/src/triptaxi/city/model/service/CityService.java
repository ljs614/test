package triptaxi.city.model.service;

import java.sql.Connection;
import java.util.List;

import triptaxi.city.model.dao.CityDao;
import triptaxi.city.model.vo.City;
import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;;

public class CityService {
	
	private CityDao dao=new CityDao();
	
	public List<City> selectCityList(){
		Connection conn=getConnection();
		List<City> list=dao.selectCityList(conn);
		close(conn);
		return list;
	}

}
