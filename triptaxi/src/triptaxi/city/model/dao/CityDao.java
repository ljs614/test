package triptaxi.city.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import triptaxi.city.model.vo.City;
import static triptaxi.common.template.JDBCTemplate.close;

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

}
