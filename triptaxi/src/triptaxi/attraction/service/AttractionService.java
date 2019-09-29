package triptaxi.attraction.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.triptaxi.attraction.model.vo.Attraction;
import com.triptaxi.attraction.model.vo.TourReview;

import triptaxi.attraction.dao.AttractionDao;




public class AttractionService {
	private AttractionDao dao=new AttractionDao();
	private String city;
	private String attId;
	private String table;
	private int score;
	
	public Attraction selectAttraction(String attId) {
		Connection conn=getConnection();
		Attraction a=dao.selectAttraction(conn,attId);
		close(conn);
		city=a.getCity();
		this.attId=a.getAttractionId();
		
		if(attId.substring(0,2).equals("at")) {
		table="tt_attraction";}
		else if(attId.substring(0,2).equals("ac")){
			table="tt_activity";
		}else {
		table="tt_festival";
			}
		System.out.println(table);
		return a;

	}
	
	public List<Attraction> recommendAttraction(String attId){
		Connection conn=getConnection();
		List<Attraction> list=dao.recommendAttraction(conn,city,attId);
		close(conn);
		return list;
		
	}
	
	public int clipCount() {
		
		Connection conn=getConnection();
		int result=dao.clipCount(conn,attId,table);
		close(conn);
		return result;
	}
	
	public int clipCountMinus() {
		Connection conn=getConnection();
		int result=dao.clipCountMinus(conn,attId,table);
		close(conn);
		return result;
	}
	
	public int writeReview(TourReview tr) {
		Connection conn=getConnection();
		int result=dao.writeReview(conn,tr);
		close(conn);
		return result;
		
		
	}
	
	public List<TourReview> reviewList(String attId,int reviewmore){
		Connection conn=getConnection();
		List<TourReview> list=dao.reviewList(conn,attId,reviewmore);
		close(conn);
		return list;
		

	}
	
	public List<Attraction> cityAttraction(String cityName){
		Connection conn=getConnection();
		List<Attraction> list=dao.cityAttraction(conn,cityName);
		close(conn);
		return list;
	}
	
	public int scoreAvg(String attId) {
		Connection conn=getConnection();
		int result=dao.scoreAvg(conn,attId,table);
		close(conn);
		System.out.println(table);
		return result;
	}
	
	
}
