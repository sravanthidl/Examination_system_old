<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.TeacherDao" import="com.dao.SubjectDao" import="java.util.List"%>
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
	
	<%! int checkboxLeft = 120; %>
	<%! int labelLeft = 155; %>
	<%! public void initCheckBoxLeft(){
		checkboxLeft = 120;
		}%>
	<%! public void initLabelLeft(){
			labelLeft = 155;
		}%>
	
	<%! public int updateCheckBoxLeft(int check){
			check += 100;
			return check;
		}%>
	<%! public int updateLabelLeft(int label, int check){
			label = check + 35;
			return label;
		}%>
	
	<%
		int year = Integer.parseInt(request.getParameter("year"));
		session.setAttribute("year", year);
		String teacherId = (String)session.getAttribute("teacherId");
		session.setAttribute("teacherId", teacherId);
	%>
			<div style="height:370px;width:60%;position:absolute;top:100px;left:20%;background-color:#d0d7fb;border-radius:10px;">
			<form action="TeacherRegisterSubjects" method="post">
			
				<p style="left:50px;top:10px;position:absolute">CE</p>
				<input type="hidden" name="branch1" value="CE">
				<%
					SubjectDao subjectDao = new SubjectDao();
					List<String> subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "CE");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:25px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:25px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				
				<p style="left:50px;top:60px;position:absolute">CSE</p>
				<input type="hidden" name="branch2" value="CSE">
				<%
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "CSE");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:75px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:75px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				
				<p style="left:50px;top:110px;position:absolute">ECE</p>
				<input type="hidden" name="branch3" value="ECE">
				
				<%
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "ECE");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:125px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:125px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				
				<p style="left:50px;top:160px;position:absolute">EEE<p>
				<input type="hidden" name="branch4" value="EEE">
				<%
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "EEE");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:175px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:175px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				
				<p style="left:50px;top:210px;position:absolute">IT<p>
				<input type="hidden" name="branch5" value="IT">
				
				<%
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "IT");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:225px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:225px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				
				
				<p style="left:50px;top:260px;position:absolute">ME<p>
				<input type="hidden" name="branch6" value="ME">
				<%
					subjectNames = subjectDao.getAllSubjectNamesByYearAndBranch(year, "ME");
					if(subjectNames != null){
						initCheckBoxLeft();
						initLabelLeft();
						for(String subjectName : subjectNames){
							%>
							<input class="checkmark" style="left:<%=checkboxLeft%>px;top:275px;position:absolute" type="checkbox" name=<%=subjectName%> value=<%=subjectName%>>
							<label style="left:<%=labelLeft%>px;top:275px;position:absolute"><%=subjectName%></label>
							<%
							checkboxLeft = updateCheckBoxLeft(checkboxLeft);
							labelLeft = updateLabelLeft(labelLeft, checkboxLeft);
						}
					}
				%>
				<input style="left:330px;top:310px;position:absolute" type="submit" value="Register">
				</form>
				</div>
		<% 
		%>
			  
		</div>
	
</body>

</html>
    