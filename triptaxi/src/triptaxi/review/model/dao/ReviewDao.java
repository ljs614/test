package triptaxi.review.model.dao;

import static triptaxi.common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import triptaxi.city.model.dao.CityDao;
import triptaxi.review.model.vo.Review;

public class ReviewDao {
	
private Properties prop=new Properties();
	
	public ReviewDao() {
		String path=CityDao.class.getResource("/sql/review/review-query.properties").getPath();
		try {			
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Review> selectReviewList(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList();
		String sql=prop.getProperty("reviewList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setReviewNo(rs.getInt("review_no"));
				r.setReviewCategory(rs.getString("review_category"));
				r.setReviewTitle(rs.getString("review_title"));
				r.setReviewContent(rs.getString("review_content"));
				r.setReviewWriter(rs.getString("review_writer"));
				r.setReviewFilePathOriginal(rs.getString("review_filepath_original"));
				r.setReviewFilePathRename(rs.getString("review_filepath_rename"));
				r.setReviewDate(rs.getDate("review_date"));
				r.setReviewReadCount(rs.getInt("review_readcount"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int countReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("countReview");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("reviewCount");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int insertReviewWrite(Connection conn,Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("reviewWrite");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReviewCategory());
			pstmt.setString(2, r.getReviewTitle());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setString(4, r.getReviewWriter());
			pstmt.setString(5, r.getReviewFilePathOriginal());
			pstmt.setString(6, r.getReviewFilePathRename());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Review reviewView(Connection conn, int reviewNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review r=null;
		String sql=prop.getProperty("reviewView");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Review();
				r.setReviewNo(rs.getInt("review_no"));
				r.setReviewCategory(rs.getString("review_category"));
				r.setReviewTitle(rs.getString("review_title"));
				r.setReviewContent(rs.getString("review_content"));
				r.setReviewWriter(rs.getString("review_writer"));
				r.setReviewFilePathOriginal(rs.getString("review_filepath_original"));
				r.setReviewFilePathRename(rs.getString("review_filepath_rename"));
				r.setReviewDate(rs.getDate("review_date"));
				r.setReviewReadCount(rs.getInt("review_readcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return r;
	}
	
	public Review modifyReview(Connection conn,int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		Review r=null;
		String sql = prop.getProperty("modifyReview");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Review();
				r.setReviewNo(rs.getInt("review_no"));
				r.setReviewCategory(rs.getString("review_category"));
				r.setReviewTitle(rs.getString("review_title"));
				r.setReviewContent(rs.getString("review_content"));
				r.setReviewWriter(rs.getString("review_writer"));
				r.setReviewFilePathOriginal(rs.getString("review_filepath_original"));
				r.setReviewFilePathRename(rs.getString("review_filepath_rename"));
				r.setReviewDate(rs.getDate("review_date"));
				r.setReviewReadCount(rs.getInt("review_readcount"));
		}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return r;
	}
		
		
}


