package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExtTeacherDao;


@WebServlet("/ControllerExtTeacherMap")
public class ControllerExtTeacherMap extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ExtTeacherDao extTeacherDao = new ExtTeacherDao();
		int year = Integer.parseInt(request.getParameter("year"));
		String branch = request.getParameter("branch");
		String subjectCode = request.getParameter("subjectCode");
		String extTeacherId = request.getParameter("extTeacherId");
		//System.out.println(branch);
		String YBSId = year + "/" + branch + "/" + subjectCode;
		int subjectSNo = extTeacherDao.getExtTeacherWithYBSId(YBSId).size() + 1;
		extTeacherDao.updateExtTeacherPrereq(extTeacherId, YBSId, subjectSNo);
		
		out.println("<html><body");
        out.println("<input type=\"hidden\" name=\"year\" value=" + year + ">");
		out.println("</body></html>");
		RequestDispatcher rd = request.getRequestDispatcher("ControllerExtTeacherMap.jsp");
		rd.include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
