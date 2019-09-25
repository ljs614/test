package triptaxi.user.model.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;

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

}
