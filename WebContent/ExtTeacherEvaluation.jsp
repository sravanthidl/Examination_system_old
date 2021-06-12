<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.List" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - My Home</title>
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
	padding:20px 80px 20px 80px;
	border:none;
	cursor:pointer;
	background-color:#7382c8;
	color:#f7f7f7;
}
.subs:hover{background-color:#5a6bbc;}
.body_bar{
	position:absolute;
	background-color:white;
	height:84.5%;
	width:88%;
	top:15.5%;
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
input[type=submit]{
	text-align:center;
  padding: 5px 5px;
  text-decoration: none;
  cursor: pointer;
}
.disable_class{
  pointer-events: none;
  opacity: 0.3;
}
</style>

<body>

	<%
	ExtTeacherDao extTeacherDao = new ExtTeacherDao();
	SubjectDao subjectDao = new SubjectDao();
	SAMDao samDao = new SAMDao();
	ExamTaskDao examTaskDao = new ExamTaskDao();
	DescriptiveDao descriptiveDao = new DescriptiveDao();
	String extTeacherId = (String)session.getAttribute("extTeacherId");
	ExtTeacher extTeacher = extTeacherDao.getExtTeacher(extTeacherId);
	String YBSId = extTeacher.getYBSId(), subjectName = null;
	int sNo = 0, year = 0;
	if(YBSId != null){
		sNo = extTeacher.getSubjectSNo();
		year = (int)subjectDao.getSubject(YBSId).getYear();
		subjectName = subjectDao.getSubject(YBSId).getSubjectName();
	}
	%>
	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Evaluation <%if(YBSId != null){%> > Year <%=year%> > <%=subjectName%> <%}%></p>
	</div>
	
	<div class="top2"></div>
	
	<div class="vertical_menu_bar">
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		
		<i class='fas fa-check-double' style="position:absolute;top:167px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="ExtTeacherEvaluation.jsp">
		    <input type="hidden" name="YBSId" value="<%=YBSId%>">
		    <input class="options" style="top:148px;padding:17px 52px 17px 65px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Evaluation"></br>
		</form>
		
		<i class='fas fa-user-circle' style="position:absolute;top:227px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:208px;padding:17px 85px 17px 65px" href="ExtTeacherProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:287px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:268px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>	
	</div>

	<%if(YBSId == null){%>
	<div class="body_bar">
		<p style="position:absolute;top:60px;left:100px;font-size:25px">No scripts assigned yet! Check back later...</p>
	</div>
	<%}else{%>
	<div class="body_bar">
		<%! int counter = 1; %>
		<%! void initCounter(){ counter = 1; }%>
		<%
		Descriptive descriptive = descriptiveDao.getDescriptive(YBSId, "sem");
		List<ScriptsAndMarks> sams = samDao.getAllYBSScripts(YBSId);
		List<ScriptsAndMarks> filteredSams = new ArrayList<>();
		
		String openDate = "TBA", closeDate = "TBA", status = "TBA";
		year = new SubjectDao().getSubject(YBSId).getYear();
		ExamTask semExamTask = examTaskDao.getExamTask(year, "sem");
		String today = new Today().getToday();
		
		if(semExamTask != null){
			openDate = semExamTask.getEvaluationOpenDate();
			closeDate = semExamTask.getEvaluationCloseDate();
			if(openDate != null && closeDate != null){
				if(today.compareTo(closeDate) > 0) status = "Expired";
				else if(today.compareTo(openDate) >= 0 && today.compareTo(closeDate) <= 0) status = "Active";
				else if(today.compareTo(openDate) < 0) status = "Opens Soon";
			}else{
				openDate = "TBA";
				closeDate = "TBA";
			}
		}
		int startPaperNo = 5 * (sNo - 1), incrementer = 0;
		int index = startPaperNo + incrementer;
		while(incrementer < 5 && index < sams.size()){
			filteredSams.add(sams.get(index));
			incrementer++;
			index = startPaperNo + incrementer;
		}
		if(status.equals("Expired")){%>
			<p style="position:absolute;top:20px;left:60px;font-size:20px">Evaluation activity expired!</p>
		<%}else if(!status.equals("Active")){%>
			<p style="position:absolute;top:20px;left:60px;font-size:18px">Evaluation opens on <%=openDate%>...</p>
		<%}%>
		<div style="height:550px;width:35%;position:absolute;top:50px;left:380px" <%if(!status.equals("Active")){%>class="disable_class"<%}%> >
			<table id="tb">
				<tr>
					<th>S No.</th>
					<th>Script</th>
					<th>Marks</th>
				</tr>
				<tr>
					<td>Q Paper</td>
					<td><a href="pics/<%=descriptive.getQPaperPath()%>" target="_blank"><%=descriptive.getQPaperPath()%></a></td>
					<td>NA</td>
				</tr>
				<%
				initCounter();
				for(ScriptsAndMarks sam : filteredSams){
					if(sam.getSemScript() == null) continue;
				%>
				<tr>
					<form action="ExtTeacherScriptEvaluation.jsp">
						<input type="hidden" name="studentId" value="<%=sam.getStudentId()%>">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<input type="hidden" name="examType" value="sem">
						<td><input type="hidden" name="SNo" value="<%=counter%>"><%=counter%></td>
						<td><input type="Submit" name="script" value="<%=sam.getSemScript()%>" target="iframe_a"></td>
						<td><%=sam.getSemMarks()%></td>
					</form>
				</tr>
				<% counter++;} %>
			</table>
		</div>
	</div>
	<%}%>	
	
</body>

</html>
