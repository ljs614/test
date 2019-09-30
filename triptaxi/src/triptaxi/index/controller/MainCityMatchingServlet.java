package triptaxi.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import triptaxi.city.model.service.CityService;
import triptaxi.city.model.vo.City;


/**
 * Servlet implementation class MainCityMatchingServlet
 */
@WebServlet("/city/matching")
public class MainCityMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainCityMatchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] continent=request.getParameterValues("continent[]");
		String[] withTravel=request.getParameterValues("withTravel[]");
		
		String ct="";
		String wt="";
		
		for(int i=0; i<continent.length;i++) {
			if(i!=0) {
				ct+="'";
			}
			ct+=continent[i];
			if(i<continent.length-1) {
				ct+="',";
			}
		}
		System.out.println(ct);
		for(int i=0; i<withTravel.length;i++) {
			if(i!=0) {
				wt+="'";
			}
			wt+=withTravel[i];
			if(i<withTravel.length-1) {
				wt+="',";
			}
		}
		System.out.println(wt);
		List<City> list=new CityService().matchingCity(ct, wt);
		
		
		request.getRequestDispatcher("/").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
