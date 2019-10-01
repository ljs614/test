package triptaxi.user.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import triptaxi.planner.model.vo.Planner;
import triptaxi.planner.model.vo.Tour;
import triptaxi.user.model.vo.User;


import static triptaxi.common.template.JDBCTemplate.close;


	public class UserDao {
		private Properties prop=new Properties();

	
	public UserDao() {
		String path=UserDao.class.getResource("/sql/user/user-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public User selectId(Connection conn,String id, String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User u=null;
		String sql=prop.getProperty("selectId");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				u=new User();
				u.setUserId(rs.getString("user_Id"));
				u.setPassword(rs.getString("user_pw"));
				u.setUserName(rs.getString("user_Name"));
				u.setGender(rs.getString("gender").charAt(0));
				u.setBirthday(rs.getString("birthday"));
				u.setEmail(rs.getString("user_Email"));
				u.setPhone("phone");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return u;		
	}
			
	
	public int insertUser(Connection conn,User u) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertUser");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, String.valueOf(u.getGender()));
 			pstmt.setString(5, u.getBirthday());
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7, u.getPhone());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public User selectOne(Connection conn,String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User u=null;
		String sql=prop.getProperty("selectOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				u=new User();
				u.setUserId(rs.getString("user_Id"));
				u.setPassword(rs.getString("user_pw"));
				u.setUserName(rs.getString("user_Name"));
				u.setGender(rs.getString("gender").charAt(0));
				u.setBirthday(rs.getString("birthday"));
				u.setEmail(rs.getString("user_Email"));
				u.setPhone("phone");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return u;
	}
	
	public int selectCountPlanner(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountPlanner");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectCountPlannerIng(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountPlannerIng");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectCountPlannerLike(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountPlannerLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Planner> selectPlanner(Connection conn, String userId, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Planner> list=new ArrayList<Planner>();
		String sql=prop.getProperty("selectPlanner");
		Planner planner=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				planner=new Planner();
				planner.setPlannerId(rs.getString("planner_id"));
				planner.setPlannerName(rs.getString("planner_name"));
				planner.setPlannerDate(rs.getDate("planner_date"));
				planner.setPlannerWriter(rs.getString("user_name"));
				planner.setPlannerTheme(rs.getString("planner_theme"));
				planner.setPlannerLike(rs.getInt("planner_like"));
				planner.setPlannerCount(rs.getInt("planner_count"));
				planner.setPlannerPublic(rs.getString("planner_public").charAt(0));
				planner.setPlannerWritedate(rs.getDate("planner_writedate"));
				planner.setPlannerCoverimg(rs.getString("planner_coverimg"));
				list.add(planner);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Planner> selectPlannerIng(Connection conn, String userId, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Planner> list=new ArrayList<Planner>();
		String sql=prop.getProperty("selectPlannerIng");
		Planner planner=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				planner=new Planner();
				planner.setPlannerId(rs.getString("planner_id"));
				planner.setPlannerName(rs.getString("planner_name"));
				planner.setPlannerDate(rs.getDate("planner_date"));
				planner.setPlannerWriter(rs.getString("user_name"));
				planner.setPlannerTheme(rs.getString("planner_theme"));
				planner.setPlannerLike(rs.getInt("planner_like"));
				planner.setPlannerCount(rs.getInt("planner_count"));
				planner.setPlannerPublic(rs.getString("planner_public").charAt(0));
				planner.setPlannerWritedate(rs.getDate("planner_writedate"));
				planner.setPlannerCoverimg(rs.getString("planner_coverimg"));
				list.add(planner);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Planner> selectPlannerLike(Connection conn, String userId, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Planner> list=new ArrayList<Planner>();
		String sql=prop.getProperty("selectPlannerLike");
		Planner planner=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				planner=new Planner();
				planner.setPlannerId(rs.getString("planner_id"));
				planner.setPlannerName(rs.getString("planner_name"));
				planner.setPlannerDate(rs.getDate("planner_date"));
				planner.setPlannerWriter(rs.getString("user_name"));
				planner.setPlannerTheme(rs.getString("planner_theme"));
				planner.setPlannerLike(rs.getInt("planner_like"));
				planner.setPlannerCount(rs.getInt("planner_count"));
				planner.setPlannerPublic(rs.getString("planner_public").charAt(0));
				planner.setPlannerWritedate(rs.getDate("planner_writedate"));
				planner.setPlannerCoverimg(rs.getString("planner_coverimg"));
				list.add(planner);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertLike(Connection conn, String userId, String plannerId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setString(2,  userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteLike(Connection conn, String userId, String plannerId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setString(2,  userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public String selectLike(Connection conn, String userId, String plannerId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="false";
		String sql=prop.getProperty("selectLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, plannerId);
			pstmt.setString(2, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result="true";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
	
	
	public List<Tour> selectClipboard(Connection conn, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Tour> list=new ArrayList<Tour>();
		String sql=prop.getProperty("selectClipboard");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Tour tour=new Tour();
				tour.setTourId(rs.getString(1));
				tour.setTourName(rs.getString(2));
				tour.setTourEng(rs.getString(3));
				tour.setCity(rs.getString(4));
				tour.setImageUrl(rs.getString(7));
				tour.setClipCount(rs.getInt(9));
				tour.setReviewScore(rs.getInt(10));
				tour.setCategory(rs.getString(11));
				list.add(tour);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertClip(Connection conn, String userId, String tourId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertClip");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tourId);
			pstmt.setString(2,  userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteClip(Connection conn, String userId, String tourId) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteClip");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tourId);
			pstmt.setString(2,  userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public String selectClip(Connection conn, String userId, String tourId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="false";
		String sql=prop.getProperty("selectClip");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tourId);
			pstmt.setString(2, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result="true";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
	
	
}
