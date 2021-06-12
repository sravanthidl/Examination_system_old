package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SAMDao;
import com.dto.ScriptsAndMarks;


@WebServlet("/TeacherScriptEvaluation")
public class TeacherScriptEvaluation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String teacherId = (String)session.getAttribute("teacherId");
		String studentId = (String)request.getParameter("studentId");
		String YBSId = (String)request.getParameter("YBSId");
		String examType = (String)request.getParameter("examType");
		int total = 0;
		
		if(examType.equals("mid1") || examType.equals("mid2")) {
			ArrayList<Integer> QMarks = new ArrayList<Integer>();
			QMarks.add(Integer.parseInt(request.getParameter("Q1Marks")));
			QMarks.add(Integer.parseInt(request.getParameter("Q2Marks")));
			QMarks.add(Integer.parseInt(request.getParameter("Q3Marks")));
			QMarks.add(Integer.parseInt(request.getParameter("Q4Marks")));
			Collections.sort(QMarks, Collections.reverseOrder());
			total = QMarks.get(0) + QMarks.get(1) + QMarks.get(2);
		}else {
			total = Integer.parseInt(request.getParameter("marks"));
		}

        SAMDao samDao = new SAMDao();
        ScriptsAndMarks sam = samDao.getSam(studentId, YBSId);
        System.out.println("a" + examType);
        int status = samDao.updateEvaluatedMarks(studentId, YBSId, examType, total);
        
        status = samDao.updateNetMarks(studentId, YBSId, examType);
        
        out.println("<html><body");
        out.println("<input type=\"hidden\" name=\"YBSId\" value=" + YBSId + ">");
		out.println("<input type=\"hidden\" name=\"examType\" value=" + examType + ">");
		out.println("</body></html>");
        RequestDispatcher rd = request.getRequestDispatcher("TeacherViewScripts.jsp");
		rd.include(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
