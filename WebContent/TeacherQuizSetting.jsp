<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.Subject" import="com.dao.SubjectDao" import="com.dto.ExamTask" import="com.dao.ExamTaskDao" import="java.util.List" import="java.time.LocalDate" %>%>
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
.body_bar{
	background-color:#f0f0f0;
	height:2200px;
	width:90%;
	position:absolute;
	top:180px;
	left:5%;
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
	
	
	<div class="body_bar">
	
		<%! int noOfQs = 5; %>
		<%! int topAttr = 60; %>
		<%! public void initTopAttr(){ topAttr = 100; } %>
		<%! public void UpdateTopAttr(){ topAttr += 125; } %>
	
		<% initTopAttr();
			String YBSId = (String)request.getParameter("YBSId");
			String examType = (String)request.getParameter("examType");
			session.setAttribute("YBSId", YBSId);
			session.setAttribute("examType", examType);
			System.out.println("YBS:" + YBSId);
			System.out.println("examType:" + examType);
			
			%>
			<p style="left:40px;top:15px;position:absolute;color:#0a2081;font-size:20px">Currently setting : <%=YBSId%> - <%=examType%></p>
			<form action="TeacherQuizSetting" method="post" id="thisForm" onsubmit="return validateForm()">
			<% for(int i = 1; i <= noOfQs; i++){ %>
					<div style="height:100px;width:95%;position:absolute;top:<%=topAttr%>px;left:2.5%;background-color:#d0d7fb;border-radius:10px;">
						<p style="left:170px;top:-8px;position:absolute">Q<%=i%><p>
						<input type="hidden" name="questionNo<%=i%>" value="<%=i%>">
						<textarea name="question<%=i%>" rows="2" cols="30" style="left:30px;top:37px;position:absolute"></textarea>
						<p style="left:410px;top:0px;position:absolute">Option A<p>
						<textarea name="optionA<%=i%>" rows="1" cols="15" style="left:365px;top:50px;position:absolute"></textarea>
						<p style="left:610px;top:0px;position:absolute">Option B<p>
						<textarea name="optionB<%=i%>" rows="1" cols="15" style="left:565px;top:50px;position:absolute"></textarea>
						<p style="left:810px;top:0px;position:absolute">Option C<p>
						<textarea name="optionC<%=i%>" rows="1" cols="15" style="left:765px;top:50px;position:absolute"></textarea>
						<p style="left:1010px;top:0px;position:absolute">Option D<p>
						<textarea name="optionD<%=i%>" rows="1" cols="15" style="left:965px;top:50px;position:absolute"></textarea>
						<p style="left:1150px;top:0px;position:absolute">Answer<p>
						<textarea name="answerOption<%=i%>" rows="1" cols="2" style="left:1160px;top:50px;position:absolute"></textarea>
					</div>
					<% 
					UpdateTopAttr();
				}%>
				<input style="left:600px;top:<%=topAttr%>px;position:absolute" type="Submit" value="Set Quiz">
			</form>
	</div>
	
</body>

<script>
function validateForm() {
  var x = document.getElementById("thisForm");
  var i, nullCount = 0;
  for (i = 0; i < x.length; i++) {
	  if((x.elements[i].value) == "") nullCount++;
  }
  if(nullCount > 0){
	  alert("All fields should be filled!");
	  return false;
  }
}
</script>

</html>
