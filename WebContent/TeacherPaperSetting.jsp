<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.List" import="com.dao.Today" import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - Paper Setting</title>
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
input[type=date]{width:134px;}
input[type=text]{text-align:center;}

</style>

<body>
	<%
	SubjectDao subjectDao = new SubjectDao();
	DescriptiveDao descriptiveDao = new DescriptiveDao();
	QuizDao quizDao = new QuizDao();
	ExamTaskDao examTaskDao = new ExamTaskDao();
	String teacherId = (String)session.getAttribute("teacherId");
	String YBSId = request.getParameter("YBSId");
	System.out.println("YB:"+YBSId);
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
		<p style="margin-left:30px;color:#e7e9f4">Paper Setting > <%=subjectDao.getSubject(YBSId).getYear()%>-<%=subjectDao.getSubject(YBSId).getBranch()%>-<%=subjectDao.getSubject(YBSId).getSubjectName()%></p>
	</div>
	
	<div class="top2">
		<%for(Subject theorySubject : theorySubjects){
			System.out.println(theorySubject.getSubjectName());
			%>
		<form action="TeacherPaperSetting.jsp">
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
		    <input class="options" style="top:208px;padding:17px 27px 17px 65px;border:none;cursor:pointer;background-color:#16181d;color:#80b5eb" type="Submit" value="Paper Setting"></br>
		</form>
		
		<i class='fas fa-check-double' style="position:absolute;top:287px;left:30px;color:#cccccc;z-index:1"></i>
		<form action="TeacherEvaluation.jsp">
		    <input type="hidden" name="YBSId" value="<%=firstTheorySubject.getYBSId()%>">
		    <input class="options" style="top:268px;padding:17px 52px 17px 65px;border:none;cursor:pointer" type="Submit" value="Evaluation"></br>
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
		String mid2OpenDate = "TBA", mid2CloseDate = "TBA", mid2Status = "TBA";
		String semOpenDate = "TBA", semCloseDate = "TBA", semStatus = "TBA";
		String today = new Today().getToday();
		int year = new SubjectDao().getSubject(YBSId).getYear();

		ExamTask mid1ExamTask = examTaskDao.getExamTask(year, "mid1");
		ExamTask mid2ExamTask = examTaskDao.getExamTask(year, "mid2");
		ExamTask semExamTask = examTaskDao.getExamTask(year, "sem");

		if(mid1ExamTask != null){
			System.out.println("HERE");
			mid1OpenDate = mid1ExamTask.getSettingOpenDate();
			mid1CloseDate = mid1ExamTask.getSettingCloseDate();
			if(mid1OpenDate != null && mid1CloseDate != null){
				if(today.compareTo(mid1CloseDate) > 0) mid1Status = "Expired";
				else if(today.compareTo(mid1OpenDate) >= 0 && today.compareTo(mid1CloseDate) <= 0) mid1Status = "Active";
				else if(today.compareTo(mid1OpenDate) < 0) mid1Status = "Opens Soon";
			}
		}
		if(mid2ExamTask != null){
			mid2OpenDate = mid2ExamTask.getSettingOpenDate();
			mid2CloseDate = mid2ExamTask.getSettingCloseDate();
			if(mid2OpenDate != null && mid2CloseDate != null){
				if(today.compareTo(mid2CloseDate) > 0) mid2Status = "Expired";
				else if(today.compareTo(mid2OpenDate) >= 0 && today.compareTo(mid2CloseDate) <= 0) mid2Status = "Active";
				else if(today.compareTo(mid2OpenDate) < 0) mid2Status = "Opens Soon";
			}				
		}
		if(semExamTask != null){
			semOpenDate = semExamTask.getSettingOpenDate();
			semCloseDate = semExamTask.getSettingCloseDate();
			if(semOpenDate != null && semCloseDate != null){
				if(today.compareTo(semCloseDate) > 0) semStatus = "Expired";
				else if(today.compareTo(semOpenDate) >= 0 && today.compareTo(semCloseDate) <= 0) semStatus = "Active";
				else if(today.compareTo(semOpenDate) < 0) semStatus = "Opens Soon";
			}		
		}
		Descriptive mid1Descriptive = descriptiveDao.getDescriptive(YBSId, "mid1");
		Descriptive mid2Descriptive = descriptiveDao.getDescriptive(YBSId, "mid2");
		Descriptive semDescriptive = descriptiveDao.getDescriptive(YBSId, "sem");
		String mid1QPaper = null, mid2QPaper = null, semQPaper = null;
		%>

		<div style="height:550px;width:80%;position:absolute;top:30px;left:8%;border-radius:10px">
			<table id="tb">
				<tr>
					<th>Descriptive</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Status</th>
					<th style="padding-left:95px">Select File</th>
					<th>Upload</th>
				</tr>
				<tr>
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="mid1">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Mid 1</td>
						<td><%=mid1OpenDate%></td>
						<td><%=mid1CloseDate%></td>
						<td><%=mid1Status%></td>
						<%if(mid1Status.equals("Active")){ if(mid1Descriptive != null){ mid1QPaper = mid1Descriptive.getQPaperPath(); }%>
						<td><input  type="file" name="file" required></td>
						<td><input type="submit" value="Upload"> <%if(mid1QPaper != null){%> <a target="_blank" href="pics/<%=mid1QPaper%>" style="font-size:15px;position:absolute;top:70px;left:990px">&#x2705</a> <%}%> </td>
						<%}else{%>
						<td><input type="file" name="file" disabled></td>
						<td><input type="submit" value="Upload" disabled></td>
						<%}%>		
					</form>
				</tr>
				<tr>
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="mid2">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Mid 2</p>
						<td><%=mid2OpenDate%></td>
						<td><%=mid2CloseDate%></td>
						<td><%=mid2Status%></td>
						<%if(mid2Status.equals("Active")){ if(mid2Descriptive != null){ mid2QPaper = mid2Descriptive.getQPaperPath(); }%>
						<td><input  type="file" name="file" required></td>
						<td><input type="submit" value="Upload"> <%if(mid2QPaper != null){%> <a target="_blank" href="pics/<%=mid2QPaper%>" style="font-size:15px;position:absolute;top:110px;left:990px">&#x2705</a> <%}%> </td>
						<%}else{%>
						<td><input  type="file" name="file" disabled></td>
						<td><input type="submit" value="Upload" disabled></td>
						<%}%>
					</form>
				</tr>
				<tr>
					<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">
						<input type="hidden" name="examType" value="sem">
						<input type="hidden" name="YBSId" value="<%=YBSId%>">
						<td>Semester</td>
						<td><%=semOpenDate%></td>
						<td><%=semCloseDate%></td>
						<td><%=semStatus%></td>
						<%if(semStatus.equals("Active")){ if(semDescriptive != null){ semQPaper = semDescriptive.getQPaperPath(); }%>
						<td><input  type="file" name="file" required></td>
						<td><input type="submit" value="Upload"> <%if(semQPaper != null){%> <a target="_blank" href="pics/<%=semQPaper%>" style="font-size:15px;position:absolute;top:170px;left:990px">&#x2705</a> <%}%> </td>
						<%}else{%>
						<td><input  type="file" name="file" disabled></td>
						<td><input type="submit" value="Upload" disabled></td>
						<%}%>
					</form>	
				</tr>
				</table>
				</br>
				<table id="tb">
					<tr>
						<th>Quiz</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Status</th>
						<th>Create</th>
					</tr>
					<tr>
						<form action="TeacherQuizSetting.jsp">
							<input type="hidden" name="examType" value="mid1">
							<input type="hidden" name="YBSId" value="<%=YBSId%>">
							<td>Mid 1</p>
							<td><%=mid1OpenDate%></td>
							<td><%=mid1CloseDate%></td>
							<td><%=mid1Status%></td>
							<%
							if(mid1Status.equals("Active")){ Quiz quiz = quizDao.getQuiz(YBSId, "mid1", 1); %>
							<td><input type="submit" value="Create Quiz"> <%if(quiz != null){%> <p style="font-size:15px;position:absolute;top:278px;left:990px"> &#x2705 </p> <%}%> </td>
							<%}else{%>
							<td><input type="submit" value="Create Quiz" disabled></td>
							<%}%>
						</form>
					</tr>
					<tr>
						<form action="TeacherQuizSetting.jsp">
							<input type="hidden" name="examType" value="mid2">
							<input type="hidden" name="YBSId" value="<%=YBSId%>">
							<td>Mid 2</p>
							<td><%=mid2OpenDate%></td>
							<td><%=mid2CloseDate%></td>
							<td><%=mid2Status%></td>
							<%
							if(mid2Status.equals("Active")){ Quiz quiz = quizDao.getQuiz(YBSId, "mid2", 1); %>
							<td><input type="submit" value="Create Quiz"> <%if(quiz != null){%> <p style="font-size:15px;position:absolute;top:332px;left:990px"> &#x2705 </p> <%}%> </td>
							<%}else{%>
							<td><input type="submit" value="Create Quiz" disabled></td>
							<%}%>
						</form>
					</tr>
				</table>
				</br>
				<table id="tb">
					<tr>
						<th>Assignment</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="padding-left:95px">Select File</th>
						<th>Upload</th>
					</tr>
					<%Descriptive asgn1 = descriptiveDao.getDescriptive(YBSId, "mid1"), asgn2 = descriptiveDao.getDescriptive(YBSId, "mid2");%>
					<tr>
						<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">		
							<input type="hidden" name="examType" value="asgn1">
							<input type="hidden" name="YBSId" value="<%=YBSId%>">
							<td>Mid 1</td>
							<%if(asgn1 != null && asgn1.getAsgnOpenDate() != null){
							System.out.println("@:"+asgn1.getAsgnOpenDate());
							%>
							<td><input type="text" style="border:none;width:130px" placeholder="<%=asgn1.getAsgnOpenDate()%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" name="openDate" required></td>
							<td><input type="text" style="border:none;width:130px" placeholder="<%=asgn1.getAsgnCloseDate()%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" name="closeDate" required></td>
							<%}else{%>
							<td><input type="date" style="width:135px" onkeydown="return false" name="openDate" required></td>
							<td><input type="date" style="width:135px" onkeydown="return false" name="closeDate" required></td>
							<%}%>
							<td><input type="file" name="file" required></td>
							<td><input type="submit" value="Upload"> <%if(asgn1 != null && asgn1.getAsgnPaperPath() != null){%> <a target="_blank" href="pics/<%=asgn1.getAsgnPaperPath()%>" style="font-size:15px;position:absolute;top:462px;left:990px">&#x2705</a> <%}%> </td>
						</form>
					</tr>
					<tr>
						<form action="TeacherDescSetting" method="post" enctype="multipart/form-data">		
							<input type="hidden" name="examType" value="asgn2">
							<input type="hidden" name="YBSId" value="<%=YBSId%>">
							<td>Mid 2</td>
							<%if(asgn2 != null && asgn2.getAsgnOpenDate() != null){%>
							<td><input type="text" style="border:none;width:130px" placeholder="<%=asgn2.getAsgnOpenDate()%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" name="openDate" required></td>
							<td><input type="text" style="border:none;width:130px" placeholder="<%=asgn2.getAsgnCloseDate()%>" onfocus="(this.type='date')" onblur="(this.type='text')" onkeydown="return false" name="closeDate" required></td>
							<%}else{%>
							<td><input type="date" style="width:135px" onkeydown="return false" name="openDate" required></td>
							<td><input type="date" style="width:135px" onkeydown="return false" name="closeDate" required></td>
							<%}%>
							<td><input type="file" name="file" required></td>
							<td><input type="submit" value="Upload"> <%if(asgn2 != null && asgn2.getAsgnPaperPath() != null){%> <a target="_blank" href="pics/<%=asgn2.getAsgnPaperPath()%>" style="font-size:15px;position:absolute;top:506px;left:990px">&#x2705</a> <%}%> </td>
						</form>
					</tr>
				</table>	
			</div>
		</div> 	
</body>

</html>
    