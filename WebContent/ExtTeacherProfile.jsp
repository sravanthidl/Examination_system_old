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

</style>

<body>

	<%
	ExtTeacherDao extTeacherDao = new ExtTeacherDao();
	String extTeacherId = (String)session.getAttribute("extTeacherId");

	ExtTeacher extTeacher = extTeacherDao.getExtTeacher(extTeacherId);
	String YBSId = extTeacher.getYBSId();
	%>
	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Profile</p>
	</div>
	
	<div class="top2"></div>
	
	<div class="vertical_menu_bar">
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		
		<i class='fas fa-check-double' style="position:absolute;top:167px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="ExtTeacherEvaluation.jsp">
		    <input type="hidden" name="YBSId" value="<%=YBSId%>">
		    <input class="options" style="top:148px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Evaluation"></br>
		</form>
		
		<i class='fas fa-user-circle' style="position:absolute;top:227px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:208px;padding:17px 85px 17px 65px;background-color:#16181d;color:#80b5eb" href="ExtTeacherProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:287px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:268px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>
	</div>

	<div class="body_bar">
		<div style="height:450px;width:40%;position:absolute;top:90px;left:10%;background-color:#f2f2f2;border-radius:10px;box-shadow: 5px 5px #d9d9d9;">
			<img src="pics/profile_pic.png" style="width:150px;height:150px;left:180px;top:20px;position:absolute">
			
			<hr style="height:2px;width:80%;left:50px;top:170px;position:absolute;background-color:grey;border:none">
			<p style="left:80px;top:190px;position:absolute">Name<p>
			<p style="left:250px;top:190px;position:absolute;color:grey"><%=extTeacher.getName()%><p>
			<hr style="height:2px;width:80%;left:50px;top:220px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:240px;position:absolute">ExtTeacher Id<p>
			<p style="left:250px;top:240px;position:absolute;color:grey"><%=extTeacherId%><p>
			<hr style="height:2px;width:80%;left:50px;top:270px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:290px;position:absolute">Branch<p>
			<p style="left:250px;top:290px;position:absolute;color:grey"><%=extTeacher.getBranch()%><p>
			<hr style="height:2px;width:80%;left:50px;top:320px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:340px;position:absolute">Mobile<p>
			<p style="left:250px;top:340px;position:absolute;color:grey"><%=extTeacher.getMobile()%><p>
			<hr style="height:2px;width:80%;left:50px;top:370px;position:absolute;background-color:grey;border:none">
		</div>
	
		<div style="min-height:180px;width:100%;position:absolute;top:180px;left:300px">
			<p style="font-size:23px;top:-90px;left:540px;position:absolute"><strong>Password Reset</strong></p>
			<div style="height:300px;width:30%;position:absolute;top:-10px;left:35%;background-color:#f2f2f2;box-shadow: 5px 5px #d9d9d9;border-radius:10px;">
				<form action="PasswordReset" method="post" name="thisForm" onsubmit="return validateForm()">
					<input type="hidden" name="user" value="extTeacher">
					<p style="left:80px;top:32px;position:absolute">New Password<p>
					<input style="left:80px;top:76px;position:absolute" type="password" size="25" name="password" required>
					<p style="left:80px;top:106px;position:absolute">Confirm Password<p>
					<input style="left:80px;top:150px;position:absolute" type="password" size="25" name="rePassword" required>
					<input style="left:160px;top:215px;position:absolute" type="submit" value="Submit">
				</form>
			</div>
		</div>
	</div>	
	
</body>

</html>
