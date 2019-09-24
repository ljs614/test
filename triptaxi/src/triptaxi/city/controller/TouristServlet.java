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

import triptaxi.city.model.vo.Tourist;

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
		
		List<Tourist> list=new ArrayList();
		list.add(new Tourist("박보검","01045631234","parkBogum.jpg"));
		list.add(new Tourist("줄리로버츠","01013442244","juliaRoberts.jpg"));
		list.add(new Tourist("맷데이먼","01093144567","mattDamon.jpg"));
		list.add(new Tourist("박보검","01045631234","parkBogum.jpg"));
		list.add(new Tourist("줄리로버츠","01013442244","juliaRoberts.jpg"));
		list.add(new Tourist("맷데이먼","01093144567","mattDamon.jpg"));
		
		JSONArray jarr=new JSONArray();
		for(Tourist t : list) {
			JSONObject j=new JSONObject();
			j.put("url",t.getImgUrl());
			j.put("title", t.getTouristTitle());
			j.put("content", t.getTouristContent());
			jarr.add(t);
		}
		
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
