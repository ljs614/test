package triptaxi.city.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import triptaxi.city.model.service.CityService;
import triptaxi.city.model.vo.City;

/**
 * Servlet implementation class TouristServlet
 */
@WebServlet("/tourist")
public class TouristServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TouristServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<City> list=new CityService().selectCityList();
		
		JSONArray jarr=new JSONArray();
		
		/*
		 * for(City t : list) { JSONObject j=new JSONObject();
		 * j.put("cityName",t.getCityName()); j.put("cityEng",t.getCityEng());
		 * j.put("nationName",t.getNationName()); jarr.add(t); }
		 * System.out.println(jarr);
		 */
		
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
