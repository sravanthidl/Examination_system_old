package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ControllerDao;
import com.dao.ExtTeacherDao;
import com.dao.TeacherDao;


@WebServlet("/PasswordReset")
public class PasswordReset extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		System.out.println(password);
		if(user.equals("controller")) {
			String controllerId = (String)session.getAttribute("controllerId");
			ControllerDao controllerDao = new ControllerDao();
			int status = controllerDao.updatePassword(controllerId, password);
			RequestDispatcher rd = request.getRequestDispatcher("ControllerViewProfile.jsp");
			rd.include(request, response);
		}else if(user.equals("teacher")){
			String teacherId = (String)session.getAttribute("teacherId");
			System.out.println(teacherId);
			TeacherDao teacherDao = new TeacherDao();
			int status = teacherDao.updatePassword(teacherId, password);
			RequestDispatcher rd = request.getRequestDispatcher("TeacherProfile.jsp");
			rd.include(request, response);
		}else{
			String extTeacherId = (String)session.getAttribute("extTeacherId");
			ExtTeacherDao extTeacherDao = new ExtTeacherDao();
			int status = extTeacherDao.updateExtTeacherPassword(extTeacherId, password);
			RequestDispatcher rd = request.getRequestDispatcher("ExtTeacherProfile.jsp");
			rd.include(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
