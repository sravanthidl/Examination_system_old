package com.dao;

import java.text.DecimalFormat;
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
		else if(gradePoints == 0) return 0;
		return 1;
	}
	
	public float calculateSgpa(List<ScriptsAndMarks> studentTheorys, List<LabMarks> studentLabs) {
		int num = 0, denom = 0;
		for(ScriptsAndMarks studentTheory : studentTheorys){
			int gradePoints = studentTheory.getGradePoints(), credits = getCredits(gradePoints);
			System.out.println(studentTheory.toString());
			System.out.println(gradePoints+"#"+credits);
			if(gradePoints == 0) return 0;
			num += (credits * gradePoints);
			denom += credits;
		}
		for(LabMarks studentLab : studentLabs){
			int gradePoints = studentLab.getGradePoints(), credits = getCredits(gradePoints);
			System.out.println(studentLab.toString());
			System.out.println(gradePoints+"#"+credits);
			if(gradePoints == 0) return 0;
			num += (credits * gradePoints);
			denom += credits;
		}
		String formattedSgpa = new DecimalFormat("##.##").format((float)num/denom);
		return Float.parseFloat(formattedSgpa);
	}
	
	public float calculateCgpa(String studentId) {
		float num = 0, denom = 0;
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(studentId);
		int year = student.getCurrentYear(), sem = student.getCurrentSem();
		float sgpa1 = student.getSgpa1(), sgpa2 = student.getSgpa2(), sgpa3 = student.getSgpa3(), sgpa4 = student.getSgpa4(), sgpa5 = student.getSgpa5(), sgpa6 = student.getSgpa6(), sgpa7 = student.getSgpa7(), sgpa8 = student.getSgpa8();		
		System.out.println(student.toString());
		List<Float> sgpaList = new ArrayList<>();
		if(year >= 1) {
			if(year == 1) {
				if(sem >= 1) sgpaList.add(sgpa1);
				if(sem == 2) sgpaList.add(sgpa2);
			}else{
				sgpaList.add(sgpa1);
				sgpaList.add(sgpa2);
			}	
		}
		if(year >= 2) {
			if(year == 2) {
				if(sem >= 1) sgpaList.add(sgpa3);
				if(sem == 2) sgpaList.add(sgpa4);
			}else {
				sgpaList.add(sgpa3);
				sgpaList.add(sgpa4);
			}
		}
		if(year >= 3) {
			if(year == 3) {
				if(sem >= 1) sgpaList.add(sgpa5);
				if(sem == 2) sgpaList.add(sgpa6);
			}else {
				sgpaList.add(sgpa5);
				sgpaList.add(sgpa6);
			}
		}
		if(year == 4) {
			if(sem >= 1) sgpaList.add(sgpa7);
			if(sem == 2) sgpaList.add(sgpa8);
		}
		for(Float sgpa : sgpaList) {
			if(sgpa == 0.0) return 0;
			num += sgpa;
		}
		String formattedCgpa = new DecimalFormat("##.##").format(num/sgpaList.size());
		return Float.parseFloat(formattedCgpa);	
	}
	
	public int deleteStudents(int year) {
		return HibernateTemplate.deleteStudents(year);
	}
	
}
