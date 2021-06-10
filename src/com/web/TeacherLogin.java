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

import com.dao.TeacherDao;
import com.dto.Teacher;

@WebServlet("/TeacherLogin")
public class TeacherLogin extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String teacherId = request.getParameter("teacherId");
		String password = request.getParameter("password");
		TeacherDao teacherDao = new TeacherDao();
		Teacher teacher = teacherDao.getTeacher(teacherId);
		if(teacher != null) {
			String correctPassword = teacher.getPassword();
			if(password.equals(correctPassword)) {
				session.setAttribute("teacherId", teacherId);
				RequestDispatcher rd = request.getRequestDispatcher("TeacherHome.jsp");
				rd.include(request, response);
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong Password!Click to continue...');");
				out.println("location='AllLoginPage.html';");
				out.println("</script>");
			}	
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('TeacherId does not exist!Try signing up...');");
			out.println("location='TeacherRegister.html';");
			out.println("</script>");
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
