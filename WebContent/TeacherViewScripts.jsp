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
</style>

<body>
	<% 
	SubjectDao subjectDao = new SubjectDao();
	SAMDao samDao = new SAMDao();
	DescriptiveDao descriptiveDao = new DescriptiveDao();
	String teacherId = (String)session.getAttribute("teacherId");
	String YBSId = request.getParameter("YBSId");
	String examType = request.getParameter("examType");
	
	List<Subject> theorySubjects = subjectDao.getSubjects(teacherId, "Theory");
	List<Subject> labSubjects = subjectDao.getSubjects(teacherId, "Lab");
	Subject firstTheorySubject = theorySubjects.get(0);
	Subject firstLabSubject = labSubjects.get(0);
	%>
	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Evaluation > <%=subjectDao.getSubject(YBSId).getYear()%>-<%=subjectDao.getSubject(YBSId).getBranch()%>-<%=subjectDao.getSubject(YBSId).getSubjectName()%> > <%=examType%> > All Scripts</p>
	</div>

	<div class="top2">
		<form action="TeacherEvaluation.jsp">
			<input type="hidden" name="YBSId" value="<%=YBSId%>">
		    <input style="position:absolute;top:18px;left:32px;;cursor:pointer;border:none;background-color:#7382c8;color:#e7e9f4;text-decoration:underline" type="Submit" value="&lt Back">
		</form>
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
		    <input class="options" style="top:268px;padding:17px 52px 17px 65px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Evaluation"></br>
		</form>
		
		<i class='fas fa-desktop' style="position:absolute;top:347px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherLabMarksEntry.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstLabSubject.getYBSId()%>">
		    <input class="options" style="top:327px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Lab Marks"></br>
		</form>
		
		<i class='fas fa-user-circle' style="position:absolute;top:407px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:388px;padding:17px 85px 17px 65px" href="TeacherProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:467px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:448px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>
	</div>
	
	<div class="body_bar">
		<%! int counter = 1; %>
		<%! void initCounter(){ counter = 1; }%>
		<%
		Descriptive descriptive = null;
		if(examType.equals("asgn1")) descriptive = descriptiveDao.getDescriptive(YBSId, "mid1");
		else if(examType.equals("asgn2")) descriptive = descriptiveDao.getDescriptive(YBSId, "mid2");
		else descriptive = descriptiveDao.getDescriptive(YBSId, examType);
		System.out.println(descriptive);
		List<ScriptsAndMarks> sams = samDao.getAllYBSScripts(YBSId);
		System.out.println(YBSId);
		%>
		<div style="height:550px;width:30%;position:absolute;top:50px;left:370px"><table id="tb">
			<tr>
				<th>S No.</th>
				<th width="220px">Script</th>
				<th>Marks</th>
			</tr>
			<tr>
				<td>Q Paper</td>
				<%if(examType.equals("mid1") || examType.equals("mid2")){%>
				<td><a href="pics/<%=descriptive.getQPaperPath()%>" target="_blank"><%=descriptive.getQPaperPath()%></a></td>
				<%}else{%>
				<td><a href="pics/<%=descriptive.getAsgnPaperPath()%>" target="_blank"><%=descriptive.getAsgnPaperPath()%></a></td>
				<%}%>		
				<td>NA</td>
			</tr>
			<%
			initCounter();
			for(ScriptsAndMarks sam : sams){
				if(examType.equals("mid1") && sam.getDesc1Script() == null) continue;
				else if(examType.equals("mid2") && sam.getDesc1Script() == null) continue;
				else if(examType.equals("asgn1") && sam.getDesc1Script() == null) continue;
				else if(examType.equals("asgn2") && sam.getDesc1Script() == null) continue;
			%>
			<tr>
				<form action="TeacherScriptEvaluation.jsp">
					<input type="hidden" name="studentId" value="<%=sam.getStudentId()%>">
					<input type="hidden" name="YBSId" value="<%=YBSId%>">
					<input type="hidden" name="examType" value="<%=examType%>">					
					<td><input type="hidden" name="SNo" value="<%=counter%>"><%=counter%></td>	
					<%if(examType.equals("mid1")){%>
					<td><input type="Submit" name="script" value="<%=sam.getDesc1Script()%>" target="iframe_a"></td>
					<td><%=sam.getDesc1Marks()%></td>
					<%}else if(examType.equals("mid2")){%>
					<td><input type="Submit" name="script" value="<%=sam.getDesc2Script()%>" target="iframe_a"></td>
					<td><%=sam.getDesc2Marks()%></td>
					<%} else if(examType.equals("asgn1")){%>
					<td><input type="Submit" name="script" value="<%=sam.getAsgn1Script()%>" target="iframe_a"></td>
					<td><%=sam.getAsgn1Marks()%></td>
					<%}else if(examType.equals("asgn2")){%>
					<td><input type="Submit" name="script" value="<%=sam.getAsgn2Script()%>" target="iframe_a"></td>
					<td><%=sam.getAsgn2Marks()%></td>
					<%}%>
				</form>
			</tr>
			<% counter++;} %>
			</table>
		</div>
	</div>
	
</body>

</html>