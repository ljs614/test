package triptaxi.attraction.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.triptaxi.attraction.model.vo.Attraction;
import com.triptaxi.attraction.model.vo.TourReview;

import triptaxi.attraction.service.AttractionService;

/**
 * Servlet implementation class AttractionSelectServlet
 */
@WebServlet("/attraction/select")
public class SelectAttractionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAttractionServlet() {
        super();
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				AttractionService service=new AttractionService();
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				String attId=request.getParameter("attId");
				Attraction a=service.selectAttraction(attId);
				List<Attraction> list=service.recommendAttraction(attId);
				List<TourReview> list2=service.reviewList(attId);
				request.setAttribute("selectatt", a);
				request.setAttribute("list", list);
				request.setAttribute("reviewList", list2);
				request.getRequestDispatcher("/views/attraction/attraction.jsp").forward(request, response);


	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	}

}
