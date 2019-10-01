package triptaxi.city.model.dao;

import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.triptaxi.attraction.model.vo.Attraction;

import triptaxi.city.model.vo.City;
import triptaxi.planner.model.vo.CityList;
import triptaxi.planner.model.vo.Planner;

public class CityDao {
	
	private Properties prop=new Properties();
	
	public CityDao() {
		String path=CityDao.class.getResource("/sql/city/city-query.properties").getPath();
		try {			
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<City> selectCityList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<City> list=new ArrayList();
		String sql=prop.getProperty("selectNoticeList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				City c=new City();
				c.setCityName(rs.getString("city_name"));
				c.setCityEng(rs.getString("city_eng"));
				c.setNationName(rs.getString("nation_name"));
				c.setLatitude(rs.getInt("latitude"));
				c.setLongitude(rs.getInt("longitude"));
				c.setImageUrl(rs.getString("image_url"));
				c.setCityVideoUrl(rs.getString("cityvideo_url"));
				c.setPeakSeason(rs.getString("peak_season"));
				c.setVolt(rs.getString("volt"));
				c.setTimeDiffence(rs.getInt("time_difference"));
				c.setFlightTime(rs.getString("flight_time"));
				c.setCityIntro(rs.getString("city_intro"));
				c.setClipCount(rs.getInt("clip_count"));
				list.add(c);				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}		
	
	public List<CityList> selectAllCityList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectAllCityList");
		List<CityList> list = new ArrayList<CityList>();
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            CityList c = new CityList();
	            c.setContinentName(rs.getString("continent_name"));
	            c.setNationName(rs.getString("nation_name"));
	            c.setCityName(rs.getString("city_name"));
	            c.setCityEng(rs.getString("city_eng"));
	            c.setLatitude(rs.getDouble("latitude"));
	            c.setLongitude(rs.getDouble("longitude"));
	            c.setFlagUrl(rs.getString("flag_url"));
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
	
	public City cityChoice(Connection conn, String cityName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		City c=null;
		String sql=prop.getProperty("cityChoice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				c=new City();
				c.setCityName(rs.getString("city_name"));
				c.setCityEng(rs.getString("city_eng"));
				c.setNationName(rs.getString("nation_name"));
				c.setLatitude(rs.getInt("latitude"));
				c.setLongitude(rs.getInt("longitude"));
				c.setImageUrl(rs.getString("image_url"));
				c.setCityVideoUrl(rs.getString("cityvideo_url"));
				c.setPeakSeason(rs.getString("peak_season"));
				c.setVolt(rs.getString("volt"));
				c.setTimeDiffence(rs.getInt("time_difference"));
				c.setFlightTime(rs.getString("flight_time"));
				c.setCityIntro(rs.getString("city_intro"));
				c.setClipCount(rs.getInt("clip_count"));
				c.setErCode(rs.getString("er_code"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
	}
	
	public List<Planner> cityPlanList(Connection conn, String cityName){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Planner> list=new ArrayList();
		String sql=prop.getProperty("cityPlanList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Planner p=new Planner();
				p.setPlannerId(rs.getString("planner_id"));
				p.setPlannerName(rs.getString("planner_name"));
				p.setPlannerDate(rs.getDate("planner_date"));
				p.setPlannerWriter(rs.getString("planner_writer"));
				p.setPlannerTheme(rs.getString("planner_theme"));
				p.setPlannerLike(rs.getInt("planner_like"));
				p.setPlannerCount(rs.getInt("planner_count"));
				p.setPlannerPublic(rs.getString("planner_public").charAt(0));
				p.setPlannerWritedate(rs.getDate("planner_writedate"));
				p.setPlannerCoverimg(rs.getString("planner_coverimg"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Attraction> attractionList(Connection conn, String cityName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlField=prop.getProperty("attractionListField");
		String sqlFrom=prop.getProperty("attractionListFrom");
		String sqlWhere=prop.getProperty("attractionListWhere");
//		
//		if(!cityName.equals("")) {
//			sqlWhere += "and city_name = " + cityName;
//		}
//		
		String sql = sqlField + sqlFrom + sqlWhere;

		List<Attraction> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Attraction a=new Attraction();
				a.setAttractionId(rs.getString("attraction_id"));
				a.setAttractionName(rs.getString("attraction_name"));
				a.setAttractionEng(rs.getString("attraction_eng"));
				a.setCity(rs.getString("city"));
				a.setAttractionLat(rs.getDouble("attraction_lat"));
				a.setAttractionLng(rs.getDouble("attraction_lng"));
				a.setImageUrl(rs.getString("image_url"));
				a.setAttractionComment(rs.getString("attraction_comment"));
				a.setClipCount(rs.getInt("clip_count"));
				a.setReviewScore(rs.getDouble("review_score"));
				a.setCategory(rs.getString("category"));
				list.add(a);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Attraction> activityList(Connection conn, String cityName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("activityList");
		List<Attraction> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Attraction a=new Attraction();
				a.setAttractionId(rs.getString("activity_id"));
				a.setAttractionName(rs.getString("activity_name"));
				a.setAttractionEng(rs.getString("activity_eng"));
				a.setCity(rs.getString("city"));
				a.setAttractionLat(rs.getDouble("activity_lat"));
				a.setAttractionLng(rs.getDouble("activity_lng"));
				a.setImageUrl(rs.getString("image_url"));
				a.setAttractionComment(rs.getString("activity_comment"));
				a.setClipCount(rs.getInt("clip_count"));
				a.setReviewScore(rs.getDouble("review_score"));
				a.setCategory(rs.getString("category"));
				list.add(a);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Attraction> festivalList(Connection conn, String cityName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("festivalList");
		List<Attraction> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Attraction a=new Attraction();
				a.setAttractionId(rs.getString("festival_id"));
				a.setAttractionName(rs.getString("festival_name"));
				a.setAttractionEng(rs.getString("festival_eng"));
				a.setCity(rs.getString("city"));
				a.setAttractionLat(rs.getDouble("festival_lat"));
				a.setAttractionLng(rs.getDouble("festival_lng"));
				a.setImageUrl(rs.getString("image_url"));
				a.setAttractionComment(rs.getString("festival_comment"));
				a.setClipCount(rs.getInt("clip_count"));
				a.setReviewScore(rs.getDouble("review_score"));
				a.setCategory(rs.getString("category"));
				list.add(a);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<City> matchingCity(Connection conn,String ct,String wt){
		Statement stmt=null;
		ResultSet rs=null;
		List<City> list=new ArrayList();
		System.out.println(ct+"이거야이거"+wt);
		String sql = "select city, city_eng from (SELECT city, rank() over (order by sums desc) as rank FROM (SELECT sum(a."+wt+") as sums, b.city FROM TT_THEME a join (SELECT * FROM TT_ATTRACTION UNION SELECT * FROM TT_ACTIVITY UNION SELECT * FROM TT_FESTIVAL) b on(a.tour_id=b.attraction_id) WHERE TOUR_ID IN (SELECT ATTRACTION_ID AS TOUR_ID FROM (SELECT * FROM TT_ATTRACTION UNION SELECT * FROM TT_ACTIVITY UNION SELECT * FROM TT_FESTIVAL) WHERE CITY IN (SELECT A.CITY_NAME FROM TT_CITY A JOIN TT_NATION B ON (A.NATION_NAME=B.NATION_NAME) WHERE CONTINENT_NAME IN('"+ct+"'))) group by b.city)) join tt_city on(city_name=city) where rank=1";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				City c=new City();
				c.setCityName(rs.getString(1));
				c.setCityEng(rs.getString(2));
				list.add(c);				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return list;
	}
	
	public int countUser(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("countUser");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("countUser");
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int countPlanner(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("countPlanner");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("countPlanner");
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int countAttraction(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("countattraction");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("totalatt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
//	public String getTodayCity(Connection conn) {
//		PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = prop.getProperty("selectTodayCityOne");
//			String resultCity = "";
//		      try {
//		         pstmt = conn.prepareStatement(sql);
//		         rs = pstmt.executeQuery();
//		         while(rs.next()) {
//		        	 resultCity = rs.getString("city");
//		         }
//		      }catch(SQLException e) {
//		         e.printStackTrace();
//		      }finally {
//		         close(rs);
//		         close(pstmt);
//		      }
//		      return resultCity;
//	}
//
//	public String insertGetTodayCity(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = prop.getProperty("insertTodayCity");
//	      try {
//	         pstmt = conn.prepareStatement(sql);
//	         pstmt.executeUpdate();
//	      }catch(SQLException e) {
//	         e.printStackTrace();
//	      }finally {
//	         close(rs);
//	         close(pstmt);
//	      }
//	      return getTodayCity(conn);
//	}
	
}


















