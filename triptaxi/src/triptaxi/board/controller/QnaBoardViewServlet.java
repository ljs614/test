package triptaxi.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.board.model.vo.Board;
import triptaxi.board.model.vo.BoardComment;
import triptaxi.board.service.BoardService;

/**
 * Servlet implementation class QnaBoareViewServlet
 */
@WebServlet("/board/boardView")
public class QnaBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaBoardViewServlet() {

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		//쿠키값 확인하기
		Cookie[] cookies=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;//읽은지 안읽은지구분자
		if(cookies!=null) {
			for(Cookie c: cookies) {
				String name=c.getName();//key
				String value=c.getValue();//value
				if("boardCookie".equals(name)) {
					boardCookieVal=value;//이전값 보관
					if(value.contains("*"+no+"*")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		//안읽었을때 조회수를 추가하고 cookie에 현재 boardNo 기록
		if(!hasRead) {
			Cookie c=new Cookie("boardCookie",boardCookieVal+"*"+no+"*");
			c.setMaxAge(-1);//브라우저가 close | 로그아웃했을때 삭제
			response.addCookie(c);
		}
		
		Board b=new BoardService().selectBoard(no,hasRead);
		List<BoardComment> list=new BoardService().selectBoardComment(no);
		
		request.setAttribute("board",b);
		request.setAttribute("cPage",cPage);
		request.setAttribute("comments",list);
		request.getRequestDispatcher("/views/board/QNAboardview.jsp").forward(request, response);	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

}
