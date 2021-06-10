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

import com.dao.ExtTeacherDao;
import com.dao.TeacherDao;
import com.dto.ExtTeacher;
import com.dto.Teacher;


@WebServlet("/ExtTeacherLogin")
public class ExtTeacherLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String extTeacherId = request.getParameter("extTeacherId");
		String password = request.getParameter("password");
		ExtTeacherDao extTeacherDao = new ExtTeacherDao();
		ExtTeacher extTeacher = extTeacherDao.getExtTeacher(extTeacherId);
		if(extTeacher != null) {
			String correctPassword = extTeacher.getPassword();
			if(password.equals(correctPassword)) {
				session.setAttribute("extTeacherId", extTeacherId);
				RequestDispatcher rd = request.getRequestDispatcher("ExtTeacherEvaluation.jsp");
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
			out.println("location='ExtTeacherRegister.jsp';");
			out.println("</script>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
