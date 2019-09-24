package triptaxi.planner.model.dao;

import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;

public class PlannerDao {
	
	private Properties prop=new Properties();
	
	public PlannerDao() {
		String path=PlannerDao.class.getResource("/sql/planner/planner-query.properties").getPath();
		try {			
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Planner selectPlanner(Connection conn, String userId, String plannerId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Planner p=null;
		String sql=prop.getProperty("selectPlanner");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, plannerId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p=new Planner();
				p.setPlannerId(rs.getString("planner_id"));
				p.setPlannerName(rs.getString("planner_name"));
				p.setPlannerWriter(userId);
				p.setPlannerDate(rs.getDate("planner_date"));
				p.setPlannerPlan(rs.getString("planner_plan"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
		
	}
	
	public Attraction selectAttraction(Connection conn, String attraction_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectAttraction");
		Attraction att=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, attraction_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				att=new Attraction();
				att.setAttractionId(rs.getString("attraction_id"));
				att.setAttractionName(rs.getString("attraction_name"));
				att.setCity(rs.getString("city_name"));
				att.setCategory(rs.getString("attraction_category"));
				att.setAttractionLat(rs.getDouble("attraction_lat"));
				att.setAttractionLng(rs.getDouble("attraction_lng"));
				att.setImageUrl(rs.getString("thumnail_url"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return att;
	}
	
	public List<CityList> selectCityList(Connection conn, String continentName) {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = prop.getProperty("selectCityList");
	      List<CityList> list = new ArrayList<CityList>();
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, continentName);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            CityList c = new CityList();
	            c.setContinentName(rs.getString("continent_name"));
	            c.setNationName(rs.getString("nation_name"));
	            c.setCityName(rs.getString("city_name"));
	            c.setLatitude(rs.getDouble("latitude"));
	            c.setLongitude(rs.getDouble("longitude"));
	            
	            list.add(c);
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }
	      
	      return list;
	   }
	
	public int insertPlanner(Connection conn, String plannerName, String plannerDate) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertPlanner");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, plannerName);
			pstmt.setString(2, plannerDate);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public String selectPlannerId(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String result = null;
		String sql = "select seq_tt_planner.currval from dual";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}

		return result;
	}
	
	public int insertPlannerDay(Connection conn, int dayNo, String cityName, String plannerId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertPlannerDay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dayNo);
			pstmt.setString(2, cityName);
			pstmt.setString(3, plannerId);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
