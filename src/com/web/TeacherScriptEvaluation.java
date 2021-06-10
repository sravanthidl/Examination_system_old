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
import com.dto.SAM;


@WebServlet("/TeacherScriptEvaluation")
public class TeacherScriptEvaluation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String teacherId = (String)session.getAttribute("teacherId");
		System.out.println(teacherId);
		String studentId = (String)request.getParameter("studentId");
		String YBSId = (String)request.getParameter("YBSId");
		String examType = (String)request.getParameter("examType");
		ArrayList<Integer> QMarks = new ArrayList<Integer>();
		
		Enumeration enumeration = request.getParameterNames();
		enumeration.nextElement();enumeration.nextElement();enumeration.nextElement();
        while(enumeration.hasMoreElements()){
            String param = (String) enumeration.nextElement();
            if(!param.equals("Submit")) QMarks.add(Integer.parseInt(request.getParameter(param)));
        }
        Collections.sort(QMarks, Collections.reverseOrder());
        Iterator it = QMarks.iterator();
        int total = (int)it.next() + (int)it.next() + (int)it.next();
        
        SAMDao samDao = new SAMDao();
        SAM sam = samDao.getSam(studentId, YBSId);
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
