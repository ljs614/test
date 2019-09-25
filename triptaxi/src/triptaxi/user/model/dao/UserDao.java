package triptaxi.user.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import triptaxi.user.model.vo.User;

import static triptaxi.common.template.JDBCTemplate.getConnection;
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
	
	
}