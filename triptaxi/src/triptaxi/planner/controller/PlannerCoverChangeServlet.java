package triptaxi.planner.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import triptaxi.planner.model.service.PlannerService;

/**
 * Servlet implementation class PlannerCoverChangeServlet
 */
@WebServlet("/planner/coverChange")
public class PlannerCoverChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlannerCoverChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		String path=getServletContext().getRealPath("/views/planner/img/coverImg");
		int maxSize=1024*1024*100;
		MultipartRequest mr=new MultipartRequest(request,path, maxSize,"UTF-8", new DefaultFileRenamePolicy());
		String coverImg=mr.getFilesystemName("cover");
		String plannerId=mr.getParameter("plannerId");
		String plannerCoverImg=mr.getParameter("plannerCoverImg");
		if(!coverImg.equals("null")) {			
			if(!plannerCoverImg.substring(0, 3).equals("/im")) {
				File file=new File(path+"/"+plannerCoverImg);
				file.delete();
			}
			new PlannerService().updateCoverImg(plannerId, "/views/planner/img/coverImg/"+coverImg);
			response.getWriter().append(coverImg);	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
