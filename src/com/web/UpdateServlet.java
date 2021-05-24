package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




@WebServlet("/UpdateServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class UpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		/*int id =Integer.parseInt(request.getParameter("custId"));
		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		//String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNum = request.getParameter("phoneNum");*/
		Part part = request.getPart("file");
		System.out.println("part:" + part);
		String fileName = extractFileName(part);
		
        String saveDir = "pics";
        imageUpload(request, fileName, saveDir);
	    //System.out.println(profilePath);
		/*Customer customer;// = new Customer(userName, password, firstName, lastName, gender, email, phoneNum); 
		CustomerDao cust = new CustomerDao();
		customer = cust.getCustomer(id);
		customer.setProfilePath(fileName);
		
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		//customer.setGender(gender);
		customer.setEmail(email);
		customer.setPhoneNum(phoneNum);
		int x = cust.editCustomer(customer);
     	out.print("<html>");
	    RequestDispatcher rd = request.getRequestDispatcher("ViewProfile.jsp");
		rd.include(request, response);
		out.println("</html>");*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	
	private void imageUpload(HttpServletRequest request, String fname, String saveDir) throws ServletException, IOException {
		
		 String savePath = "F:/Project1/Flipkart/WebContent/" + saveDir;	 
		 File fileSaveDir = new File(savePath);	 
		        if (!fileSaveDir.exists()) {
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
		        for (String s : items) {
		            if (s.trim().startsWith("filename")) {
		                return s.substring(s.indexOf("=") + 2, s.length()-1);
		            }
		        }
		        return "";

}
}
