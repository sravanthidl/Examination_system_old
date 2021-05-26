package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.DescriptiveDao;
import com.dto.Descriptive;


@WebServlet("/TeacherDescSetting")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class TeacherDescSetting extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String teacherId = (String)session.getAttribute("teacherId");
		System.out.println(teacherId);
		String YBSId = (String)request.getParameter("YBSId");
		String examType = (String)request.getParameter("examType");
		String asgnOpenDate = "", asgnCloseDate = "";
		if(examType.equals("asgn1") || examType.equals("asgn2")) {
			asgnOpenDate = (String)request.getParameter("openDate");
			asgnCloseDate = (String)request.getParameter("closeDate");
		}
		Part part = request.getPart("file");
		System.out.println("part:" + part);
		String paperPath = extractFileName(part);
        String saveDir = "pics";
        imageUpload(request, paperPath, saveDir);
        
        DescriptiveDao descriptiveDao = new DescriptiveDao();
        if(examType.equals("mid1") || examType.equals("mid2") || examType.equals("sem")){
        	Descriptive descriptiveExists = descriptiveDao.getDescriptiveByYBSIdAndExamType(YBSId, examType);
        	if(descriptiveExists == null) {
        		Descriptive  descriptive = null;
        		descriptive.setYBSId(YBSId);
        		descriptive.setExamType(examType);
        		descriptive.setTeacherId(teacherId);
        		descriptive.setQPaperPath(paperPath);
        		descriptiveDao.addDescriptive(descriptive);
        	}else {
        		int status = descriptiveDao.updateQPaperPath(YBSId, examType, paperPath);
        	}
        }else{
        	if(examType.equals("asgn1")) examType = "mid1";
        	else examType = "mid2";
        	Descriptive descriptiveExists = descriptiveDao.getDescriptiveByYBSIdAndExamType(YBSId, examType);
        	if(descriptiveExists == null) {
        		Descriptive  descriptive = null;
        		descriptive.setYBSId(YBSId);
        		descriptive.setExamType(examType);
        		descriptive.setTeacherId(teacherId);
        		descriptive.setAsgnPaperPath(paperPath);
        		descriptive.setAsgnOpenDate(asgnOpenDate);
        		descriptive.setAsgnCloseDate(asgnCloseDate);
        		descriptiveDao.addDescriptive(descriptive);
        	}else {
        		int status = descriptiveDao.updateAsgnPaperPath(YBSId, examType, paperPath, asgnOpenDate, asgnCloseDate);
        	}
        }
        
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void imageUpload(HttpServletRequest request, String fname, String saveDir) throws ServletException, IOException {
		
		String savePath = "/Users/sravanthi/Desktop/Workspace/Examination_system/WebContent/" + saveDir;	 
		File fileSaveDir = new File(savePath);	 
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		Part part = request.getPart("file");
		String fileName = extractFileName(part);
		System.out.println(fileName);
	    fileName = new File(fileName).getName();
		System.out.println(fileName);
		part.write(savePath + "/" + fname);
		System.out.print("File Uploaded Successfully ");		
	}	
		
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")){
				return s.substring(s.indexOf("=") + 2, s.length()-1);
		    }
		}
		return "";
	}

}
