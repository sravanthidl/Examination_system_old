package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TeacherDao;
import com.dto.Teacher;

@WebServlet("/TeacherRegister")
public class TeacherRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String teacherId = request.getParameter("teacherId");
		String password = request.getParameter("password");
		String branch = request.getParameter("branch");
		String designation = request.getParameter("designation");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		TeacherDao teacherDao = new TeacherDao();
		Teacher userExists = teacherDao.getTeacher(teacherId);
		if(userExists == null) {
			Teacher teacher = new Teacher(teacherId, password, name, branch, designation, mobile, email); 
			int x = teacherDao.register(teacher);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Sign up success!Click to continue...');");
			out.println("location='AllLoginPage.html';");
			out.println("</script>");
			out.println("<h3><CENTER>Registration Success .."+x+" Rows inserted...</CENTER></H3>");
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('TeacherId already exists!Click to retry...');");
			out.println("location='TeacherRegister.html';");
			out.println("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
