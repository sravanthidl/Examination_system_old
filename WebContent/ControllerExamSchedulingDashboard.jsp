<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.*" import="com.dto.*" import="java.util.List" %>
<!DOCTYPE html>
<html>
<title>ABIT EC - Schedule Exams</title>
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
	AcadYearDao acadYearDao = new AcadYearDao();
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Schedule Exams</p>
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
		<div style="height:350px;width:22%;position:absolute;top:100px;left:38%">
			<form action="ControllerExamScheduling.jsp">
				<p style="left:0px;top:60px;position:absolute">Year<p>
				<select style="left:0px;top:105px;position:absolute;width:80px" id="year" name="year">
					<option value="1">I</option>
				    <option value="2">II</option>
				    <option value="3">III</option>
				    <option value="4">IV</option>
				</select>
				<p style="left:150px;top:60px;position:absolute">Exam<p>
				<select style="left:150px;top:105px;position:absolute" name="examType">
				    <option value="mid1">Mid I</option>
				    <option value="mid2">Mid II</option>
				    <option value="sem">Semester</option>
				</select>
				<input style="position:absolute;left:-10px;top:160px;width:300px" type="Submit" value="Continue">				
			</form>
		</div>
	</div>
	
</body>

</html>
