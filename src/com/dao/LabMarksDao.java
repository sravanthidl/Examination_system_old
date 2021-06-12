package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.LabMarks;
import com.dto.Quiz;
import com.dto.Subject;

public class LabMarksDao {
	
	public int add(LabMarks labMarks) {
		return HibernateTemplate.addObject(labMarks);
	}
	
	public int updateInternalMarks(String studentId, String YBSId, int internalMarks){
		LabMarksDao labMarksDao = new LabMarksDao();
		LabMarks labMarks = labMarksDao.getLabMarks(studentId, YBSId);
		labMarks.setInternalMarks(internalMarks);
		return HibernateTemplate.updateObject(labMarks);
	}
	
	public int updateExternalMarks(String studentId, String YBSId, int externalMarks){
		LabMarksDao labMarksDao = new LabMarksDao();
		LabMarks labMarks = labMarksDao.getLabMarks(studentId, YBSId);
		labMarks.setExternalMarks(externalMarks);
		return HibernateTemplate.updateObject(labMarks);
	}
	
	public int updateNetLabMarks(String studentId, String YBSId){
		LabMarksDao labMarksDao = new LabMarksDao();
		LabMarks labMarks = labMarksDao.getLabMarks(studentId, YBSId);
		System.out.println("!:"+labMarks.toString());
		labMarks.setNetMarks(labMarks.getInternalMarks() + labMarks.getExternalMarks());
		return HibernateTemplate.updateObject(labMarks);
	}
	
	public int updateLabGrade(String studentId, String YBSId){
		LabMarksDao labMarksDao = new LabMarksDao();
		LabMarks labMarks = labMarksDao.getLabMarks(studentId, YBSId);
		int marks = labMarks.getNetMarks(), gradePoints = 0;
		String grade = "F";
		if(marks >= 63) { grade = "O"; gradePoints = 10; }
		else if(marks >= 56) { grade = "A+"; gradePoints = 9; }
		else if(marks >= 52) { grade = "A"; gradePoints = 8; }
		else if(marks >= 49) { grade = "B+"; gradePoints = 7; }
		else if(marks >= 45) { grade = "B"; gradePoints = 6; }
		else if(marks >= 37) { grade = "C"; gradePoints = 5; }
		else if(marks >= 30) { grade = "P"; gradePoints = 4; }
		labMarks.setGrade(grade);
		labMarks.setGradePoints(gradePoints);
		return HibernateTemplate.updateObject(labMarks);

	}
	
	public LabMarks getLabMarks(String studentId, String YBSId){
		LabMarks labMarks = HibernateTemplate.getLabMarks(studentId, YBSId);
		return labMarks;
	}
	
	public List<LabMarks> getLabMarks(String YBSId){
		List<Object> labMarksObjects = HibernateTemplate.getLabMarks(YBSId);
		List<LabMarks> labMarks = new ArrayList<>();
		for(Object labMarksObject : labMarksObjects) {
			labMarks.add((LabMarks)labMarksObject);
		}
		return labMarks;
	}
	
	public List<LabMarks> getStudentLabs(String studentId){
		
		List<Object> labMarksObjects = HibernateTemplate.getStudentLabs(studentId);
		List<LabMarks> labMarks = new ArrayList<>();
		for(Object labMarksObject : labMarksObjects) {
			labMarks.add((LabMarks)labMarksObject);
		}
		return labMarks;
	}
	
	public List<LabMarks> getAllLabMarks() {
		List<Object> labMarksObjects = HibernateTemplate.getAllObjects("LabMarks");
		List<LabMarks> labMarks = new ArrayList<>();
		for(Object labMarksObject : labMarksObjects) {
			labMarks.add((LabMarks)labMarksObject);
		}
		return labMarks;
	}
	
	public void deleteLabMarks(int year) {
		SubjectDao subjectDao = new SubjectDao();
		List<LabMarks> labMarks = getAllLabMarks();
		for(LabMarks labMark : labMarks) {
			String YBSId = labMark.getYBSId();
			Subject subject = subjectDao.getSubject(YBSId);
			
			if(subject.getYear() == year) {
				HibernateTemplate.deleteObject(labMark);
			}
		}
	}
	

}
