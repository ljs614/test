package triptaxi.attraction.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.triptaxi.attraction.model.vo.TourReview;

import triptaxi.attraction.service.AttractionService;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/attraction/reviewlist")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String attId=request.getParameter("attId");
		int reviewmore=Integer.parseInt(request.getParameter("data1"));

		
		List<TourReview> list=new AttractionService().reviewList(attId,reviewmore);
	
		JSONArray jarr=new JSONArray();
		for(TourReview tr:list) {
			JSONObject j=new JSONObject();
			j.put("reviewNo",tr.getTourReviewNo());
			j.put("reviewWriter",tr.getTourReviewWriter());
			j.put("reviewContent",tr.getTourReviewContent());
			j.put("tourId",tr.getTourId());
			j.put("reviewScore",tr.getTourReviewScore());
			j.put("reviewDate",tr.getTourReviewDate());
			jarr.add(j);

		}
		
		
		response.setContentType("application/json;charset=UTF-8");

		
		response.getWriter().append(new Gson().toJson(jarr));
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
