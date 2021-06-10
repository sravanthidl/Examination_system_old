package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AcadYearDao;


@WebServlet("/ControllerRenewSemester")
public class ControllerRenewSemester extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int year = Integer.parseInt(request.getParameter("year"));
		int semester = Integer.parseInt(request.getParameter("semester"));
		AcadYearDao acadYearDao = new AcadYearDao();
		System.out.println("year: " + year);
		acadYearDao.startNewSemester(year, semester);
		
		RequestDispatcher rd = request.getRequestDispatcher("ControllerNewSemester.jsp");
		rd.include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
