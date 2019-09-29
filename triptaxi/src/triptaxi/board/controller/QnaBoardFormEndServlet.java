package triptaxi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.board.model.vo.Board;
import triptaxi.board.service.BoardService;

/**
 * Servlet implementation class QnaBoardFormEndServlet
 */
@WebServlet("/board/boardFormEnd")
public class QnaBoardFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");

		
		Board b=new Board();
		b.setQnaTitle(title);
		b.setQnaWriter(writer);
		b.setQnaContent(content);

		int result=new BoardService().insertBoard(b);
		
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		if(result>0) {
			loc="/board/boardView?no="+result;
			msg="게시글 등록성공";
		}else {
			loc="/board/Qnaboardform";
			msg="게시글 등록실패";
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
