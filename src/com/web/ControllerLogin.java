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
import com.dto.Controller;


@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String controllerId = request.getParameter("controllerId");
		String password = request.getParameter("password");
		ControllerDao controllerDao = new ControllerDao();
		Controller controller = controllerDao.getController(controllerId);
		System.out.println(controller);
		if(controller != null){
			String correctPassword = controller.getPassword();
			if(password.equals(correctPassword)) {
				session.setAttribute("controllerId", controllerId);
				RequestDispatcher rd = request.getRequestDispatcher("ControllerHome.jsp");
				rd.include(request, response);
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong Password!Click to continue...');");
				out.println("location='AllLoginPage.html';");
				out.println("</script>");
			}	
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('ControllerId does not exist!Try signing up...');");
			out.println("location='ControllerRegister.html';");
			out.println("</script>");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
