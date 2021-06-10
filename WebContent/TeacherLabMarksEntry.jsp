<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.List" %>
<!DOCTYPE html>
<html>
<title>ABIT EC - Evaluation</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body{font-family:arial;}
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
	padding:20px 40px 22px 40px;
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
  border: 1px solid #e4e4e4;
  padding: 8px;
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
	<%
	SubjectDao subjectDao = new SubjectDao();
	StudentDao studentDao = new StudentDao();
	LabMarksDao labMarksDao = new LabMarksDao();
	
	String teacherId = (String)session.getAttribute("teacherId");
	String YBSId = request.getParameter("YBSId");
	%>
	<%! int leftAttr = 100; %>
	<%! void initLeftAttr(){ leftAttr = 100; } %>
	<%! void updateLeftAttr(){ leftAttr += 265; } %>
	<%
	initLeftAttr();	
	List<Subject> theorySubjects = subjectDao.getSubjectsByParams(teacherId, "Theory");
	List<Subject> labSubjects = subjectDao.getSubjectsByParams(teacherId, "Lab");
	Subject firstTheorySubject = theorySubjects.get(0);
	Subject firstLabSubject = labSubjects.get(0);
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Lab Marks Entry > <%=subjectDao.getSubject(YBSId).getYear()%>-<%=subjectDao.getSubject(YBSId).getBranch()%>-<%=subjectDao.getSubject(YBSId).getSubjectName()%></p>
	</div>
	
	<div class="top2">
		<%for(Subject labSubject : labSubjects){%>
		<form action="TeacherLabMarksEntry.jsp">
			<input type="hidden" name="YBSId" value="<%=labSubject.getYBSId()%>">
			<%if(labSubject.getYBSId().equals(YBSId)){%>
			<input class="subs" style="left:<%=leftAttr%>px;background-color:#5a6bbc" type="submit" value="<%=labSubject.getYear()%>-<%=labSubject.getBranch()%>-<%=labSubject.getSubjectName()%>">
			<%}else{%>
			<input class="subs" style="left:<%=leftAttr%>px" type="submit" value="<%=labSubject.getYear()%>-<%=labSubject.getBranch()%>-<%=labSubject.getSubjectName()%>">
			<%}%>
		</form>
		<% updateLeftAttr(); }%>
	</div>
	
	<div class="vertical_menu_bar">
		<a href="TeacherHome.jsp"><div>
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		</div></a>
		
		<i class='fas fa-book-reader' style="position:absolute;top:167px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherRegisterSubjects.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:148px;padding:17px 69px 17px 65px;border:none;cursor:pointer" type="Submit" value="Courses"></br>
		</form>
		
		<i class="material-icons" style="position:absolute;top:227px;left:30px;color:#cccccc;z-index:1">perm_data_setting</i>
		<form action="TeacherPaperSetting.jsp">
			<input type="hidden" name="YBSId" value="<%=firstTheorySubject.getYBSId()%>">
		    <input class="options" style="top:208px;padding:17px 27px 17px 65px;border:none;cursor:pointer" type="Submit" value="Paper Setting"></br>
		</form>
		
		<i class='fas fa-check-double' style="position:absolute;top:287px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherEvaluation.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstTheorySubject.getYBSId()%>">
		    <input class="options" style="top:268px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Evaluation"></br>
		</form>
		
		<i class='fas fa-desktop' style="position:absolute;top:347px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherLabMarksEntry.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstLabSubject.getYBSId()%>">
		    <input class="options" style="top:327px;padding:17px 52px 17px 65px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Lab Marks"></br>
		</form>
		
		<i class='fas fa-user-circle' style="position:absolute;top:407px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:388px;padding:17px 85px 17px 65px" href="TeacherProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:467px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:448px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>
		
	</div>

	<div class="body_bar">
		<%		
	  	String mid1OpenDate = "TBA", mid1CloseDate = "TBA", mid1Status = "TBA";
	  	String asgn1OpenDate = "TBA", asgn1CloseDate = "TBA", asgn1Status = "TBA";
		String today = new Today().getToday();
			
		int year = new SubjectDao().getSubject(YBSId).getYear();
		String branch = new SubjectDao().getSubject(YBSId).getBranch();
		List<Student> students = studentDao.getStudents(year, branch);
		%>
			
		<div style="height:550px;width:35%;position:absolute;top:50px;left:400px;border-radius:10px">
			<form action="TeacherLabMarksEntry" method="post">
				<input type="hidden" name="YBSId" value="<%=YBSId%>">
				<table id="tb">
					<tr>
						<th width="220">Student Id</th>
						<th>Internal Marks</th>
						<th>External Marks</th>
					</tr>
					<%for(Student student : students){
						String studentId = student.getStudentId();
						int internalVal = 0, externalVal = 0;
						if(labMarksDao.getLabMarks(studentId, YBSId) != null){
							internalVal = labMarksDao.getLabMarks(studentId, YBSId).getInternalMarks();
							externalVal = labMarksDao.getLabMarks(studentId, YBSId).getExternalMarks();
						}
					%>
					<tr>
						<td><input type="hidden" name="<%=studentId%>studentId" value="<%=studentId%>"><%=studentId%></td>
						<td><input type="text" name="<%=studentId%>internalMarks" size="2" value="<%=internalVal%>" onfocus="this.value=''" pattern="([0-9])|([0-1][0-9])|([2][0-5])" required></td>
						<td><input type="text" name="<%=studentId%>externalMarks" size="2" value="<%=externalVal%>" onfocus="this.value=''" pattern="([0-9])|([0-6][0-9])|([7][0-5])" required></td>
					</tr>
					<%}%>
					<tr>
					<td></td>
					<td><input type="submit" name="InternalSubmit" value="Submit"></td>
					<td><input type="submit" name="ExternalSubmit" value="Submit"></td>
					</tr>
				</table>
			</form>	
		</div>

	</div>
	
</body>

</html>
    