package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ControllerDao;
import com.dto.Controller;
import com.dto.Teacher;

@WebServlet("/ControllerRegister")
public class ControllerRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String controllerId = request.getParameter("controllerId");
		String password = request.getParameter("password");
		String designation = request.getParameter("designation");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email"); 
		ControllerDao controllerDao = new ControllerDao();
		Controller userExists = controllerDao.getController(controllerId);
		if(userExists == null) {
			Controller controller = new Controller(controllerId, password, name, designation, mobile, email);
			int x = controllerDao.add(controller);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Sign up success!Click to continue...');");
			out.println("location='AllLoginPage.html';");
			out.println("</script>");
			out.println("<h3><CENTER>Registration Success .."+x+" Rows inserted...</CENTER></H3>");
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('ControllerId already exists!Click to retry...');");
			out.println("location='ControllerRegister.html';");
			out.println("</script>");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
