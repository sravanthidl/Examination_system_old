package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ExtTeacherDao;
import com.dao.TeacherDao;
import com.dto.ExtTeacher;
import com.dto.Teacher;


@WebServlet("/ExtTeacherRegister")
public class ExtTeacherRegister extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ExtTeacherDao extTeacherDao = new ExtTeacherDao();
		String name = request.getParameter("name");
		String extTeacherId = request.getParameter("extTeacherId");
		String password = request.getParameter("password");
		String branch = request.getParameter("branch");
		String subjectCode = request.getParameter("subjectCode");
		String mobile = request.getParameter("mobile");
		ExtTeacher userExists = extTeacherDao.getExtTeacher(extTeacherId);
		if(userExists == null) {
			System.out.println("pass: " + password);
			ExtTeacher extTeacher = new ExtTeacher(extTeacherId, password, name, branch, subjectCode, null, null, mobile); 
			int x = extTeacherDao.register(extTeacher);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Sign up success!Click to continue...');");
			out.println("location='AllLoginPage.html';");
			out.println("</script>");
			out.println("<h3><CENTER>Registration Success .."+x+" Rows inserted...</CENTER></H3>");
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('ExtTeacherId already exists!Click to retry...');");
			out.println("location='ExtTeacherRegister.jsp';");
			out.println("</script>");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
