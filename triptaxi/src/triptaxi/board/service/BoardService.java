package triptaxi.board.service;

import static triptaxi.common.template.JDBCTemplate.close;
import static triptaxi.common.template.JDBCTemplate.commit;
import static triptaxi.common.template.JDBCTemplate.getConnection;
import static triptaxi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import triptaxi.board.dao.BoardDao;
import triptaxi.board.model.vo.Board;
import triptaxi.board.model.vo.BoardComment;

public class BoardService {

	private BoardDao dao=new BoardDao();
	

	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	public List<Board> selectBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Board> list=dao.selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
		
	}
	public Board selectBoard(int no, boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.selectBoard(conn,no);
		if(!hasRead&&b!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) {commit(conn);}
			else {rollback(conn);
			}
		}return b;
	}
		
	
	public int insertBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn,b);
		if(result>0) {
			result=dao.selectBoardNo(conn);
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public int insertBoardComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertBoardComment(conn, bc);
		System.out.println(bc);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public List<BoardComment> selectBoardComment(int no){
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectBoardComment(conn,no);
		close(conn);
		return list;
	}
	
	public int deleteComment(int boardRef) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn,boardRef);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	
	
	
}
