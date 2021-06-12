package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SAMDao;
import com.dao.StudentDao;
import com.dto.ScriptsAndMarks;


@WebServlet("/ExtTeacherScriptEvaluation")
public class ExtTeacherScriptEvaluation extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		SAMDao samDao = new SAMDao();
		StudentDao studentDao = new StudentDao();
		
		String extTeacherId = (String)session.getAttribute("extTeacherId");
		String studentId = (String)request.getParameter("studentId");
		String YBSId = (String)request.getParameter("YBSId");
		String examType = (String)request.getParameter("examType");
		ArrayList<Integer> restQMarks = new ArrayList<Integer>();
		int total = 0;
		Enumeration enumeration = request.getParameterNames();
		enumeration.nextElement();enumeration.nextElement();enumeration.nextElement();
        while(enumeration.hasMoreElements()){
            String param = (String) enumeration.nextElement();
            if(param.equals("Q1Marks")) total = Integer.parseInt(request.getParameter(param));
            else if(!param.equals("Submit")) restQMarks.add(Integer.parseInt(request.getParameter(param)));
        }
        Collections.sort(restQMarks, Collections.reverseOrder());
        Iterator it = restQMarks.iterator();
        total += (int)it.next() + (int)it.next() + (int)it.next();

        ScriptsAndMarks sam = samDao.getSam(studentId, YBSId);
        int status = samDao.updateEvaluatedMarks(studentId, YBSId, examType, total);
        
        samDao.updateNetMarks(studentId, YBSId, examType);
        samDao.updateGrade(studentId, YBSId);
        studentDao.updateSgpa(studentId);
        studentDao.updateCgpa(studentId);
        
        RequestDispatcher rd = request.getRequestDispatcher("ExtTeacherEvaluation.jsp");
		rd.include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
