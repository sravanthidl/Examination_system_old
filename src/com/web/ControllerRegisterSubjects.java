package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
		String ce = request.getParameter("ce"), ceLab = request.getParameter("ceLab");
		String cse = request.getParameter("cse"), cseLab = request.getParameter("cseLab");
		String ece = request.getParameter("ece"), eceLab = request.getParameter("eceLab");
		String eee = request.getParameter("eee"), eeeLab = request.getParameter("eeeLab");
		String it = request.getParameter("it"), itLab = request.getParameter("itLab");
		String me = request.getParameter("me"), meLab = request.getParameter("meLab");
		
		String[] CESubjects = ce.split(","), CELabSubjects = ceLab.split(",");
		String[] CSESubjects = cse.split(","), CSELabSubjects = cseLab.split(",");
		String[] ECESubjects = ece.split(","), ECELabSubjects = eceLab.split(",");
		String[] EEESubjects = eee.split(","), EEELabSubjects = eeeLab.split(",");
		String[] ITSubjects = it.split(","), ITLabSubjects = itLab.split(",");
		String[] MESubjects = me.split(","), MELabSubjects = meLab.split(",");
		
		ArrayList<String[]> allBranchTheorySubjects = new ArrayList<>();
		allBranchTheorySubjects.add(CESubjects);allBranchTheorySubjects.add(CSESubjects);allBranchTheorySubjects.add(ECESubjects);allBranchTheorySubjects.add(EEESubjects);allBranchTheorySubjects.add(ITSubjects);allBranchTheorySubjects.add(MESubjects);
		ArrayList<String[]> allBranchLabSubjects = new ArrayList<>();
		allBranchLabSubjects.add(CELabSubjects);allBranchLabSubjects.add(CSELabSubjects);allBranchLabSubjects.add(ECELabSubjects);allBranchLabSubjects.add(EEELabSubjects);allBranchLabSubjects.add(ITLabSubjects);allBranchLabSubjects.add(MELabSubjects);
		String[] branches = new String[] {"CE", "CSE", "ECE", "EEE", "IT", "ME"};
		SubjectDao subjectDao = new SubjectDao();
		int flag = 0, branchIndex = 0;
		for(String[] branchTheorySubject : allBranchTheorySubjects) {
			if(branchTheorySubject.length > 0 && !branchTheorySubject[0].equals("")) {
				for(int i = 0; i < branchTheorySubject.length; i++) {
					String codeAndName = branchTheorySubject[i];
					String[] codeAndNameAr = codeAndName.split("-");
					String subjectCode = codeAndNameAr[0].trim();
					String subjectName = codeAndNameAr[1].trim();
					String YBSId = year + "/" + branches[branchIndex] + "/" + subjectCode;
					Subject theorySubject = new Subject(year, branches[branchIndex], subjectCode, YBSId, subjectName, "Theory", null);
					flag += subjectDao.register(theorySubject);
				}
			}
			branchIndex++;
		}
		
		flag = 0; branchIndex = 0;
		for(String[] branchLabSubject : allBranchLabSubjects) {
			if(branchLabSubject.length > 0 && !branchLabSubject[0].equals("")) {
				for(int i = 0; i < branchLabSubject.length; i++) {
					String codeAndName = branchLabSubject[i];
					String[] codeAndNameAr = codeAndName.split("-");
					String subjectCode = codeAndNameAr[0].trim();
					String subjectName = codeAndNameAr[1].trim();
					String YBSId = year + "/" + branches[branchIndex] + "/" + subjectCode;
					Subject labSubject = new Subject(year, branches[branchIndex], subjectCode, YBSId, subjectName, "Lab", null);
					flag += subjectDao.register(labSubject);
				}
			}
			branchIndex++;
		}

		RequestDispatcher rd = request.getRequestDispatcher("ControllerRegisterSubjects.jsp");
		rd.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
