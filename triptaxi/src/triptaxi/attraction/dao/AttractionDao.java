package triptaxi.attraction.dao;
import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.triptaxi.attraction.model.vo.Attraction;
import com.triptaxi.attraction.model.vo.TourReview;
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
	
	public int clipCount(Connection conn,String attId,String table) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("clipCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, table);
			pstmt.setString(2, table);
			pstmt.setString(3, attId);
			pstmt.setString(4, attId);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int clipCountMinus(Connection conn,String attId,String table) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("clipCountMinus");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, table);
			pstmt.setString(2, table);
			pstmt.setString(3, attId);
			pstmt.setString(4, attId);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int writeReview(Connection conn,TourReview tr) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("writeReview");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tr.getTourReviewWriter());
			pstmt.setString(2, tr.getTourReviewContent());
			pstmt.setString(3, tr.getTourId());
			pstmt.setInt(4, tr.getTourReviewScore());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	
	public List<TourReview> reviewList(Connection conn,String attId, int reviewmore) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("reviewList");
		List<TourReview> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, attId);
			pstmt.setInt(2, reviewmore);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TourReview tr=new TourReview();
				tr.setTourReviewNo(rs.getInt("tour_review_no"));
				tr.setTourReviewWriter(rs.getString("tour_review_writer"));
				tr.setTourReviewContent(rs.getString("tour_review_content"));
				tr.setTourId(rs.getString("tour_id"));
				tr.setTourReviewScore(rs.getInt("tour_review_score"));
				tr.setTourReviewDate(rs.getDate("tour_review_date"));
				list.add(tr);

			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Attraction> cityAttraction(Connection conn,String cityName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("cityAttraction");
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
	
	public int scoreAvg(Connection conn,String tourId, String table) {
		Statement stmt=null;
		System.out.println("id:"+tourId);
		int result=0;
		String sql="update "+table+" set review_Score=(select avg(tour_review_score) from tt_tour_review where tour_id='"+tourId+"') where "+table.split("_")[1]+"_id='"+tourId+"'";
		System.out.println(sql);
		try {
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result;
	}
	
}
