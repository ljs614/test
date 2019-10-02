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
 * Servlet implementation class QnaBoardUdateServlet
 */
@WebServlet("/board/boardUpdate")
public class QnaBoardUdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardUdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int boardNo=Integer.parseInt(request.getParameter("boardNo"));
			int cPage=Integer.parseInt(request.getParameter("cPage"));
			Board b= new BoardService().updateBoard(boardNo);
			request.setAttribute("board", b);
			request.setAttribute("cPage", cPage);
			request.getRequestDispatcher("/views/board/QNAboardUpdate.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
