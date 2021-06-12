<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

.vertical_menu_bar{
	position:absolute;
	background-color:#30333d;
	height:100%;
	width:35%;
	text-decoration:none;
	font-size:17px;
	top:0px;
	left:0px;
	z-index:1;
}
.clgName{
	font-size:60px;
	color:#b3b3b3;
	top:30px;
	left:170px;
	position:absolute;
}
.tag{
	font-size:30px;
	color:#b3b3b3;
	left:65px;
	top:150px;
	position:absolute;
}
.body_bar{
	background-color:white;
	height:798px;
	width:90%;
	position:absolute;
	top:0px;
	left:35%;
}
body{font-family:arial;}
input[type=Submit] {
  color: white;
  padding: 6px 20px;
  border: none;
  cursor: pointer;
  width: 80%;
  background:#5a6bbc;
}

</style>

<body>
	<div class="vertical_menu_bar">
		<p class="clgName"><strong>ABIT</strong></p>
		<p class="tag">Online Examination Corner</p>	
		<img src="pics/picture.png" width="600" height="600" style="position:absolute;top:195px;left:-50px">
	</div>
	
	<div class="body_bar">
		<div style="height:540px;width:40%;position:absolute;top:110px;left:17%;border:2px solid #5a6bbc;border-radius:10px;">
			<p style="font-size:23px;top:0px;left:120px;position:absolute"><strong>External Teacher Sign up</strong></p>
			<form action="ExtTeacherChooseSubject.jsp" name="thisForm" onsubmit="return validateForm()">
				<p style="left:70px;top:90px;position:absolute">Ext. Teacher Pass Key<p>
				<input style="left:230px;top:100px;position:absolute" size="25" type="password" name="passkey" required>
				<p style="left:70px;top:140px;position:absolute">Full Name<p>
				<input style="left:230px;top:150px;position:absolute" size="25" type="text" name="name" required>
				<p style="left:70px;top:190px;position:absolute">ExtTeacher Id<p>
				<input style="left:230px;top:200px;position:absolute" size="25" type="text" name="extTeacherId" required>			
				<p style="left:70px;top:240px;position:absolute">Password<p>
				<input style="left:230px;top:250px;position:absolute" size="25" type="password" name="password" required>			
				<p style="left:70px;top:290px;position:absolute">Confirm Password<p>
				<input style="left:230px;top:300px;position:absolute" size="25" type="password" name="rePassword" required>
				<p style="left:70px;top:340px;position:absolute">Branch<p>
				<select style="left:230px;top:350px;position:absolute;width:213px;height:28px" name="branch" required>
				    <option value="BS">Basic Science</option>
				    <option value="CE">CE</option>
				    <option value="CSE">CSE</option>
				    <option value="ECE">ECE</option>
				    <option value="EEE">EEE</option>
				    <option value="IT">IT</option>
				    <option value="ME">ME</option>
			  	</select>			
				<p style="left:70px;top:390px;position:absolute">Mobile<p>
				<input style="left:230px;top:400px;position:absolute" size="25" type="tel" name="mobile" pattern="[0-9]{10}" required>			
				<input style="left:60px;top:460px;position:absolute" type="submit" value="Continue">
			</form>
		</div>
	</div>
	
</body>

<script>
function validateForm(){
	var passkey = document.forms["thisForm"]["passkey"].value;
	var name = document.forms["thisForm"]["name"].value;
	var extTeacherId = document.forms["thisForm"]["extTeacherId"].value;
	var password = document.forms["thisForm"]["password"].value;
	var rePassword = document.forms["thisForm"]["rePassword"].value;
	var branch = document.forms["thisForm"]["branch"].value;
	var mobile = document.forms["thisForm"]["mobile"].value;
	if(passkey.localeCompare("ExternalTeacher") != 0){
		  alert("Incorrect passkey!");
		  return false;
	 }
	if(password.localeCompare(rePassword) != 0){
		alert("Passwords did not match!\nPlease try again!");
		return false;
	}
	if(name.length() > 30){
		alert("Name should not be more than 30 characters!");
		return false;
	}
	if(teacherId.length() > 15){
		alert("TeacherId should not be more than 15 characters!");
		return false;
	}
	if(password.length() > 15){
		alert("Password should not be more than 15 characters!");
		return false;
	}
}
</script>

</html>
