<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="com.dto.ExamTask" import="com.dao.ExamTaskDao" import="com.dto.Descriptive" import="com.dao.DescriptiveDao" import="java.util.List" import="com.dao.Today"%>
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
	
		<div class="dropdown" style="left:240px">
			<a style="text-decoration:none">Courses</a>
			<div class="dropdown_content_box" style="left:0px">
		    	<a class="dropdown_content_options" style="min-width:188px" href="TeacherSubjectsDashboard.jsp">Register to Courses</a></br>
		    </div>
		</div>
		
		<div class="dropdown" style="left:510px">
			<a style="text-decoration:none" >Set Papers</a>
		    <div class="dropdown_content_box" style="left:0px">
		    	<%		
				String teacherId = (String)session.getAttribute("teacherId");
				SubjectDao subjectDao = new SubjectDao();
				List<Subject> subjects = subjectDao.getAllSubjectsByTeacherId(teacherId);
				Subject firstSubject = subjects.get(0);
				%>
				<form action="TeacherPaperSetting.jsp">
		    		<input type="hidden" name="YBSId" value="<%=firstSubject.getYBSId()%>">
		      		<input class="dropdown_content_options" style="min-width:212px;border:none;cursor:pointer" type="Submit" value="Setting Dashboard"></br>
		      	</form>
		      	<form action="#">
		      		<input class="dropdown_content_options" style="min-width:212px;border:none;cursor:pointer;top:40px" type="submit" value="Setting Status"></br>
		    	</form>
		    </div>
		</div>

		<div class="dropdown" style="left:800px">
			<a style="text-decoration:none">Evaluation & Marks</a>
		    <div class="dropdown_content_box" style="left:0px">
		    	<form action="TeacherEvaluation.jsp">
		    		<input type="hidden" name="YBSId" value="<%=firstSubject.getYBSId()%>">
		      		<input class="dropdown_content_options" style="min-width:284px;border:none;cursor:pointer" type="Submit" value="Evaluation Dashboard"></br>
		      	</form>
		      	<form action="#">
		      		<input class="dropdown_content_options" style="min-width:284px;border:none;cursor:pointer;top:40px" type="submit" value="Evaluation Status"></br>
		    	</form>
		    </div>
		</div>

		<div class="dropdown" style="left:1140px">
			<a style="text-decoration:none" >Profile</a>
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
		System.out.println("T:"+teacherId);
		initTopAttr();
		for(Subject subject : subjects){
			System.out.println("Y:" + subject.getYBSId());
		%>
		<form action="TeacherEvaluation.jsp">
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
	  		String asgn1OpenDate = "TBA", asgn1CloseDate = "TBA", asgn1Status = "TBA";
			String mid2OpenDate = "TBA", mid2CloseDate = "TBA", mid2Status = "TBA";
			String asgn2OpenDate = "TBA", asgn2CloseDate = "TBA", asgn2Status = "TBA";
			String semOpenDate = "TBA", semCloseDate = "TBA", semStatus = "TBA";
			String today = new Today().getToday();
			
			String YBSId = request.getParameter("YBSId");
			int year = new SubjectDao().getSubject(YBSId).getYear();
			
			ExamTaskDao examTaskDao = new ExamTaskDao();
			ExamTask mid1ExamTask = examTaskDao.getExamTask(year, "mid1");
			ExamTask mid2ExamTask = examTaskDao.getExamTask(year, "mid2");
			ExamTask semExamTask = examTaskDao.getExamTask(year, "sem");
			DescriptiveDao descriptiveDao = new DescriptiveDao();
			Descriptive mid1Desc = descriptiveDao.getDescriptive(YBSId, "mid1");
			Descriptive mid2Desc = descriptiveDao.getDescriptive(YBSId, "mid2");

			if(mid1ExamTask != null){
				System.out.println("HERE");
				mid1OpenDate = mid1ExamTask.getEvaluationOpenDate();
				mid1CloseDate = mid1ExamTask.getEvaluationCloseDate();
				if(mid1OpenDate != null && mid1CloseDate != null){
					if(today.compareTo(mid1CloseDate) > 0) mid1Status = "Expired";
					else if(today.compareTo(mid1OpenDate) >= 0 && today.compareTo(mid1CloseDate) <= 0) mid1Status = "Active";
					else if(today.compareTo(mid1OpenDate) < 0) mid1Status = "Opens Soon";
				}else{
					mid1OpenDate = "TBA";
					mid1CloseDate = "TBA";
				}
				
			}
			if(mid2ExamTask != null){
				mid2OpenDate = mid2ExamTask.getEvaluationOpenDate();
				mid2CloseDate = mid2ExamTask.getEvaluationCloseDate();
				if(mid2OpenDate != null && mid2CloseDate != null){
					if(today.compareTo(mid2CloseDate) > 0) mid2Status = "Expired";
					else if(today.compareTo(mid2OpenDate) >= 0 && today.compareTo(mid2CloseDate) <= 0) mid2Status = "Active";
					else if(today.compareTo(mid2OpenDate) < 0) mid2Status = "Opens Soon";
				}else{
					mid2OpenDate = "TBA";
					mid2CloseDate = "TBA";
				}
			}
			if(mid1Desc != null){
				asgn1OpenDate = mid1Desc.getAsgnCloseDate();
				asgn1CloseDate = mid1CloseDate;
				if(asgn1OpenDate != null && asgn1CloseDate != null){
					if(today.compareTo(asgn1CloseDate) > 0) asgn1Status = "Expired";
					else if(today.compareTo(asgn1OpenDate) >= 0 && today.compareTo(asgn1CloseDate) <= 0) asgn1Status = "Active";
					else if(today.compareTo(asgn1OpenDate) < 0) asgn1Status = "Opens Soon";
				}else if(asgn1OpenDate != null && asgn1CloseDate == null){
					if(today.compareTo(asgn1OpenDate) >= 0) asgn1Status = "Active";
					else if(today.compareTo(asgn1OpenDate) < 0) asgn1Status = "Opens Soon";
				}	
			}
			if(mid2Desc != null){
				asgn2OpenDate = mid2Desc.getAsgnCloseDate();
				asgn2CloseDate = mid2CloseDate;
				if(asgn2OpenDate != null && asgn2CloseDate != null){
					if(today.compareTo(asgn2CloseDate) > 0) asgn2Status = "Expired";
					else if(today.compareTo(asgn2OpenDate) >= 0 && today.compareTo(asgn2CloseDate) <= 0) asgn2Status = "Active";
					else if(today.compareTo(asgn2OpenDate) < 0) asgn2Status = "Opens Soon";
				}else if(asgn2OpenDate != null && asgn2CloseDate == null){
					if(today.compareTo(asgn2OpenDate) >= 0) asgn2Status = "Active";
					else if(today.compareTo(asgn2OpenDate) < 0) asgn2Status = "Opens Soon";
				}	
			}
			if(semExamTask != null){
				semOpenDate = semExamTask.getEvaluationOpenDate();
				semCloseDate = semExamTask.getEvaluationCloseDate();
				if(semOpenDate != null && semCloseDate != null){
					if(today.compareTo(semCloseDate) > 0) semStatus = "Expired";
					else if(today.compareTo(semOpenDate) >= 0 && today.compareTo(semCloseDate) <= 0) semStatus = "Active";
					else if(today.compareTo(semOpenDate) < 0) semStatus = "Opens Soon";
				}else{
					semOpenDate = "TBA";
					semCloseDate = "TBA";
				}
			}
			System.out.println("TS:" + mid1OpenDate + "@" + mid1CloseDate);
				
			%>

				<div style="height:550px;width:65%;position:absolute;top:40px;left:8%;background-color:#d0d7fb;border-radius:10px;">
					
				
					<p style="left:60px;top:60px;position:absolute;color:#0a2081;font-size:15px">Exam Type</p>
					<p style="left:205px;top:60px;position:absolute;color:#0a2081;font-size:15px">Start Date</p>
					<p style="left:355px;top:60px;position:absolute;color:#0a2081;font-size:15px">End Date</p>
					<p style="left:505px;top:60px;position:absolute;color:#0a2081;font-size:15px">Status</p>
					<p style="left:670px;top:60px;position:absolute;color:#0a2081;font-size:15px">Evaluate</p>
					
					<form action="TeacherDescEvaluation.jsp">
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
						<input type="submit" value="Evaluate" style="left:620px;top:120px;position:absolute;font-size:15px">
					</form>
					
					
					<form action="TeacherDescEvaluation.jsp">
						<input type="hidden" name="examType" value="asgn1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:230px;position:absolute;font-size:15px">Asgn 1</p>
						<p style="left:175px;top:240px;position:absolute;font-size:15px;width:150px"><%=asgn1OpenDate%></p>
						<p style="left:330px;top:240px;position:absolute;font-size:15px;width:150px"><%=asgn1CloseDate%></p>
						<input type="submit" value="Evaluate" style="left:620px;top:240px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherDescEvaluation.jsp">
						<input type="hidden" name="examType" value="mid2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:290px;position:absolute;font-size:15px">Mid 2 Desc</p>
						<p style="left:200px;top:290px;position:absolute;font-size:15px"><%=mid2OpenDate%></p>
						<p style="left:350px;top:290px;position:absolute;font-size:15px"><%=mid2CloseDate%></p>
						<p style="left:500px;top:290px;position:absolute;font-size:15px"><%=mid2Status%></p>
						<%
						if(!mid2Status.equals("Active")){
							%>
							<div style="height:35px;width:37%;position:absolute;top:300px;left:600px;cursor:not-allowed;z-index:1" ></div>
							<%
						}
						%>
						<input type="submit" value="Evaluate" style="left:620px;top:300px;position:absolute;font-size:15px">
					</form>
					
					
					<form action="TeacherDescEvaluation.jsp">
						<input type="hidden" name="examType" value="asgn2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<p style="left:60px;top:410px;position:absolute;font-size:15px">Asgn 2</p>
						<p style="left:200px;top:410px;position:absolute;font-size:15px"><%=asgn2OpenDate%></p>
						<p style="left:400px;top:410px;position:absolute;font-size:15px"><%=asgn2CloseDate%></p>
						<input type="submit" value="Evaluate" style="left:620px;top:420px;position:absolute;font-size:15px">
					</form>
					
					<form action="TeacherDescEvaluation.jsp">
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
						<input type="submit" value="Evaluate" style="left:620px;top:470px;position:absolute;font-size:15px">
					</form>	
				</div>
			 
	</div>
	
</body>


</html>
    