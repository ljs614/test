package triptaxi.attraction.dao;
import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.triptaxi.attraction.model.vo.Attraction;
public class AttractionDao {
	private Properties prop=new Properties();
	public AttractionDao() {
		String path=AttractionDao.class.getResource("/sql/attraction/attraction-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Attraction selectAttraction(Connection conn,String attId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectAttraction");
		Attraction a=new Attraction();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, attId);
			pstmt.setString(2, attId);
			pstmt.setString(3, attId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
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
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return a;
	}
	
	public List<Attraction> recommendAttraction(Connection conn,String city,String attId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("recommendAttraction");
		List<Attraction> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, city);
			pstmt.setString(2, attId);
			pstmt.setString(3, city);
			pstmt.setString(4, attId);
			pstmt.setString(5, city);
			pstmt.setString(6, attId);
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
	
	public int clipCount(Connection conn,int clip,String attId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("clipCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			result=pstmt.executeUpdate();
			
				
				
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
