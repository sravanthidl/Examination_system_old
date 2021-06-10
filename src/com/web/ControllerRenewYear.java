package com.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AcadYearDao;

@WebServlet("/ControllerRenewYear")
public class ControllerRenewYear extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AcadYearDao acadYearDao = new AcadYearDao();
		acadYearDao.startNewAcademicYear();
		
		RequestDispatcher rd = request.getRequestDispatcher("ControllerNewSemester.jsp");
		rd.include(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
