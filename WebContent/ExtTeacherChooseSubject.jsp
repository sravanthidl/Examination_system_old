<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.*"%>
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
  width: 70%;
  background:#5a6bbc;
}

</style>

<body>
	<%
	SubjectDao subjectDao = new SubjectDao();
	%>
	<div class="vertical_menu_bar">
		<p class="clgName"><strong>ABIT</strong></p>
		<p class="tag">Online Examination Corner</p>	
		<img src="pics/picture.png" width="600" height="600" style="position:absolute;top:195px;left:-50px">
	</div>
	
	<div class="body_bar">
		<div style="height:360px;width:30%;position:absolute;top:150px;left:20%;border:2px solid #5a6bbc;border-radius:10px;padding:30px">
			<form action="ExtTeacherRegister" method="post" name="thisForm" onsubmit="return validateForm()">
				<input type="hidden" name="name" value="<%=request.getParameter("name")%>">
				<input type="hidden" name="extTeacherId" value="<%=request.getParameter("extTeacherId")%>">
				<input type="hidden" name="password" value="<%=request.getParameter("password")%>">
				<input type="hidden" name="branch" value="<%=request.getParameter("branch")%>">
				<input type="hidden" name="mobile" value="<%=request.getParameter("mobile")%>">
				<table id="tb">
					<%
					String shortBranch = subjectDao.getShortBranch(request.getParameter("branch"));
					List<Subject> subjects = subjectDao.getSubjectsByShortBranch(shortBranch);
					HashMap<String, String> subjectDetails = new HashMap<>();
					for(Subject subject : subjects) if(subject.getSubjectCategory().equals("Theory")) subjectDetails.put(subject.getSubjectCode(), subject.getSubjectName());				
						for(String subjectCode : subjectDetails.keySet()){
					%>
					<tr>
						<td style="padding:5px 5px 5px 50px"><input type="radio" name="subjectCode" value="<%=subjectCode%>" ></td>
						<td><%=subjectDetails.get(subjectCode)%></td>
					</tr>
					<%}%>
				</table>
				<input style="left:60px;top:290px;position:absolute" type="submit" value="Finish">
			</form>
		</div>
	</div>
	
</body>

</html>
