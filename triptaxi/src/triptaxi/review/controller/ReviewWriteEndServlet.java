package triptaxi.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import triptaxi.common.policy.MyFileRenamePolicy;
import triptaxi.review.model.service.ReviewService;
import triptaxi.review.model.vo.Review;

/**
 * Servlet implementation class ReviewWriteEndServlet
 */
@WebServlet("/review/writeEnd")
public class ReviewWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "글 작성 실패");
			request.setAttribute("loc", "/review/reviewList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"/reviewfic";
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(
									request,
									saveDir,
									maxSize,
									"UTF-8",
									new MyFileRenamePolicy());
		String title = mr.getParameter("review_title");
		String writer = mr.getParameter("review_writer");
		String originalFilename = mr.getOriginalFileName("review_upfile");
		String renamedFilename = mr.getFilesystemName("review_upfile");
		String content = mr.getParameter("review_content");
		String category = mr.getParameter("review_category");
		
		Review r = new Review();
		r.setReviewTitle(title);
		r.setReviewWriter(writer);
		r.setReviewFilePathOriginal(originalFilename);
		r.setReviewFilePathRename(renamedFilename);
		r.setReviewContent(content);
		r.setReviewCategory(category);
		
		int result=new ReviewService().insertReviewWrite(r);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg="글작성 성공";
			loc="/review/reviewView?reviewNo="+result;
		}else {
			msg="글작성 실패";
			loc="/board/reviewList";
		}
		
		request.setAttribute("msg",msg);
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
