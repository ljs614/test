package triptaxi.board.dao;

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

import triptaxi.board.model.vo.Board;
import triptaxi.board.model.vo.BoardComment;

public class BoardDao {
	private Properties prop=new Properties();
	public BoardDao() {
		String path=BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	public List<Board> selectBoardList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardList");
		List<Board> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setQnaNo(rs.getInt("qna_no"));
				b.setQnaCategory(rs.getString("qna_category"));
				b.setQnaTitle(rs.getString("qna_title"));
				b.setQnaWriter(rs.getString("qna_writer"));
				b.setQnaContent(rs.getString("qna_content"));
				b.setOriFileName(rs.getString("orifilename"));
				b.setReNameFileName(rs.getString("renamefilename"));
				b.setQnaDate(rs.getDate("qna_date"));
				b.setQnaReadCount(rs.getInt("qna_readcount"));
				list.add(b);
				System.out.println(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public Board selectBoard(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Board b=null;
		String sql=prop.getProperty("selectBoard");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b=new Board();
				b.setQnaNo(rs.getInt("qna_no"));
				b.setQnaCategory(rs.getString("qna_category"));
				b.setQnaTitle(rs.getString("qna_title"));
				b.setQnaWriter(rs.getString("qna_writer"));
				b.setQnaContent(rs.getString("qna_content"));
				b.setOriFileName(rs.getString("orifilename"));
				b.setReNameFileName(rs.getString("renamefilename"));
				b.setQnaDate(rs.getDate("qna_date"));
				b.setQnaReadCount(rs.getInt("qna_readcount"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
		
	}
	
	public int updateReadCount(Connection conn,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateReadCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertBoard(Connection conn,Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertBoard");
		System.out.println("dd"+b.getQnaCategory());
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getQnaCategory());
			pstmt.setString(2, b.getQnaTitle());
			pstmt.setString(3, b.getQnaContent());
			pstmt.setString(4, b.getQnaWriter());
			pstmt.setString(5, b.getOriFileName());
			pstmt.setString(6, b.getReNameFileName());
			
			result=pstmt.executeUpdate();
			System.out.println("dao:"+result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}return result;
		
		
	}
	
	public int selectBoardNo(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select tt_board_qna_seq.currval from dual";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			
		}return result;
	}
	
	public int insertBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getBoardCommentLevel());
			pstmt.setString(2, bc.getBoardCommentWriter());
			pstmt.setString(3, bc.getBoardCommentContent());
			pstmt.setInt(4, bc.getBoardRef());
			//int 자료형에 자료가 없어 null값을 넣을때는 
			pstmt.setString(5, bc.getBoardCommentRef()==0?null:String.valueOf(bc.getBoardCommentRef()));
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	public List<BoardComment> selectBoardComment(Connection conn, int no){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<BoardComment> list=new ArrayList();
			String sql=prop.getProperty("selectBoardComment");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					BoardComment bc=new BoardComment();
					bc.setBoardCommentNo(rs.getInt("board_comment_no"));
					bc.setBoardCommentLevel(rs.getInt("board_comment_level"));
					bc.setBoardCommentWriter(rs.getString("board_comment_writer"));
					bc.setBoardCommentContent(rs.getString("board_comment_content"));
					bc.setBoardRef(rs.getInt("board_ref"));
					bc.setBoardCommentRef(rs.getInt("board_comment_ref"));
					bc.setBoardCommentDate(rs.getDate("board_comment_date"));
					list.add(bc);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		
		
	}
	
	public int deleteComment(Connection conn,int boardRef) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardRef);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
}
