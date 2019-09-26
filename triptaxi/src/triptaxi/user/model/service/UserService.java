package triptaxi.user.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import triptaxi.planner.model.vo.Tour;
import triptaxi.user.model.dao.UserDao;
import triptaxi.user.model.vo.User;

public class UserService {
	private UserDao dao=new UserDao();
	
	public User selectOne(String userId) {
		Connection conn=getConnection();
		 User u=dao.selectOne(conn,userId);
		close(conn);
		return u;
	}

	public User selectId(String id, String pw) {
		Connection conn=getConnection();
		User u=dao.selectId(conn,id,pw);
		close(conn);
		return u;
		
	}
	public int insertUser(User u) {
		Connection conn=getConnection();
		int result=dao.insertUser(conn, u);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public List<Tour> getClipboard(String userId){
		Connection conn=getConnection();
		List<Tour> list=dao.getClipboard(conn, userId);
		close(conn);
		return list;
	}
	
	public void insertLike(String userId, String plannerId) {
		Connection conn=getConnection();
		int result=dao.insertLike(conn, userId, plannerId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}
	
	public void deleteLike(String userId, String plannerId) {
		Connection conn=getConnection();
		int result=dao.deleteLike(conn, userId, plannerId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}
	
	public String selectLike(String userId, String plannerId) {
		Connection conn=getConnection();
		String result=dao.selectLike(conn, userId, plannerId);
		close(conn);
		return result;
	}

}
