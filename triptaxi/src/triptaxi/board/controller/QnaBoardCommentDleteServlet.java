package triptaxi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.board.service.BoardService;

/**
 * Servlet implementation class QnaBoardCommentDleteServlet
 */
@WebServlet("/board/boardCommentDelete")
public class QnaBoardCommentDleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardCommentDleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int boardCommentRef=Integer.parseInt(request.getParameter("boardCommentRef"));
		System.out.println("pp"+boardCommentRef);
		
		int result=new BoardService().deleteComment(boardCommentRef);
		String msg="";
		String loc="/board/boardView?no="+boardCommentRef;
		if(result>0) {
			msg="댓글 삭제 완료";
		}else {
			msg="댓글 삭제 실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
