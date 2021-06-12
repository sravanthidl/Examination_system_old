package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LabMarksDao;
import com.dto.LabMarks;

@WebServlet("/TeacherLabMarksEntry")
public class TeacherLabMarksEntry extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String teacherId = (String)session.getAttribute("teacherId");
		System.out.println(teacherId);
		List<String> studentIdList = new ArrayList<String>();
		List<Integer> internalMarksList = new ArrayList<Integer>();
		List<Integer> externalMarksList = new ArrayList<Integer>();
		
		Enumeration enumeration = request.getParameterNames();
		String YBSId = request.getParameter((String)enumeration.nextElement());
		String param = (String) enumeration.nextElement();
        while(enumeration.hasMoreElements() && !param.equals("InternalSubmit") && !param.equals("ExternalSubmit")){
            	studentIdList.add(request.getParameter(param));
            	System.out.println("id-> "+request.getParameter(param));
            	param = (String) enumeration.nextElement();
            	internalMarksList.add(Integer.parseInt(request.getParameter(param)));
            	System.out.println("intmarks->"+request.getParameter(param));
            	param = (String) enumeration.nextElement();
            	externalMarksList.add(Integer.parseInt(request.getParameter(param)));
            	System.out.println("extmarks->"+request.getParameter(param));
            	param = (String) enumeration.nextElement();
        }
        if(param.equals("InternalSubmit")) {
        	LabMarksDao labMarksDao = new LabMarksDao();
        	for(int i = 0; i < studentIdList.size(); i++) {
        		LabMarks labMarksExists = labMarksDao.getLabMarks(studentIdList.get(i), YBSId);
        		if(labMarksExists == null) {
        			LabMarks labMarks = new LabMarks();
        			labMarks.setStudentId(studentIdList.get(i));
        			labMarks.setYBSId(YBSId);
        			labMarks.setInternalMarks(internalMarksList.get(i));
        			labMarksDao.add(labMarks);
        		}
        		else labMarksDao.updateInternalMarks(studentIdList.get(i), YBSId, internalMarksList.get(i));
        		labMarksDao.updateNetLabMarks(studentIdList.get(i), YBSId);
        	}
        	
        }if(param.equals("ExternalSubmit")) {
        	LabMarksDao labMarksDao = new LabMarksDao();
        	for(int i = 0; i < studentIdList.size(); i++) {
        		LabMarks labMarksExists = labMarksDao.getLabMarks(studentIdList.get(i), YBSId);
        		if(labMarksExists == null) {
        			LabMarks labMarks = new LabMarks();
        			labMarks.setStudentId(studentIdList.get(i));
        			labMarks.setYBSId(YBSId);
        			labMarks.setExternalMarks(externalMarksList.get(i));
        			labMarksDao.add(labMarks);
        		}
        		else labMarksDao.updateExternalMarks(studentIdList.get(i), YBSId, externalMarksList.get(i));
        		labMarksDao.updateNetLabMarks(studentIdList.get(i), YBSId);
        		labMarksDao.updateLabGrade(studentIdList.get(i), YBSId);
        	}
        }
        out.println("<html><body");
        out.println("<input type=\"hidden\" name=\"YBSId\" value=" + YBSId + ">");
		out.println("</body></html>");
        RequestDispatcher rd = request.getRequestDispatcher("TeacherLabMarksEntry.jsp");
		rd.include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
