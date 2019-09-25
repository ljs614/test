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
	private String attId;
	private String table;
	public Attraction selectAttraction(String attId) {
			Connection conn=getConnection();
		Attraction a=dao.selectAttraction(conn,attId);
		close(conn);
		city=a.getCity();
		this.attId=a.getAttractionId();
		switch(attId.substring(0,1)) {
		case "at": table="tt_attraction";break;
		case "ac": table="tt_activity";break;
		case "fe": table="tt_festival";break;
		}
		return a;
		
	}
	
	public List<Attraction> recommendAttraction(String attId){
		Connection conn=getConnection();
		List<Attraction> list=dao.recommendAttraction(conn,city,attId);
		close(conn);
		return list;
	}
	
	public int clipCount() {
		System.out.println(attId+"askllklkj"+table);
		Connection conn=getConnection();
		int result=dao.clipCount(conn,attId,table);
		close(conn);
		return result;
	}
	
	public int clipCountMinus() {
		System.out.println(attId+"agsdgsdg"+table);
		Connection conn=getConnection();
		int result=dao.clipCountMinus(conn,attId,table);
		close(conn);
		return result;
	}
	
}
