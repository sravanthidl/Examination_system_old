package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SubjectDao;
import com.dao.TeacherDao;
import com.dto.Teacher;


@WebServlet("/TeacherRegisterSubjects")
public class TeacherRegisterSubjects extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String teacherId = (String)session.getAttribute("teacherId"); 
		int year = Integer.parseInt(request.getParameter("year")); 
		String branch = "";
		Enumeration enumeration = request.getParameterNames();
		enumeration.nextElement();
        while(enumeration.hasMoreElements()){
            String parameterName = (String) enumeration.nextElement();
            System.out.println(parameterName + "@" + request.getParameter(parameterName));
            if(parameterName.equals("branch1") || parameterName.equals("branch2") || parameterName.equals("branch3") || parameterName.equals("branch4") || parameterName.equals("branch5") || parameterName.equals("branch6")) {
            	branch = request.getParameter(parameterName);
            }else {
            	String subjectCode = parameterName;
            	String subjectName = request.getParameter(parameterName);
            	String YBSId = year + "/" + branch + "/" + subjectCode;
            	System.out.println(YBSId);
            	SubjectDao subjectDao = new SubjectDao();
            	int status = subjectDao.updateTeacherId(YBSId, teacherId);
            	if(status > 0) System.out.println(status + "Update success!");
            	else System.out.println(status + "Update failed!");
            	
            }
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("TeacherRegisterSubjects.jsp");
		rd.include(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
