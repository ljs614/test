package triptaxi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.board.model.vo.BoardComment;
import triptaxi.board.service.BoardService;

/**
 * Servlet implementation class QnaBoardInsertController
 */
@WebServlet("/board/insertComment")
public class QnaBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		int level=Integer.parseInt(request.getParameter("boardCommentLevel"));
		int boardCommentRef=Integer.parseInt(request.getParameter("boardCommentRef"));
		String writer=request.getParameter("boardWriter");
		String content=request.getParameter("content");
		BoardComment bc=new BoardComment(0,level,writer,content,boardRef,boardCommentRef,null);
		
		int result=new BoardService().insertBoardComment(bc);
		String msg="";
		String loc="/board/boardView?no="+boardRef;
		String view="/views/common/msg.jsp";
		if(result>0) {
			msg="댓글등록성공!!";
		}else {
			msg="댓글 등록 실패!!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
