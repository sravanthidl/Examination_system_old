<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="java.util.List"%>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

.head_bar {
	background-color:#0a2081;
	color: white;
	height:130px;
}
.head1_bar{
	font-size:26px;
	padding-left:540px;
	padding-top:12px;
}
.head2_bar{
	font-size:13px;
	padding-left:670px;
	padding-top:0px;
}
.head3_bar{
	font-size:22px;
	padding-left:615px;
	padding-top:10px;
}
.menu_bar{
	position:absolute;
	background-color:#b9c4f9;
	height:50px;
	width:100%;
	text-decoration:none;
	font-size:17px;
}
.body_bar{
	background-color:#f0f0f0;
	height:1000px;
	width:90%;
	position:absolute;
	top:180px;
	left:5%;
}

.dropdown {
	position:absolute;
	padding:12.5px 50px;
	display: inline-block;
}
.dropdown:hover{
	background-color: #0a2081;
	color:white;
}

.dropdown_content_box {
	display: none;
	color:black;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	top:50px;
	z-index:1;
}
.dropdown:hover .dropdown_content_box {
	position:absolute;
	display: block;
}

.dropdown_content_options{
	position:absolute;
	background-color:#b9c4f9;
  	min-width:284px;
  	min-height:40px;
	top:0px;
	padding-top:7px;
	text-align:center;
	font-size:15px;
	text-decoration:none;
}
.dropdown_content_options:hover{
	background-color:#a1aff7;
}


</style>

<body>
	<div class="head_bar">
		<div class="head1_bar">XYZ Institute of Technology</div>
		<div class="head2_bar">(Autonomous)</div> 
		<div class="head3_bar">Examination Corner</div>
	</div>
	
	<div class="menu_bar">
		<div class="dropdown" style="left:80px">
		<a style="text-decoration:none;cursor:pointer"">General Control</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:234px" href="#">Set New Semester</a></br>
		      <a class="dropdown_content_options" style="min-width:234px;top:40px" href="ControllerRegisterSubjects.html">Register Semester Subjects</a></br>
		      <a class="dropdown_content_options" style="min-width:234px;top:80px" href="#">Set Date</a></br>
		    </div>
			
		</div>
		
		<div class="dropdown" style="left:340px">
		<a style="text-decoration:none;cursor:pointer"">Paper Setting</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:216px" href="ControllerSettingScheduling.jsp">Schedule Setting</a></br>
		       <a class="dropdown_content_options" style="min-width:216px;top:40px" href="#">View Status</a></br>
		    </div>
			
		</div>
		
		<div class="dropdown" style="left:590px">
		<a style="text-decoration:none;cursor:pointer"">Evaluation</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:189px" href="ControllerEvaluationScheduling.jsp">Schedule Evaluation</a></br>
		      <a class="dropdown_content_options" style="min-width:189px;top:40px" href="#">View Status</a></br>
		      <a class="dropdown_content_options" style="min-width:189px;top:80px" href="#">Map External Papers</a></br>
		    </div>
			
		</div>

		<div class="dropdown" style="left:815px">
			<a style="text-decoration:none;cursor:pointer">Exams</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:156px" href="ControllerExamSchedulingDashboard.jsp">Schedule Exams</a></br>
		      <a class="dropdown_content_options" style="min-width:156px;top:40px" href="*">View Exam Schedule</a></br>
		    </div>
		</div>

		<div class="dropdown" style="left:1005px">
			<a style="text-decoration:none;cursor:pointer" >Results</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:162px"href="ControllerResultScheduling.jsp">Schedule Results</a></br>
		       <a class="dropdown_content_options" style="min-width:162px;top:40px" href="ControllerResultScheduling.html">View Results</a></br>
		    </div>
		</div>

		<div class="dropdown" style="left:1200px">
			<a style="text-decoration:none;cursor:pointer">Profile</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:153px" href="ControllerViewProfile.jsp">View Profile</a></br>
		      <a class="dropdown_content_options" style="min-width:153px;top:40px" href="#">Logout</a></br>
		    </div>
		</div>
	</div>
	
	
	<div class="body_bar">
	
		<%	
			int year = Integer.parseInt(request.getParameter("year"));
			System.out.println("Y:" + year);
			String examType = request.getParameter("examType");
			//HttpSession session = request.getSession();
			session.setAttribute("year", year);
			session.setAttribute("examType", examType);
			
			SubjectDao subjectDao = new SubjectDao();
		%>
		<%! int topAttr = 70; %>
		<%! void initTopAttr(){ topAttr = 70; } %>
		<%! void updateTopAttr(){ topAttr += 100; } %>
		
		<div style="height:700px;width:25%;position:absolute;top:100px;left:80px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">CE</p>
				<input type="hidden" name="branch" value="CE">
				<%
					initTopAttr();
					List<String> subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "CE");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" name="<%=subjectName%>Date">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime">
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime">
				
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
		<div style="height:700px;width:25%;position:absolute;top:100px;left:480px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">CSE</p>
				<input type="hidden" name="branch" value="CSE">
				<%
					initTopAttr();
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "CSE");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" onkeydown="return false" name="<%=subjectName%>">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime" >
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime" >
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
		<div style="height:700px;width:25%;position:absolute;top:100px;left:880px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">ECE</p>
				<input type="hidden" name="branch" value="ECE">
				<%
					initTopAttr();
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "ECE");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" name="<%=subjectName%>">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime">
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime">
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
		<div style="height:700px;width:25%;position:absolute;top:900px;left:80px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">EEE</p>
				<input type="hidden" name="branch" value="EEE">
				<%
					initTopAttr();
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "EEE");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" name="<%=subjectName%>">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime">
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime">
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
		<div style="height:700px;width:25%;position:absolute;top:900px;left:480px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">IT</p>
				<input type="hidden" name="branch" value="IT">
				<%
					initTopAttr();
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "IT");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" name="<%=subjectName%>">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime">
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime">
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
		<div style="height:700px;width:25%;position:absolute;top:900px;left:880px;background-color:#d0d7fb;border-radius:10px;">
			<form action="ControllerExamScheduling" method="post">
				<p style="left:130px;top:10px;position:absolute">ME</p>
				<input type="hidden" name="branch" value="ME">
				<%
					initTopAttr();
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "ME");
					for(String subjectName : subjectNames){
				%>
				<p style="left:50px;top:<%=topAttr%>px;position:absolute"><%=subjectName%><p>
				<input style="left:100px;top:<%=topAttr+10%>px;position:absolute" type="date" name="<%=subjectName%>">
				<input style="left:50px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>FromTime">
				<input style="left:170px;top:<%=topAttr+50%>px;position:absolute" type="time" name="<%=subjectName%>ToTime">
				<% updateTopAttr(); } %>
				<input style="left:130px;top:620px;position:absolute" type="Submit" name = "Submit" value="Submit">
			</form>
		</div>
		
	</div>
	
</body>



</html>
