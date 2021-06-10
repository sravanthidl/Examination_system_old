<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="com.dao.AcadYearDao" import="java.util.List" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - Register Subjects</title>
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
	padding:20px 100px 22px 100px;
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
.checkmark {
  height: 25px;
  width: 20px;
  margin-left:10px;
  margin-right:20px;
  background-color: #eee;
}
</style>

<body>
	<%int year = Integer.parseInt(request.getParameter("year"));%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">New Subjects > Year <%=year%> > Sem <%=new AcadYearDao().getSemester(year)%></p>
	</div>
	
	<div class="top2">
	
		<%!	int leftAttr = 110; %>
		<%! void initLeftAttr(){ leftAttr = 110; } %>
		<%! void updateLeftAttr(){ leftAttr += 250; } %>
		<%initLeftAttr();
		for(int i = 1; i <= 4; i++){%>
		<form action="TeacherRegisterSubjects.jsp">
			<input type="hidden" name="year" value="<%=i%>">
			<%if(i == year){%>
			<input class="subs" style="left:<%=leftAttr%>px;background-color:#5a6bbc" type="submit" value="Year <%=i%>">
			<%}else{%>
			<input class="subs" style="left:<%=leftAttr%>px" type="submit" value="Year <%=i%>">
			<%}%>
		</form>
		<%updateLeftAttr();}%>

	</div>
	
	<div class="vertical_menu_bar">
		<a href="TeacherHome.jsp"><div>
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		</div></a>
		
		<% 
		String teacherId = (String)session.getAttribute("teacherId");
		SubjectDao subjectDao = new SubjectDao();
		Subject firstTheorySubject = null, firstLabSubject = null;
		List<Subject> theorySubjects = subjectDao.getSubjectsByParams(teacherId, "Theory");
		List<Subject> labSubjects = subjectDao.getSubjectsByParams(teacherId, "Lab");
		if(theorySubjects.size() > 0) firstTheorySubject = theorySubjects.get(0);
		if(labSubjects.size() > 0) firstLabSubject = labSubjects.get(0);
		%>
		
		<i class='fas fa-book-reader' style="position:absolute;top:167px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherRegisterSubjects.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:148px;padding:17px 69px 17px 65px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Courses"></br>
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
		<a style="position:absolute;top:0px;left:1045px;padding:16px 50px 16px 50px;background-color:#5a6bbc;color:white;text-decoration:none;border-radius:5px" href="TeacherViewSubjects.jsp">My Subjects</a>
	
	
	<%
		session.setAttribute("year", year);
		session.setAttribute("teacherId", teacherId);
		List<String> branches = new ArrayList<>();
		branches.add("CE");branches.add("CSE");branches.add("ECE");branches.add("EEE");branches.add("IT");branches.add("ME");
		int branchIndex = 0;
	%>
		<div style="height:370px;width:45%;position:absolute;top:70px;left:25%">
			
			<form action="TeacherRegisterSubjects" method="post">
				<table id="tb">
				<%for(String branch : branches){%>
					<input type="hidden" name="branch<%=branchIndex + 1%>" value="<%=branch%>">
					<%	
					List<Subject> subjects = subjectDao.getSubjectsByParams(year, branch);
						if(subjects.size() > 0){
					%>
					<tr>
						<td rowspan="<%=subjects.size()%>" width="150px"><%=branch%></td>
						<td><%=subjects.get(0).getSubjectCategory()%></td>
						<td><input class="checkmark" type="checkbox" name="<%=subjects.get(0).getSubjectCode()%>" value="<%=subjects.get(0).getSubjectName()%>" <%if(subjects.get(0).getTeacherId() != null){%>checked disabled<%}%> >				
						<%=subjects.get(0).getSubjectName()%></td>
					</tr>
						<%for(int i = 1; i < subjects.size(); i++){%>
							<tr>
							<td><%=subjects.get(i).getSubjectCategory()%></td>
							<td><input class="checkmark"  type="checkbox" name="<%=subjects.get(i).getSubjectCode()%>" value="<%=subjects.get(i).getSubjectName()%>" <%if(subjects.get(i).getTeacherId() != null){%>checked disabled<%}%> >
							<%=subjects.get(i).getSubjectName()%></td>
							</tr>
						<%}}%>
				<%branchIndex++;}%>	
				</table>
				
				<input style="position:absolute;top:350px;left:200px" type="Submit" value="Register to Subjects">
				
			</form>
		</div>
	
</body>

</html>
    