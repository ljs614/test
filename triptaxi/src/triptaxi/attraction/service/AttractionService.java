package triptaxi.attraction.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.attraction.dao.AttractionDao;




public class AttractionService {
	private AttractionDao dao=new AttractionDao();
	private String city;

	public Attraction selectAttraction(String attId) {
			Connection conn=getConnection();
		Attraction a=dao.selectAttraction(conn,attId);
		close(conn);
		city=a.getCity();
		return a;
		
	}
	
	public List<Attraction> recommendAttraction(String attId){
		Connection conn=getConnection();
		List<Attraction> list=dao.recommendAttraction(conn,city,attId);
		close(conn);
		return list;
	}
	
}
