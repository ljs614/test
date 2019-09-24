package triptaxi.attraction.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.attraction.dao.AttractionDao;




public class AttractionService {
	private AttractionDao dao=new AttractionDao();
	
	public Attraction selectAttraction(String attId) {
			Connection conn=getConnection();
		Attraction a=dao.selectAttraction(conn,attId);
		close(conn);
		return a;
		
	}
	
	
}
