<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dto.*" import="com.dao.*" import="java.util.List"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - Quiz Setting</title>
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
	height:1500px;
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
	height:100%%;
	width:88%;
	top:17%;
	left:14%;
}
#tb {
  border-collapse: collapse;
  width: 100%;
}
#tb td, #tb th {
  border: 1px solid grey;
  padding: 15px 12px;
  color:#585858;
  background-color: #f7f7f7;
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
input[type=text] {
  border: 2px solid #e4e4e4;
  line-height:2;
}
.radioButton {
  height:25px;
  width:25px;
  background-color: #eee;
  border-radius: 50%;
}

</style>

<body>
	<%
	QuizDao quizDao = new QuizDao();
	SubjectDao subjectDao = new SubjectDao();
	String YBSId = (String)request.getParameter("YBSId");
	String examType = (String)request.getParameter("examType");
	String teacherId = (String)session.getAttribute("teacherId");
	
	List<Subject> theorySubjects = subjectDao.getSubjects(teacherId, "Theory");
	List<Subject> labSubjects = subjectDao.getSubjects(teacherId, "Lab");
	Subject firstTheorySubject = theorySubjects.get(0);
	Subject firstLabSubject = labSubjects.get(0);
	%>

	<div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Paper Setting > <%=subjectDao.getSubject(YBSId).getYear()%>-<%=subjectDao.getSubject(YBSId).getBranch()%>-<%=subjectDao.getSubject(YBSId).getSubjectName()%> > Quiz</p>
	</div>
	
	<div class="top2"></div>
	
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
		<%! int noOfQs = 5; %>
		<%! int topAttr = 60; %>
		<%! public void initTopAttr(){ topAttr = 100; } %>
		<%! public void UpdateTopAttr(){ topAttr += 0; } %>
		<% initTopAttr();%>
			<form action="TeacherQuizSetting" method="post" id="thisForm" onsubmit="return validateForm()">
				<div style="height:550px;width:80%;position:absolute;top:50px;left:9%;border-radius:10px">
					<input type="hidden" name="YBSId" value="<%=YBSId%>">
					<input type="hidden" name="examType" value="<%=examType%>">
					<% for(int i = 1; i <= 2; i++){ 
						Quiz quiz = quizDao.getQuiz(YBSId, examType, i);
						String question="", optionA = "", optionB = "", optionC = "", optionD = "", answerOption = "";
						if(quiz != null){
							question = quiz.getQuestion();
							optionA = quiz.getOptionA();
							optionB = quiz.getOptionB();
							optionC = quiz.getOptionC();
							optionD = quiz.getOptionD();
							answerOption = quiz.getAnswerOption();
						}
					%>
					<table id="tb" style="top:100px">
						<input type="hidden" name="questionNo<%=i%>" value="<%=i%>">	
						<tr>
							<td rowspan="5">Q<%=i%></td>
							<td colspan="2" ><textarea cols="105" rows="3" type="text" name="question<%=i%>" placeholder="Type question here"><%=question%></textarea></td>
						</tr>
						<tr>
							<td><input style="margin-top:8px;margin-left:-50px" class="radioButton" type="radio" name="answerOption<%=i%>" value="A" required <%if(answerOption.equals("A")){%> checked <%}%> >					
							<input style="position:absolute;margin-left:20px" size="98" type="text" name="optionA<%=i%>" placeholder="Option A" value="<%=optionA%>"></td>
						</tr>
						<tr>
							<td><input style="margin-top:8px;margin-left:-50px" class="radioButton" type="radio" name="answerOption<%=i%>" value="B" required <%if(answerOption.equals("B")){%> checked <%}%> >
							<input style="position:absolute;margin-left:20px" size="98" type="text" name="optionB<%=i%>" placeholder="Option B" value="<%=optionB%>"></td>
						</tr>
						<tr>
							<td><input style="margin-top:8px;margin-left:-50px" class="radioButton" type="radio" name="answerOption<%=i%>" value="C" required <%if(answerOption.equals("C")){%> checked <%}%> >
							<input style="position:absolute;margin-left:20px" size="98" type="text" name="optionC<%=i%>" placeholder="Option C" value="<%=optionC%>"></td>
						</tr>
						<tr>
							<td><input style="margin-top:8px;margin-left:-50px" class="radioButton" type="radio" name="answerOption<%=i%>" value="D" required <%if(answerOption.equals("D")){%> checked <%}%> >
							<input style="position:absolute;margin-left:20px" size="98" type="text" name="optionD<%=i%>" placeholder="Option D" value="<%=optionD%>"></td>
						</tr>
					</table>
					<%}%>
					<input style="left:480px;top:820px;position:absolute" type="Submit" value="Set Quiz">
				</div>
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
