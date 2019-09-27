package triptaxi.attraction.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.triptaxi.attraction.model.vo.TourReview;

import triptaxi.attraction.service.AttractionService;

/**
 * Servlet implementation class AttractionReaviewWrite
 */
@WebServlet("/attraction/reviewWrite")
public class AttractionReaviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttractionReaviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int star=Integer.parseInt(request.getParameter("star-input"));
		String reviewComment=request.getParameter("review-comment");
		String userId=request.getParameter("user-id");
		String tourId=request.getParameter("tour-id");
		String userId2= request.getParameter("userId");
		
		TourReview tr=new TourReview();
		tr.setTourId(tourId);
		tr.setTourReviewContent(reviewComment);
		tr.setTourReviewScore(star);
		tr.setTourReviewWriter(userId);
		int result =new AttractionService().writeReview(tr);
		System.out.println(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
