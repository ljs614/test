package triptaxi.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.review.model.service.ReviewService;
import triptaxi.review.model.vo.Review;

/**
 * Servlet implementation class ReviewBoard
 */
@WebServlet("/board/reviewList")
public class ReviewBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=5;
		ReviewService service = new ReviewService();
		int totalData = service.countReview();
		List<Review> list = service.selectReviewList(cPage, numPerPage);
	
		String pageBar ="";
		int totalPage = (int)Math.ceil((double)totalData / numPerPage);
		int pageBarSize = 10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1; 
		int pageEnd = pageNo + pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else { //11,21,31,...
			pageBar+="<a href='"+request.getContextPath()+"/board/reviewList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span> "+pageNo+" </span>";
			}else {
				pageBar+=" <a href='"+request.getContextPath()+"/board/reviewList?cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> [다음] </span>";
		}else {
			pageBar+=" <a href='"+request.getContextPath()+"/board/reviewList?cPage="+pageNo+"'>[다음] </a>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/reviewboard.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
