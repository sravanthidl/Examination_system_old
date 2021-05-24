package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SubjectDao;
import com.dto.Subject;


@WebServlet("/ControllerRegisterSubjects")
public class ControllerRegisterSubjects extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int year = Integer.parseInt(request.getParameter("year"));
		String ce = request.getParameter("ce");
		String cse = request.getParameter("cse");
		String ece = request.getParameter("ece");
		String eee = request.getParameter("eee");
		String it = request.getParameter("it");
		String me = request.getParameter("me");
		String[] CESubjects = ce.split(",");
		String[] CSESubjects = cse.split(",");
		String[] ECESubjects = ece.split(",");
		String[] EEESubjects = eee.split(",");
		String[] ITSubjects = it.split(",");
		String[] MESubjects = me.split(",");
		SubjectDao subjectDao = new SubjectDao();
		int flag = 0;
		if(CESubjects.length > 0 && !CESubjects[0].equals("")) {
			for(int i = 0; i < CESubjects.length; i++) {
				String YBSId = year + "/CE/" + CESubjects[i];
				String BSId = "CE/" + CESubjects[i];
				Subject subject = new Subject(year, "CE", CESubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}if(CSESubjects.length > 0 && !CSESubjects[0].equals("")) {
			for(int i = 0; i < CSESubjects.length; i++) {
				String YBSId = year + "/CSE/" + CSESubjects[i];
				String BSId = "CSE/" + CSESubjects[i];
				Subject subject = new Subject(year, "CSE", CSESubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}if(ECESubjects.length > 0 && !ECESubjects[0].equals("")) {
			for(int i = 0; i < ECESubjects.length; i++) {
				String YBSId = year + "/ECE/" + ECESubjects[i];
				String BSId = "ECE/" + ECESubjects[i];
				Subject subject = new Subject(year, "ECE", ECESubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}if(EEESubjects.length > 0 && !EEESubjects[0].equals("")) {
			for(int i = 0; i < EEESubjects.length; i++) {
				String YBSId = year + "/EEE/" + EEESubjects[i];
				String BSId = "EEE/" + EEESubjects[i];
				Subject subject = new Subject(year, "EEE", EEESubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}if(ITSubjects.length > 0 && !ITSubjects[0].equals("")) {
			for(int i = 0; i < ITSubjects.length; i++) {
				String YBSId = year + "/IT/" + ITSubjects[i];
				String BSId = "IT/" + ITSubjects[i];
				Subject subject = new Subject(year, "IT", ITSubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}if(MESubjects.length > 0 && !MESubjects[0].equals("")) {
			for(int i = 0; i < MESubjects.length; i++) {
				String YBSId = year + "/ME/" + MESubjects[i];
				String BSId = "ME/" + MESubjects[i];
				Subject subject = new Subject(year, "ME", MESubjects[i], YBSId, BSId, null);
				flag += subjectDao.register(subject);
			}
		}

		if(flag > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("ControllerRegisterSubjects.html");
			rd.include(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("ControllerHome.jsp");
			rd.include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
