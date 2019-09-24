package triptaxi.city.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class ExChange
 */
@WebServlet("/exChange")
public class CityExChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityExChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        String addr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=2M2nzLJKePBXRnne3PUuBuA2dhceGxQl&searchdate=20190920&data=AP01";
//        String serviceKey = "자신의 키값 입력";
//        String parameter = "";
//        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
        PrintWriter out = response.getWriter();
//        parameter = parameter + "&" + "areaCode=1";
//        parameter = parameter + "&" + "eventStartDate=20170401";
//        parameter = parameter + "&" + "eventEndDate=20171231";
//        parameter = parameter + "&" + "pageNo=1&numOfRows=10";
//        parameter = parameter + "&" + "MobileOS=ETC";
//        parameter = parameter + "&" + "MobileApp=aa";
//        parameter = parameter + "&" + "_type=json";
        
        
//        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
        
        InputStream in = url.openStream(); 
        CachedOutputStream bos = new CachedOutputStream();
        IOUtils.copy(in, bos);
        in.close();
        bos.close();
        
//        out.println(addr);
        
        String data = bos.getOut().toString();        
        out.println(data);
        
        JSONObject json = new JSONObject();
        json.put("data", data);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
