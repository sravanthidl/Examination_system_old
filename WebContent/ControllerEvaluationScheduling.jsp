<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.List" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - Schedule Paper Setting</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body{ font-family:arial; }
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
.subs{
	position:absolute;
	top:0px;
	padding:20px 100px 22px 100px;
	border:none;
	cursor:pointer;
	background-color:#7382c8;
	color:#f7f7f7;
}
.subs:hover{ background-color:#5a6bbc; }
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
  background-color:#f7f7f7;
  color: #4a4a4a;
  text-align: center;
}
#tb tr:hover { background-color:#f7f7f7}
.border-bottom td { border-bottom:3px solid black; }
input[type=text]::placeholder { text-align:center; }
input[type=text]{ text-align:center; }

</style>

<body>
	<%
	AcadYearDao acadYearDao = new AcadYearDao();
	ExamTaskDao examTaskDao = new ExamTaskDao();
	int year = Integer.parseInt(request.getParameter("year"));
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Schedule Evaluation > Year <%=year%> > Sem <%=new AcadYearDao().getSemester(year)%></p>
	</div>
	
	<div class="top2">
		<%!	int leftAttr = 110; %>
		<%! void initLeftAttr(){ leftAttr = 110; } %>
		<%! void updateLeftAttr(){ leftAttr += 250; } %>
		<%  initLeftAttr();
		for(int i = 1; i <= 4; i++){%>
		<form action="ControllerEvaluationScheduling.jsp">
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
			<a class="options" style="top:320px;padding:17px 90px 17px 57px" href="ControllerExamSchedulingDashboard.jsp">Exams</a>
			
			<i class='fas fa-check-double' style="position:absolute;top:400px;left:22px;color:#cccccc;z-index:1"></i>
			<form action="ControllerEvaluationScheduling.jsp">
			<input type="hidden" name="year" value="1">
		    <input class="options" style="top:380px;padding:17px 61px 17px 57px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Evaluation"></br>
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
		<p style="position:absolute;color:#5a6bbc;left:10px;top:-15px">* Click on the dates to update schedule</p>
	
		<div style="width:50%;position:absolute;top:100px;left:23%">
			<table id="tb">
				<tr>
					<th>Exam</th>
					<th>Open Date</th>
					<th>Close Date</th>
					<th>Schedule</th>
				</tr>
					<%
					List<String> examTypeDisplay = new ArrayList<>();
					List<String> examType = new ArrayList<>();
					examTypeDisplay.add("Mid 1");examTypeDisplay.add("Mid 2");examTypeDisplay.add("Semester");
					examType.add("mid1");examType.add("mid2");examType.add("sem");
					for(int j = 0; j < 3; j++){
						ExamTask examTask = examTaskDao.getExamTask(year, examType.get(j));
						String openDatePH = "NA", closeDatePH = "NA";
						if(examTask != null){
							if(examTask.getEvaluationOpenDate() != null) openDatePH = examTask.getEvaluationOpenDate();
							if(examTask.getEvaluationCloseDate() != null) closeDatePH = examTask.getEvaluationCloseDate();
						}	
					%>
				<tr>
					<form action="ControllerEvaluationScheduling" method="post">
						<input type="hidden" name="year" value="<%=year%>">
						<input type="hidden" name="examType" value="<%=examType.get(j)%>">
						<td><%=examTypeDisplay.get(j)%></td>
						<%if(!openDatePH.equals("NA")){ %>
						<td><input type="text" style="border:none;color:#585858;width:130px" name="openDate" placeholder="<%=openDatePH%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" required></td>
						<td><input type="text" style="border:none;color:#585858;width:130px" name="closeDate" placeholder="<%=closeDatePH%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" required></td>
						<td><input type="Submit" value="Update"></td>
						<%}else{%>
						<td><input type="date" style="color:#585858;width:135px" name="openDate" onkeydown="return false" required></td>
						<td><input type="date" style="color:#585858;width:135px" name="closeDate" onkeydown="return false" required></td>
						<td><input type="Submit" value="Schedule"></td>
						<%}%>
					</form>
				</tr>
					<%}%>
			</table>
		</div>
	</div>	
	
</body>

<script>
function myFunction() {
	var approve = confirm("Are you sure you want to update the schedule?");
	if (approve == true) return true;
	else return false;
}
</script>

</html>
