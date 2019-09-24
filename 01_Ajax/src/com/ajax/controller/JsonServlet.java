package com.ajax.controller;

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

import com.ajax.model.vo.Member;
import com.ajax.model.vo.User;
import com.google.gson.Gson;

/**
 * Servlet implementation class JsonServlet
 */
@WebServlet("/jsonData")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User u=new User(1,"admin","관리자","서울");
		//{"userNo":"1","userId":"admin",....}
		//Json라이브러리가 제공하는 객체에 User객체를 대입합니다
		JSONObject jobj=new JSONObject();
		//key:value형식으로 jobj에 User 객체를 넣어주면됨.
//		jobj.put("userNo", u.getUserNo());
//		jobj.put("userId",u.getUserId());
//		jobj.put("userName",u.getUserName());
//		jobj.put("userAddr",u.getUserAddr());
//		jobj.put("height",180.5);
//		jobj.put("flag", true);
		
		List<Member> list=new ArrayList();
		list.add(new Member("박보검","01045631234","parkBogum.jpg"));
		list.add(new Member("쥴리아로버츠","01013442244","juliaRoberts.jpg"));
		list.add(new Member("맷데이먼","01093144567","mattDamon.jpg"));
		
		JSONArray jarr=new JSONArray();
		for(Member m:list) {
			JSONObject j=new JSONObject();
			j.put("name",m.getName());
			j.put("phone",m.getPhone());
			j.put("profile",m.getProfile());
			jarr.add(j);
		}
		
		
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().print(jobj);
//		response.getWriter().print(jarr);
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
