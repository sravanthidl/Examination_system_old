package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.ExamTask;
import com.dto.LabMarks;
import com.dto.ScriptsAndMarks;
import com.dto.Student;
import com.dto.Teacher;

public class StudentDao {

	public int updateSgpa(String studentId) {
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(studentId);
		int year = student.getCurrentYear(), sem = student.getCurrentSem();
		float sgpa = calculateSgpa(new SAMDao().getStudentTheorys(studentId), new LabMarksDao().getStudentLabs(studentId));
		if(year == 1) {
			if(sem == 1) student.setSgpa1(sgpa);
			else student.setSgpa2(sgpa);
		}else if(year == 2) {
			if(sem == 1) student.setSgpa3(sgpa);
			else student.setSgpa4(sgpa);
		}else if(year == 3) {
			if(sem == 1) student.setSgpa5(sgpa);
			else student.setSgpa6(sgpa);
		}else {
			if(sem == 1) student.setSgpa7(sgpa);
			else student.setSgpa8(sgpa);
		}
		return HibernateTemplate.updateObject(student);
	}
	
	public int updateCgpa(String studentId) {
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(studentId);
		float cgpa = calculateCgpa(studentId);
		student.setCgpa(cgpa);
		return HibernateTemplate.updateObject(student);
	}
	
	public int updateStudentsAcadYear(int year) {
		return HibernateTemplate.updateStudentsAcadYear(year);
	}
	
	public int updateStudentsSemester(int year) {
		return HibernateTemplate.updateStudentsSemester(year);
	}

	public Student getStudent(String studentId) {
		Student student = (Student)HibernateTemplate.getUser("student", studentId);
		return student;
	}
	
	public List<Student> getStudents(int year, String branch){
		List<Object> studentObjects = HibernateTemplate.getStudents(year, branch);
		List<Student> students = new ArrayList<>();
		for(Object studentObject : studentObjects) {
			students.add((Student)studentObject);
		}
		return students;
	}
	
	public int getCredits(int gradePoints) {
		if(gradePoints == 10) return 4;
		else if(gradePoints == 9) return 3;
		else if(gradePoints == 8) return 2;
		return 1;
	}
	
	public float calculateSgpa(List<ScriptsAndMarks> studentTheorys, List<LabMarks> studentLabs) {
		int num = 0, denom = 0;
		for(ScriptsAndMarks studentTheory : studentTheorys){
			int gradePoints = studentTheory.getGradePoints(), credits = getCredits(gradePoints);
			num += (credits * gradePoints);
			denom += credits;
		}
		for(LabMarks studentLab : studentLabs){
			int gradePoints = studentLab.getGradePoints(), credits = getCredits(gradePoints);
			num += (credits * gradePoints);
			denom += credits;
		}
		return (float)num/denom;	
	}
	
	public float calculateCgpa(String studentId) {
		float num = 0, denom = 0;
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(studentId);
		float sgpa1 = student.getSgpa1(), sgpa2 = student.getSgpa2(), sgpa3 = student.getSgpa3(), sgpa4 = student.getSgpa4(), sgpa5 = student.getSgpa5(), sgpa6 = student.getSgpa6(), sgpa7 = student.getSgpa7(), sgpa8 = student.getSgpa8();		
		if(sgpa1 != 0) { num += 4 * sgpa1; denom += 4; }
		if(sgpa2 != 0) { num += 4 * sgpa2; denom += 4; }
		if(sgpa3 != 0) { num += 4 * sgpa3; denom += 4; }
		if(sgpa4 != 0) { num += 4 * sgpa4; denom += 4; }
		if(sgpa5 != 0) { num += 4 * sgpa5; denom += 4; }
		if(sgpa6 != 0) { num += 4 * sgpa6; denom += 4; }
		if(sgpa7 != 0) { num += 4 * sgpa7; denom += 4; }
		if(sgpa8 != 0) { num += 4 * sgpa8; denom += 4; }
		
		return num/denom;	
	}
	
	public int deleteStudents(int year) {
		return HibernateTemplate.deleteStudents(year);
	}
	
}
