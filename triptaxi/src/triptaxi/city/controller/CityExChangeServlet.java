package triptaxi.city.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Calendar;

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
        
        Calendar cal = Calendar.getInstance();
        System.out.println("달력"+cal);
        
        int year=cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH)+1;
        int date=cal.get(Calendar.DATE);
        int dayofWeek=cal.get(Calendar.DAY_OF_WEEK);
        
        String yearStr=String.valueOf(year);
        String monthStr="";
        String dateStr="";
        if((monthStr = String.valueOf(month)).length()==1) {
        	monthStr="0"+monthStr;
        };
        if((dateStr = String.valueOf(date)).length()==1) {
        	dateStr="0"+dateStr;
        };
        System.out.println("년도 : "+yearStr + "월 : "+monthStr + "일 : "+dateStr + "요일 : "+dayofWeek);
        String today=yearStr+monthStr+dateStr;
        System.out.println(today);
        
        int todayInt = Integer.parseInt(today);
        
        if(dayofWeek==1) {
        	todayInt=todayInt-2;
        }
        else if(dayofWeek==1) {
        	todayInt=todayInt-3;
        }
        else {
        	todayInt=todayInt-1;
        }
        System.out.println(todayInt);
        
        String addr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=2M2nzLJKePBXRnne3PUuBuA2dhceGxQl&searchdate="+todayInt+"&data=AP01";
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
