<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="java.util.List" import="com.dto.Subject" import="com.dao.SubjectDao" import="com.dto.ExamTask" import="com.dao.ExamTaskDao" import="java.time.LocalDate" %>
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
		<form action="TeacherRegisterSubjects.jsp" method="post"">
			<input type="hidden" name="year" value="1">
			<input style="left:50px;top:100px;position:absolute" type="submit" value="Year I">
		</form>
		<form action="TeacherRegisterSubjects.jsp" method="post"">
			<input type="hidden" name="year" value="2">
			<input style="left:50px;top:220px;position:absolute" type="submit" value="Year II">
		</form>
		<form action="TeacherRegisterSubjects.jsp" method="post"">
			<input type="hidden" name="year" value="3">
			<input style="left:50px;top:340px;position:absolute" type="submit" value="Year III">
		</form>
		<form action="TeacherRegisterSubjects.jsp" method="post"">
			<input type="hidden" name="year" value="4">
			<input style="left:50px;top:460px;position:absolute" type="submit" value="Year IV">
		</form>
	</div>
	
	
	<div class="body_bar">
	<%
	if(subjects.size() == 0){
		%>
		<p>You did not take up any subject yet! </p>
		<%
	}else{ %>
		<p> Your subjects - </p>
		<% for(Subject subject : subjects){
			%>
			<p><%= subject.getYBSId() %> </p>
			<%
		}
	}
	%>
			  
	</div>
	
</body>

</html>
    