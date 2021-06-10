<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.DescriptiveDao" import="com.dto.Descriptive" import="com.dao.AcadYearDao" import="com.dto.ExamTask" import="com.dto.Subject" import="com.dao.SubjectDao" import="java.util.List" import="java.util.ArrayList" import="com.dao.Today" %>
<!DOCTYPE html>
<html>
<title>ABIT EC - Schedule Exams</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body{
	font-family:arial;
}
.vertical_menu_bar{
	position:absolute;
	background-color:#30333d;
	height:100%;
	width:14%;
	text-decoration:none;
	font-size:17px;
	top:0px;
	left:0px;
	z-index:1;
}
.clgName{
	font-size:35px;
	color:#b3b3b3;
	top:-10px;
	padding-left:57px;
	position:absolute;
}
.tag{
	font-size:15px;
	color:#b3b3b3;
	padding-left:42px;
	padding-top:55px;
	position:absolute;
}
.options{
	position:absolute;
	background-color:#30333d;
	color:#cccccc;
	font-size:18px;
	text-decoration:none;
}
.options:hover{
	background-color:#16181d;
	color:#80b5eb;
}

.top1{
	position:absolute;
	background-color:#5a6bbc;
	height:57px;
	width:86%;
	text-decoration:none;
	font-size:17px;
	top:0px;
	left:202px;
}
.top2{
	position:absolute;
	background-color:#7382c8;
	height:67px;
	width:86%;
	text-decoration:none;
	font-size:17px;
	top:57px;
	left:202px;
}
.subs{
	position:absolute;
	top:0px;
	padding:20px 80px 20px 80px;
	border:none;
	cursor:pointer;
	background-color:#7382c8;
	color:#f7f7f7;
}
.subs:hover{
	background-color:#5a6bbc;
}
.body_bar{
	position:absolute;
	background-color:white;
	height:83%;
	width:88%;
	top:17%;
	left:14%;
}
#tb {
  border-collapse: collapse;
  width: 100%;
}
#tb td, #tb th {
  white-space: nowrap;
  border: 1px solid #e4e4e4;
  padding: 10px;
  color:#585858;
  column-width:100px;
  text-align:center;
}
#tb th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #f7f7f7;
  color: #4a4a4a;
  text-align: center;
}
input[type=text]::placeholder { 
     text-align: center;
}
input[type=text]{ 
     text-align: center;
}

</style>

