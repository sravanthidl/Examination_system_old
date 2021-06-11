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
	text-decoration:none;
	font-size:17px;
	top:57px;
	left:202px;
}
.subs{
	position:absolute;
	top:0px;
	padding:20px 40px 22px 40px;
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
	SubjectDao subjectDao = new SubjectDao();
	ExamTaskDao examTaskDao = new ExamTaskDao();
	DescriptiveDao descriptiveDao = new DescriptiveDao();
	String teacherId = (String)session.getAttribute("teacherId");
	String YBSId = request.getParameter("YBSId");
	%>
	<%! int leftAttr = 40; %>
	<%! void initLeftAttr(){ leftAttr = 40; } %>
	<%! void updateLeftAttr(){ leftAttr += 265; } %>
	<%
	initLeftAttr();
	List<Subject> theorySubjects = subjectDao.getSubjects(teacherId, "Theory");
	List<Subject> labSubjects = subjectDao.getSubjects(teacherId, "Lab");
	Subject firstTheorySubject = theorySubjects.get(0);
	Subject firstLabSubject = labSubjects.get(0);
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Evaluation > <%=subjectDao.getSubject(YBSId).getYear()%>-<%=subjectDao.getSubject(YBSId).getBranch()%>-<%=subjectDao.getSubject(YBSId).getSubjectName()%></p>
	</div>
	
	<div class="top2">
		<%for(Subject theorySubject : theorySubjects){%>
		<form action="TeacherEvaluation.jsp">
			<input type="hidden" name="YBSId" value="<%=theorySubject.getYBSId()%>">
			<%if(theorySubject.getYBSId().equals(YBSId)){%>
			<input class="subs" style="left:<%=leftAttr%>px;background-color:#5a6bbc" type="submit" value="<%=theorySubject.getYear()%>-<%=theorySubject.getBranch()%>-<%=theorySubject.getSubjectName()%>">
			<%}else{%>
			<input class="subs" style="left:<%=leftAttr%>px" type="submit" value="<%=theorySubject.getYear()%>-<%=theorySubject.getBranch()%>-<%=theorySubject.getSubjectName()%>">
			<%}%>
		</form>
		<% updateLeftAttr(); }%>
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
		<%
	  	String mid1OpenDate = "TBA", mid1CloseDate = "TBA", mid1Status = "TBA";
	  	String asgn1OpenDate = "TBA", asgn1CloseDate = "TBA", asgn1Status = "TBA";
		String mid2OpenDate = "TBA", mid2CloseDate = "TBA", mid2Status = "TBA";
		String asgn2OpenDate = "TBA", asgn2CloseDate = "TBA", asgn2Status = "TBA";
		String today = new Today().getToday();
		int year = new SubjectDao().getSubject(YBSId).getYear();
		
		ExamTask mid1ExamTask = examTaskDao.getExamTask(year, "mid1");
		ExamTask mid2ExamTask = examTaskDao.getExamTask(year, "mid2");
		ExamTask semExamTask = examTaskDao.getExamTask(year, "sem");	
		Descriptive mid1Desc = descriptiveDao.getDescriptive(YBSId, "mid1");
		Descriptive mid2Desc = descriptiveDao.getDescriptive(YBSId, "mid2");
		if(mid1ExamTask != null){
			System.out.println("HERE");
			mid1OpenDate = mid1ExamTask.getEvaluationOpenDate();
			mid1CloseDate = mid1ExamTask.getEvaluationCloseDate();
			if(mid1OpenDate != null && mid1CloseDate != null){
				if(today.compareTo(mid1CloseDate) > 0) mid1Status = "Expired";
				else if(today.compareTo(mid1OpenDate) >= 0 && today.compareTo(mid1CloseDate) <= 0) mid1Status = "Active";
				else if(today.compareTo(mid1OpenDate) < 0) mid1Status = "Opens Soon";
			}else{
				mid1OpenDate = "TBA";
				mid1CloseDate = "TBA";
			}	
		}
		if(mid2ExamTask != null){
			mid2OpenDate = mid2ExamTask.getEvaluationOpenDate();
			mid2CloseDate = mid2ExamTask.getEvaluationCloseDate();
			if(mid2OpenDate != null && mid2CloseDate != null){
				if(today.compareTo(mid2CloseDate) > 0) mid2Status = "Expired";
				else if(today.compareTo(mid2OpenDate) >= 0 && today.compareTo(mid2CloseDate) <= 0) mid2Status = "Active";
				else if(today.compareTo(mid2OpenDate) < 0) mid2Status = "Opens Soon";
			}else{
				mid2OpenDate = "TBA";
				mid2CloseDate = "TBA";
			}
		}
		if(mid1Desc != null){
			asgn1OpenDate = mid1Desc.getAsgnCloseDate();
			asgn1CloseDate = mid1CloseDate;
			if(asgn1OpenDate != null && asgn1CloseDate != null){
				if(today.compareTo(asgn1CloseDate) > 0) asgn1Status = "Expired";
				else if(today.compareTo(asgn1OpenDate) >= 0 && today.compareTo(asgn1CloseDate) <= 0) asgn1Status = "Active";
				else if(today.compareTo(asgn1OpenDate) < 0) asgn1Status = "Opens Soon";
			}else if(asgn1OpenDate != null && asgn1CloseDate == null){
				if(today.compareTo(asgn1OpenDate) >= 0) asgn1Status = "Active";
				else if(today.compareTo(asgn1OpenDate) < 0) asgn1Status = "Opens Soon";
			}	
		}
		if(mid2Desc != null){
			asgn2OpenDate = mid2Desc.getAsgnCloseDate();
			asgn2CloseDate = mid2CloseDate;
			if(asgn2OpenDate != null && asgn2CloseDate != null){
				if(today.compareTo(asgn2CloseDate) > 0) asgn2Status = "Expired";
				else if(today.compareTo(asgn2OpenDate) >= 0 && today.compareTo(asgn2CloseDate) <= 0) asgn2Status = "Active";
				else if(today.compareTo(asgn2OpenDate) < 0) asgn2Status = "Opens Soon";
			}else if(asgn2OpenDate != null && asgn2CloseDate == null){
				if(today.compareTo(asgn2OpenDate) >= 0) asgn2Status = "Active";
				else if(today.compareTo(asgn2OpenDate) < 0) asgn2Status = "Opens Soon";
			}	
		}
		%>
			
		<div style="height:550px;width:65%;position:absolute;top:50px;left:200px;border-radius:10px;">		
			<table id="tb">
				<tr>
					<th>Exam Type</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Status</th>
					<th>Evaluate</th>
				</tr>
				<tr>
					<form action="TeacherViewScripts.jsp">
						<input type="hidden" name="examType" value="mid1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Mid 1</td>
						<td><%=mid1OpenDate%></td>
						<td><%=mid1CloseDate%></td>
						<td><%=mid1Status%></td>
						<%if(mid1Status.equals("Active")){%>
							<td><input type="submit" value="Evaluate"></td>
						<%}else{%>
						<td><input type="submit" value="Evaluate" disabled></td>
						<%}%>
					</form>
				</tr>
				<tr>
					<form action="TeacherViewScripts.jsp">
						<input type="hidden" name="examType" value="mid2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Mid 2</td>
						<td><%=mid2OpenDate%></td>
						<td><%=mid2CloseDate%></td>
						<td><%=mid2Status%></td>
						<%if(mid2Status.equals("Active")){%>
							<td><input type="submit" value="Evaluate"></td>
						<%}else{%>
						<td><input type="submit" value="Evaluate" disabled></td>
						<%}%>
					</form>
				</tr>
				<tr>
					<form action="TeacherViewScripts.jsp">
						<input type="hidden" name="examType" value="asgn1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Assignment 1</td>
						<td><%=asgn1OpenDate%></td>
						<td><%=asgn1CloseDate%></td>
						<td><%=asgn1Status%></td>
						<%if(asgn1Status.equals("Active")){%>
							<td><input type="submit" value="Evaluate"></td>
						<%}else{%>
						<td><input type="submit" value="Evaluate" disabled></td>
						<%}%>
					</form>
				</tr>
				<tr>
					<form action="TeacherViewScripts.jsp">
						<input type="hidden" name="examType" value="asgn2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Assignment 2</td>
						<td><%=asgn2OpenDate%></td>
						<td><%=asgn2CloseDate%></td>
						<td><%=asgn2Status%></td>
						<%if(asgn2Status.equals("Active")){%>
							<td><input type="submit" value="Evaluate"></td>
						<%}else{%>
						<td><input type="submit" value="Evaluate" disabled></td>
						<%}%>
					</form>
				</tr>
			</table>
		</div> 
	</div>
	
</body>

</html>
    