package com.web;

import java.io.IOException;
import com.oreilly.servlet.MultipartRequest;  

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



@WebServlet("/tmp")
public class tmp extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String teacherId = (String)session.getAttribute("teacherId");
		MultipartRequest multiPartRequest = new MultipartRequest(request,"/Users/sravanthi/Desktop/Workspace/Examination_system/WebContent/pics");  
		String YBSId = multiPartRequest.getParameter("YBSId");
		String examType = multiPartRequest.getParameter("examType");
		String fileName = multiPartRequest.getOriginalFileName("file");
		String asgnOpenDate = multiPartRequest.getParameter("openDate");
		String asgnCloseDate = multiPartRequest.getParameter("closeDate");*/
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
