package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ExamTaskDao;
import com.dto.ExamTask;


@WebServlet("/ControllerSettingScheduling")
public class ControllerSettingScheduling extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int year = Integer.parseInt(request.getParameter("year"));
		String examType = request.getParameter("examType");		
		String openDate = request.getParameter("openDate");
		String closeDate = request.getParameter("closeDate");
		
		ExamTask examTask = new ExamTask();
		examTask.setYear(year);
		examTask.setExamType(examType);
		examTask.setSettingOpenDate(openDate);
		examTask.setSettingCloseDate(closeDate);
		
		ExamTaskDao examTaskDao = new ExamTaskDao();
		if(examTaskDao.checkIfExamTaskExists(year, examType)) examTaskDao.updateSettingDates(year, examType, openDate, closeDate);
		else examTaskDao.addDates(examTask);
		
		RequestDispatcher rd = request.getRequestDispatcher("ControllerSettingScheduling.jsp");
		rd.include(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