<body>
	<%
	int year = Integer.parseInt(request.getParameter("year"));
	int semester = new AcadYearDao().getSemester(year);
	String examType = request.getParameter("examType");
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Schedule Exams > Year <%=year%> > Sem <%=semester%> > <%=examType%></p>
	</div>
	
	<div class="top2"></div>
	
		<div class="vertical_menu_bar">
			<p class="clgName"><strong>ABIT</strong></p>
			<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
			<p class="tag"> EXAM CORNER</p>
			
			<i class="fa fa-refresh" style="position:absolute;top:160px;left:22px;color:#cccccc;z-index:1"></i>
			<a class="options" style="position:absolute;top:140px;padding:17px 31px 17px 52px" href="ControllerNewSemester.jsp">New Semester</a></br>
			
			<i class='fas fa-book-open' style="position:absolute;top:220px;left:22px;color:#cccccc;z-index:1"></i>
			<form action="ControllerRegisterSubjects.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:200px;padding:17px 80px 17px 55px;border:none;cursor:pointer" type="Submit" value="Courses"></br>
			</form>
			
			<i class="material-icons" style="position:absolute;top:280px;left:22px;color:#cccccc;z-index:1">perm_data_setting</i>
			<form action="ControllerSettingScheduling.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:260px;padding:17px 35px 17px 56px;border:none;cursor:pointer" type="Submit" value="Paper Setting"></br>
			</form>
			
			<i class='fas fa-edit' style="position:absolute;top:340px;left:22px;color:#cccccc;z-index:1"></i>
			<a class="options" style="top:320px;padding:17px 90px 17px 57px;background-color:#16181d;color:#80b5eb" href="ControllerExamSchedulingDashboard.jsp">Exams</a>
			
			<i class='fas fa-check-double' style="position:absolute;top:400px;left:22px;color:#cccccc;z-index:1"></i>
			<form action="ControllerEvaluationScheduling.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:380px;padding:17px 61px 17px 57px;border:none;cursor:pointer" type="Submit" value="Evaluation"></br>
			</form>
			
			<i class='fas fa-chalkboard-teacher' style="position:absolute;top:460px;left:22px;color:#cccccc;z-index:1"></i>
			<form action="ControllerExtTeacherMap.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:440px;padding:17px 29px 17px 57px;border:none;cursor:pointer" type="Submit" value="Map Externals"></br>
			</form>
			
			<i class="material-icons" style="position:absolute;top:515px;left:22px;color:#cccccc;z-index:1">grade</i>
			<form action="ControllerResultScheduling.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:500px;padding:17px 85px 17px 57px;border:none;cursor:pointer" type="Submit" value="Results"></br>
			</form>
			
			<i class='fas fa-user-circle' style="position:absolute;top:580px;left:22px;color:#cccccc;z-index:1"></i>
			<a class="options" style="top:560px;padding:17px 90px 17px 60px" href="ControllerViewProfile.jsp">Profile</a>
			
			<i class='fa fa-sign-out' style="position:absolute;top:640px;left:22px;color:#cccccc;z-index:1;font-size:23px"></i>
			<a class="options" style="top:620px;padding:17px 87px 17px 60px" href="AllLoginPage.html">Logout</a>
		
	</div>
	
	
	<div class="body_bar">
	
		<%	
			ArrayList<String> branches = new ArrayList<>();
			branches.add("CE");branches.add("CSE");branches.add("ECE");branches.add("EEE");branches.add("IT");branches.add("ME");
			SubjectDao subjectDao = new SubjectDao();
			DescriptiveDao descriptiveDao = new DescriptiveDao();
		%>
		
		
		<div style="width:55%;position:absolute;top:20px;left:300px;">
			
			<table id="tb">
				<tr>
					<th width="230px">Subject</th>
					<th width="180px">Exam Date</th>
					<th>Open Time</th>
					<th>Close Time</th>
				</tr>
			</table>
			
			<%for(String branch : branches){%>
			
			<table id="tb">
				<form action="ControllerExamScheduling" method="post">
					<td style="background-color: #f7f7f7" colspan="5" height=15 ><%=branch%></td>
					<input type="hidden" name="examType" value="<%=examType%>">
					<%
						List<Subject> subjects = subjectDao.getSubjectsByParams(year, branch, "Theory");
						for(Subject subject : subjects){
							String subjectName = subject.getSubjectName();
							String subjectCode = subject.getSubjectCode();
							String YBSId = year + "/" + branch + "/" + subjectCode;
							Descriptive descriptive = descriptiveDao.getDescriptive(YBSId, examType);
					%>
					<tr>
					<td><input type="hidden" name="<%=YBSId%>" value="<%=YBSId%>"><%=subjectName%></td>
					<%if(descriptive != null && descriptive.getExamDate() != null){%>
					<td><input type="text" style="border:none;color:#585858;width:130px" name="<%=subjectName%>Date" placeholder="<%=descriptive.getExamDate()%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" required></td>
					<td><input type="text" style="border:none;color:#585858;width:100px" name="<%=subjectName%>FromTime" placeholder="<%=descriptive.getExamOpenTime()%>" onfocus="(this.type='time')" onblur="(this.type='text')" required></td>
					<td><input type="text" style="border:none;color:#585858;width:100px" name="<%=subjectName%>ToTime" placeholder="<%=descriptive.getExamCloseTime()%>" onfocus="(this.type='time')" onblur="(this.type='text')" required></td>
					<%}else{%>
					<td><input type="date" name="<%=subjectName%>Date" style="width:135px" onkeydown="return false" required></td>
					<td><input  type="time" name="<%=subjectName%>FromTime" required></td>
					<td><input type="time" name="<%=subjectName%>ToTime" required></td>
					<%}%>
					</tr>
					<%}if(subjects.size() > 0){%>
					<tr><td colspan="4"><input style="width:678px" name="Submit" type="Submit" value="Submit"></td></tr>
					<%}%>
				</form>
			</table>
					
			<%}%>

		</div>
	</div>
	
</body>

</html>
