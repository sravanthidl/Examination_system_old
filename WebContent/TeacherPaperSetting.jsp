<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="com.dto.ExamTask" import="com.dao.ExamTaskDao" import="java.util.List" import="java.time.LocalDate" %>
<!DOCTYPE html>
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
.vertical_menu_bar{
	position:absolute;
	background-color:#b9c4f9;
	height:78%;
	width:13%;
	text-decoration:none;
	font-size:17px;
	top:180px;
	left:0px;
}

.body_bar{
	background-color:#f0f0f0;
	height:620px;
	width:90%;
	position:absolute;
	top:180px;
	left:13%;
}

.dropdown {
	position:absolute;
	padding:12.5px 60px;
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

.button {
  border: none;
  color: white;
  padding: 8px 12px;
  text-align: center;
  text-decoration: none;
  font-size: 15px;
  cursor: pointer;
  background-color: #a1aff7;
  color:black;
  border-radius:5px;
  box-shadow: 3px 3px #8a9af5;
}

.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #eee;
}



</style>

<body>
	<div class="head_bar">
		<div class="head1_bar">XYZ Institute of Technology</div>
		<div class="head2_bar">(Autonomous)</div> 
		<div class="head3_bar">Examination Corner</div>
	</div>
	
	<div class="menu_bar">
	
	<div class="dropdown" style="left:190px">
			<a style="text-decoration:none" href="#" >Courses</a>
			<div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:188px" href="TeacherSubjectsDashboard.jsp">Register to Courses</a></br>
		    </div>
		</div>
		
		<div class="dropdown" style="left:460px">
			<a style="text-decoration:none" href="#" >Set Papers</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:212px" href="TeacherSettingDashboard.jsp">Setting Dashboard</a></br>
		      <a class="dropdown_content_options" style="min-width:212px;top:40px" href="#">Setting Status</a></br>
		    </div>
		</div>

		<div class="dropdown" style="left:750px">
			<a style="text-decoration:none" href="#" >Evaluation & Marks</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:257px" href="TeacherEvaluationDashboard.jsp">Evaluation Dashboard</a></br>
		      <a class="dropdown_content_options" style="min-width:257px;top:40px" href="#">Evaluation Status</a></br>
		    </div>
		</div>

		<div class="dropdown" style="left:1090px">
			<a style="text-decoration:none" href="#" >Profile</a>
		    <div class="dropdown_content_box" style="left:0px">
		      <a class="dropdown_content_options" style="min-width:173px"href="TeacherViewProfile.jsp">View Profile</a></br>
		       <a class="dropdown_content_options" style="min-width:173px;top:40px" href="AllLoginPage.html">Logout</a></br>
		    </div>
		</div>
		
	</div>
	
	<div class="vertical_menu_bar">
		<%! int topAttr = 100; %>
		<%! void initTopAttr(){ topAttr = 100; } %>
		<%! void updateTopAttr(){ topAttr += 120; } %>
		<%		
		String teacherId = (String)session.getAttribute("teacherId");
		SubjectDao subjectDao = new SubjectDao();
		List<Subject> subjects = subjectDao.getAllSubjectsByTeacherId(teacherId);
		initTopAttr();
		for(Subject subject : subjects){	
		%>
		<form action="TeacherPaperSetting.jsp" method="Post"">
			<input type="hidden" name="YBSId" value="<%=subject.getYBSId()%>">
			<input style="left:40px;top:<%=topAttr%>px;position:absolute" type="submit" value="<%=subject.getYear()%>-<%=subject.getBranch()%>-<%=subject.getSubjectName()%>">
		</form>
		<% updateTopAttr(); }%>
	</div>
	
	
 	<div class="body_bar">
		
	  	<%		
			//System.out.println(teacherId);
	  		//System.out.println("YOO:" + YBSId);
	  		String mid1OpenDate = "TBA", mid1CloseDate = "TBA", mid1Status = "TBA";
			String mid2OpenDate = "TBA", mid2CloseDate = "TBA", mid2Status = "TBA";
			String semOpenDate = "TBA", semCloseDate = "TBA", semStatus = "TBA";
			String today = LocalDate.now().toString();
			
			String YBSId = request.getParameter("YBSId");
			int year = new SubjectDao().getSubject(YBSId).getYear();
			
			ExamTaskDao examTaskDao = new ExamTaskDao();
			ExamTask mid1ExamTask = examTaskDao.getExamTask(year, "mid1");
			ExamTask mid2ExamTask = examTaskDao.getExamTask(year, "mid2");
			ExamTask semExamTask = examTaskDao.getExamTask(year, "sem");
			//9177530529
			if(mid1ExamTask != null){
				System.out.println("HERE");
				mid1OpenDate = mid1ExamTask.getSettingOpenDate();
				mid1CloseDate = mid1ExamTask.getSettingCloseDate();
				if(today.compareTo(mid1CloseDate) > 0) mid1Status = "Expired";
				else if(today.compareTo(mid1OpenDate) >= 0 && today.compareTo(mid1CloseDate) <= 0) mid1Status = "Active";
				else if(today.compareTo(mid1OpenDate) < 0) mid1Status = "Opens Soon";
			}
			if(mid2ExamTask != null){
				mid2OpenDate = mid2ExamTask.getSettingOpenDate();
				mid2CloseDate = mid2ExamTask.getSettingCloseDate();
				if(today.compareTo(mid2CloseDate) > 0) mid2Status = "Expired";
				else if(today.compareTo(mid2OpenDate) >= 0 && today.compareTo(mid2CloseDate) <= 0) mid2Status = "Active";
				else if(today.compareTo(mid2OpenDate) < 0) mid2Status = "Opens Soon";
			}
			if(semExamTask != null){
				semOpenDate = semExamTask.getSettingOpenDate();
				semCloseDate = semExamTask.getSettingCloseDate();
				if(today.compareTo(semCloseDate) > 0) semStatus = "Expired";
				else if(today.compareTo(semOpenDate) >= 0 && today.compareTo(semCloseDate) <= 0) semStatus = "Active";
				else if(today.compareTo(semOpenDate) < 0) semStatus = "Opens Soon";
			}
			System.out.println("TS:" + mid1OpenDate + "@" + mid1CloseDate);
				
			%>

				<div style="height:550px;width:80%;position:absolute;top:40px;left:8%;background-color:#d0d7fb;border-radius:10px;">
					
				
					<p style="left:60px;top:60px;position:absolute;color:#0a2081;font-size:15px">Exam Type</p>
					<p style="left:205px;top:60px;position:absolute;color:#0a2081;font-size:15px">Start Date</p>
					<p style="left:355px;top:60px;position:absolute;color:#0a2081;font-size:15px">End Date</p>
					<p style="left:505px;top:60px;position:absolute;color:#0a2081;font-size:15px">Status</p>
					<p style="left:670px;top:60px;position:absolute;color:#0a2081;font-size:15px">Upload/Create</p>
					
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="mid1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:110px;position:absolute;font-size:15px">Mid 1 Desc</p>
						<p style="left:200px;top:110px;position:absolute;font-size:15px"><%=mid1OpenDate%></p>
						<p style="left:350px;top:110px;position:absolute;font-size:15px"><%=mid1CloseDate%></p>
						<p style="left:500px;top:110px;position:absolute;font-size:15px"><%=mid1Status%></p>
						<%
						if(!mid1Status.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:120px;left:620px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="file" name="file" style="left:620px;top:120px;position:absolute;font-size:15px" required>
						<input type="submit" value="Upload" style="left:900px;top:120px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherQuizSetting.jsp">
						<input type="hidden" name="examType" value="quiz1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:170px;position:absolute;font-size:15px">Mid 1 Quiz</p>
						<p style="left:200px;top:170px;position:absolute;font-size:15px"><%=mid1OpenDate%></p>
						<p style="left:350px;top:170px;position:absolute;font-size:15px"><%=mid1CloseDate%></p>
						<p style="left:500px;top:170px;position:absolute;font-size:15px"><%=mid1Status%></p>
						<%
						if(!mid1Status.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:180px;left:680px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="submit" value="Create Quiz" style="left:680px;top:180px;position:absolute">
					</form>
					
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="asgn1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:230px;position:absolute;font-size:15px">Asgn 1</p>
						<input style="left:175px;top:240px;position:absolute;font-size:15px;width:150px" type="date" onkeydown="return false" name="openDate" required>
						<input style="left:330px;top:240px;position:absolute;font-size:15px;width:150px" type="date" onkeydown="return false" name="closeDate" required>
						<input type="file" name="file" style="left:620px;top:240px;position:absolute;font-size:15px" required>
						<input type="submit" value="Upload" style="left:900px;top:240px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="mid2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:290px;position:absolute;font-size:15px">Mid 2 Desc</p>
						<p style="left:200px;top:290px;position:absolute;font-size:15px"><%=mid2OpenDate%></p>
						<p style="left:350px;top:290px;position:absolute;font-size:15px"><%=mid2CloseDate%></p>
						<p style="left:500px;top:290px;position:absolute;font-size:15px"><%=mid2Status%></p>
						<input type="file" name="file" style="left:620px;top:300px;position:absolute;font-size:15px" required>
						<%
						if(!mid2Status.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:300px;left:600px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="submit" value="Upload" style="left:900px;top:300px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherQuizSetting.jsp">
						<input type="hidden" name="examType" value="quiz2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:350px;position:absolute;font-size:15px">Mid 2 Quiz</p>
						<p style="left:200px;top:350px;position:absolute;font-size:15px"><%=mid2OpenDate%></p>
						<p style="left:350px;top:350px;position:absolute;font-size:15px"><%=mid2CloseDate%></p>
						<p style="left:500px;top:350px;position:absolute;font-size:15px"><%=mid2Status%></p>
						<%
						if(!mid2Status.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:360px;left:680px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="submit" value="Create Quiz" style="left:680px;top:360px;position:absolute">
					</form>
					
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="asgn2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:410px;position:absolute;font-size:15px">Asgn 2</p>
						<input style="left:200px;top:410px;position:absolute;font-size:15px" type="date" onkeydown="return false" name="openDate" required>
						<input style="left:400px;top:410px;position:absolute;font-size:15px" type="date" onkeydown="return false" name="closeDate" required>
						<input type="file" name="file" style="left:620px;top:420px;position:absolute;font-size:15px" required>
						<input type="submit" value="Upload" style="left:900px;top:420px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="sem">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:460px;position:absolute;font-size:15px">Semester</p>
						<p style="left:200px;top:460px;position:absolute;font-size:15px"><%=semOpenDate%></p>
						<p style="left:350px;top:460px;position:absolute;font-size:15px"><%=semCloseDate%></p>
						<p style="left:500px;top:460px;position:absolute;font-size:15px"><%=semStatus%></p>
						<%
						if(!semStatus.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:470px;left:620px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="file" name="file" style="left:620px;top:470px;position:absolute;font-size:15px" required>
						<input type="submit" value="Upload" style="left:900px;top:470px;position:absolute;font-size:15px">
					</form>	
				</div>
		</div> 	
</body>


</html>
    