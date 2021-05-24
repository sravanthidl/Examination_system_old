package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuizDao;
import com.dao.SubjectDao;
import com.dto.Quiz;

@WebServlet("/TeacherQuizSetting")
public class TeacherQuizSetting extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String YBSId = (String)session.getAttribute("YBSId");
		String teacherId = (String)session.getAttribute("teacherId");
		String examType = (String)session.getAttribute("examType");
		if(examType.contentEquals("quiz1")) examType = "mid1";
		else examType = "mid2";
		String question = null, optionA = null, optionB = null, optionC = null, optionD = null, answerOption = null;
        int questionNo = 0;
        
		Enumeration enumeration = request.getParameterNames();
        Map<String, Object> modelMap = new HashMap<>();
        Pattern questionNoP = Pattern.compile("(questionNo)[0-9]*");
        Pattern questionP = Pattern.compile("(question)[0-9]*");
        Pattern optionAP = Pattern.compile("(optionA)[0-9]*");
        Pattern optionBP = Pattern.compile("(optionB)[0-9]*");
        Pattern optionCP = Pattern.compile("(optionC)[0-9]*");
        Pattern optionDP = Pattern.compile("(optionD)[0-9]*");
        Pattern answerOptionP = Pattern.compile("(answerOption)[0-9]*");
        
        while(enumeration.hasMoreElements()){
            String parameterName = (String) enumeration.nextElement();
            modelMap.put(parameterName, request.getParameter(parameterName));
            System.out.println(parameterName + "@" + request.getParameter(parameterName));
            Matcher questionNoM = questionNoP.matcher(parameterName);
            Matcher questionM = questionP.matcher(parameterName);
            Matcher optionAM = optionAP.matcher(parameterName);
            Matcher optionBM = optionBP.matcher(parameterName);
            Matcher optionCM = optionCP.matcher(parameterName);
            Matcher optionDM = optionDP.matcher(parameterName);
            Matcher answerOptionM = answerOptionP.matcher(parameterName);
            
            if(questionNoM.find()) questionNo = Integer.parseInt(request.getParameter(parameterName));
            else if(questionM.find()) question = request.getParameter(parameterName);
            else if(optionAM.find()) optionA = request.getParameter(parameterName);
            else if(optionBM.find()) optionB = request.getParameter(parameterName);
            else if(optionCM.find()) optionC = request.getParameter(parameterName);
            else if(optionDM.find()) optionD = request.getParameter(parameterName);
            else if(answerOptionM.find()) {
            	System.out.println("FoundAnswerOption");
            	answerOption = request.getParameter(parameterName);
            	Quiz quiz = new Quiz(YBSId, examType, questionNo, question, optionA, optionB, optionC, optionD, answerOption);
            	System.out.println(quiz.toString());
            	QuizDao quizDao = new QuizDao();
            	int status = quizDao.addQuestion(quiz);
            	
            }
            	
        }
        //session.setAttribute("teacherId", teacherId);
        RequestDispatcher rd = request.getRequestDispatcher("TeacherSettingDashboard.jsp");
		rd.include(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
