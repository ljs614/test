package triptaxi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import triptaxi.board.model.vo.Board;
import triptaxi.board.service.BoardService;
import triptaxi.common.policy.MyFileRenamePolicy;

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
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("loc", "/board/boardForm");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String saveDir=getServletContext().getRealPath("/");
		saveDir+="/upload/board";
		
		int maxSize=1024*1024*1024;//1gb
		
		MultipartRequest mr=new MultipartRequest(request,saveDir,maxSize,"UTF-8",new MyFileRenamePolicy());
		
		
		System.out.println(saveDir);

		String title=mr.getParameter("title");
		String category=mr.getParameter("category");
		String writer=mr.getParameter("writer");
		String content=mr.getParameter("content");
		String reName=mr.getFilesystemName("up_file");
		String oriName=mr.getOriginalFileName("up_file");

		
		Board b=new Board();
		b.setQnaTitle(title);
		b.setQnaCategory(category);
		b.setQnaWriter(writer);
		b.setQnaContent(content);
		b.setReNameFileName(reName);
		b.setOriFileName(oriName);

		int result=new BoardService().insertBoard(b);
		System.out.println("service:"+result);
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		if(result>0) {
			loc="/board/boardView?no="+result;
			msg="게시글 등록성공";
		}else {
			loc="/board/boardForm";
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
