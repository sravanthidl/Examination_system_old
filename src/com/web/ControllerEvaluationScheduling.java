package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ExamTaskDao;
import com.dto.ExamTask;


@WebServlet("/ControllerEvaluationScheduling")
public class ControllerEvaluationScheduling extends HttpServlet {
	
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
		examTask.setEvaluationOpenDate(openDate);
		examTask.setEvaluationCloseDate(closeDate);
		
		ExamTaskDao examTaskDao = new ExamTaskDao();
		ExamTask examTaskExists = examTaskDao.getExamTask(year, examType);
		if(examTaskExists == null) {
			int status = examTaskDao.addDates(examTask);
		}else{
			int status = examTaskDao.updateEvaluationDates(year, examType, openDate, closeDate); 
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ControllerEvaluationScheduling.jsp");
		rd.include(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
