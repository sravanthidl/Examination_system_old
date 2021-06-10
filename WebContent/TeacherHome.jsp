<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<title>ABIT EC - My Home</title>
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
	background-color:#f7f7f7;
	height:84.5%;
	width:88%;
	top:15.5%;
	left:14%;
}
#tb {
  border-collapse: collapse;
  width:35%;
}
#tb td, #tb th {
  white-space: nowrap;
  border: 0px solid #e4e4e4;
  padding: 12px;
  color:#585858;
  column-width:100px;
  text-align:center;
}
#tb th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #f7f7f7;
  color: #4a4a4a;
  text-align: center;
}

</style>

<body>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Home</p>
	</div>
	
	<div class="top2">
			<% String teacherId = (String)session.getAttribute("teacherId"); %>
			<p style="position:absolute;color:#f7f7f7;left:30px;top:0px;font-size:20px">Hi, <%=teacherId%> !</p>
	</div>
	
	<div class="vertical_menu_bar">
		<a href="TeacherHome.jsp"><div>
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		</div></a>
		
		<% 
		SubjectDao subjectDao = new SubjectDao();
		ExamTaskDao examTaskDao = new ExamTaskDao();
		String today = new Today().getToday();
		Subject firstTheorySubject = null, firstLabSubject = null;
		List<Subject> theorySubjects = subjectDao.getSubjectsByParams(teacherId, "Theory");
		List<Subject> labSubjects = subjectDao.getSubjectsByParams(teacherId, "Lab");
		if(theorySubjects.size() > 0) firstTheorySubject = theorySubjects.get(0);
		if(labSubjects.size() > 0) firstLabSubject = labSubjects.get(0);
		%>
		
		<i class='fas fa-book-reader' style="position:absolute;top:167px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherRegisterSubjects.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:148px;padding:17px 69px 17px 65px;border:none;cursor:pointer" type="Submit" value="Courses"></br>
		</form>
		
		<i class="material-icons" style="position:absolute;top:227px;left:30px;color:#cccccc;z-index:1">perm_data_setting</i>
		<%if(firstTheorySubject == null){%>
		<a class="options" style="top:208px;padding:17px 27px 17px 65px" href="TeacherRegisterSubjects.jsp">Paper Setting</a></br>
		<%}else{%>
		<form action="TeacherPaperSetting.jsp">
			<input type="hidden" name="YBSId" value="<%=firstTheorySubject.getYBSId()%>">
		    <input class="options" style="top:208px;padding:17px 27px 17px 65px;border:none;cursor:pointer" type="Submit" value="Paper Setting"></br>
		</form>
		<%}%>
		
		<i class='fas fa-check-double' style="position:absolute;top:287px;left:30px;color:#cccccc;z-index:1"></i>
		<%if(firstTheorySubject == null){%>
		<a class="options" style="top:268px;padding:17px 52px 17px 65px" href="TeacherRegisterSubjects.jsp">Evaluation</a></br>
		<%}else{%>
		<form action="TeacherEvaluation.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstTheorySubject.getYBSId()%>">
		    <input class="options" style="top:268px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Evaluation"></br>
		</form>
		<%}%>
		
		<i class='fas fa-desktop' style="position:absolute;top:347px;left:30px;color:#cccccc;z-index:1"></i>
		<%if(firstLabSubject == null){%>
		<a class="options" style="top:327px;padding:17px 52px 17px 65px" href="TeacherRegisterSubjects.jsp">Lab Marks</a></br>
		<%}else{%>
		<form action="TeacherLabMarksEntry.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstLabSubject.getYBSId()%>">
		    <input class="options" style="top:327px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Lab Marks"></br>
		</form>
		<%}%>
		
		<i class='fas fa-user-circle' style="position:absolute;top:407px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:388px;padding:17px 85px 17px 65px" href="TeacherProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:467px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:448px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>
		
	</div>
	
	
	<div class="body_bar">
		<p style="font-size:20px;top:25px;left:70px;position:absolute">Quick access</p>
		<% 
			List<Subject> subjects = subjectDao.getSubjectsByParams(teacherId, "Theory");
			HashSet<Integer> yearsTaken = new HashSet<>();
			for(Subject subject : subjects) yearsTaken.add(subject.getYear());%>
			<table id="tb" style="position:absolute;top:120px;left:160px">
			<% for(Integer year : yearsTaken){
				List<ExamTask> examTasks = examTaskDao.getExamTask(year);
				for(ExamTask examTask : examTasks){
					String openDate = examTask.getSettingOpenDate(), closeDate = examTask.getSettingCloseDate();
					if(openDate != null && today.compareTo(openDate) >= 0 && today.compareTo(closeDate) <= 0){%>
						<tr>
							<td>Paper Setting for Year <%=year%> <%=examTask.getExamType()%> exams is open</td>
							<td>
							<form action="TeacherPaperSetting.jsp">
								<input type="hidden" name="YBSId" value="<%=subjectDao.getYBSIdFromSubjectList(subjects, year)%>">
								<input type="Submit" value="Go">
							</form>
							</td>
						</tr>
					<%
					}
					openDate = examTask.getEvaluationOpenDate(); closeDate = examTask.getEvaluationCloseDate();
					if(openDate != null && today.compareTo(openDate) >= 0 && today.compareTo(closeDate) <= 0){%>
						<tr>
						<td>Paper Evaluation for Year <%=year%> <%=examTask.getExamType()%> exams is open</td>
						<td>
							<form action="TeacherEvaluation.jsp">
								<input type="hidden" name="YBSId" value="<%=subjectDao.getYBSIdFromSubjectList(subjects, year)%>">
								<input type="Submit" value="Go">
							</form>
							</td>
						</tr>
					<%}}}%>	
		</table>
			
		</div>
	
	
</body>
</html>
