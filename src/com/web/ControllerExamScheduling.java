package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DescriptiveDao;
import com.dto.Descriptive;


@WebServlet("/ControllerExamScheduling")
public class ControllerExamScheduling extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//String YBSId = request.getParameter("YBSId");
		String examType = request.getParameter("examType");
		Enumeration enumeration = request.getParameterNames();
		enumeration.nextElement();
		
		while(enumeration.hasMoreElements()){
            String param = (String)enumeration.nextElement();
            String paramValue = request.getParameter(param);
            System.out.println(param + "@" + paramValue);
            if(!param.equals("Submit")) {
            	String YBSId = param;
            	String examDate = request.getParameter((String)enumeration.nextElement());
            	String openTime = request.getParameter((String)enumeration.nextElement());
            	String closeTime = request.getParameter((String)enumeration.nextElement());
            	Descriptive descriptive = new Descriptive();
            	descriptive.setYBSId(YBSId);
            	descriptive.setExamType(examType);
            	descriptive.setExamDate(examDate);
            	descriptive.setExamOpenTime(openTime);
            	descriptive.setExamCloseTime(closeTime);
            	if(!examDate.equals("")) {
            		DescriptiveDao descriptiveDao = new DescriptiveDao();
                	Descriptive descriptiveExists = descriptiveDao.getDescriptive(YBSId, examType);
                	if(descriptiveExists == null) {
                		int status = descriptiveDao.addDescriptive(descriptive);
                		//System.out.println("HERE");
                	}else {
                		int status = descriptiveDao.updateExamTimeStamp(YBSId, examType, examDate, openTime, closeTime);
                		//System.out.println("THERE");
                	}
            	}	
            }
		}
		RequestDispatcher rd = request.getRequestDispatcher("ControllerExamSchedulingDashboard.jsp");
		rd.include(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
