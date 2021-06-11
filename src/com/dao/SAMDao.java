package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Descriptive;
import com.dto.ScriptsAndMarks;
import com.dto.Subject;

public class SAMDao {
	
	public ScriptsAndMarks getSam(String studentId, String YBSId) {
		return HibernateTemplate.getSam(studentId, YBSId);
	}

	public List<ScriptsAndMarks> getAllYBSScripts(String YBSId){
		List<Object> scriptObjects = HibernateTemplate.getAllYBSScripts(YBSId);
		List<ScriptsAndMarks> sams = new ArrayList<>();
		for(Object scriptObject : scriptObjects) {
			sams.add((ScriptsAndMarks)scriptObject);
		}
		return sams;
	}
	
	public List<ScriptsAndMarks> getStudentTheorys(String studentId){
		List<Object> SAMObjects = HibernateTemplate.getStudentSAMs(studentId);
		List<ScriptsAndMarks> sams = new ArrayList<>();
		for(Object SAMObject : SAMObjects) {
			sams.add((ScriptsAndMarks)SAMObject);
		}
		return sams;
	}
	
	public int updateEvaluatedMarks(String studentId, String YBSId, String examType, int total) {
		SAMDao samDao = new SAMDao();
		ScriptsAndMarks sam = samDao.getSam(studentId, YBSId);
		if(examType.equals("mid1")) sam.setDesc1Marks(total);
		else if(examType.equals("mid2")) sam.setDesc2Marks(total);
		else if(examType.equals("asgn1")) sam.setAsgn1Marks(total);
		else if(examType.equals("asgn2")) sam.setAsgn2Marks(total);
		else sam.setSemMarks(total);
		return HibernateTemplate.updateObject(sam);
		
	}
	
	public int updateNetMarks(String studentId, String YBSId, String examType) {
		System.out.println(studentId + "$$" + YBSId);
		SAMDao samDao = new SAMDao();
		ScriptsAndMarks sam = getSam(studentId, YBSId);
		
		if(examType.equals("sem")) {
			int total = sam.getMidNetMarks() + sam.getSemMarks();
			sam.setSemNetMarks(total);
			return HibernateTemplate.updateObject(sam);
		}else{
			if(examType.equals("mid1") || examType.equals("asgn1") || examType.equals("quiz1")) {
				int total = ((sam.getDesc1Marks()*2)/3) + sam.getAsgn1Marks() + sam.getQuiz1Marks();
				sam.setMid1NetMarks(total);
				HibernateTemplate.updateObject(sam);
			}else{
				int total = ((sam.getDesc2Marks()*2)/3) + sam.getAsgn2Marks() + sam.getQuiz2Marks();
				sam.setMid2NetMarks(total);
				HibernateTemplate.updateObject(sam);
			}
			int total = (sam.getMid1NetMarks() + sam.getMid2NetMarks()) / 2;
			sam.setMidNetMarks(total);
			return HibernateTemplate.updateObject(sam);
		}
	}
	
	public int updateGrade(String studentId, String YBSId) {
		SAMDao samDao = new SAMDao();
		ScriptsAndMarks sam = getSam(studentId, YBSId);
		int marks = sam.getSemNetMarks(), gradePoints = 0;
		String grade = "F";
		if(marks >= 85) { grade = "O"; gradePoints = 10; }
		else if(marks >= 75) { grade = "A+"; gradePoints = 9; }
		else if(marks >= 70) { grade = "A"; gradePoints = 8; }
		else if(marks >= 65) { grade = "B+"; gradePoints = 7; }
		else if(marks >= 60) { grade = "B"; gradePoints = 6; }
		else if(marks >= 50) { grade = "C"; gradePoints = 5; }
		else if(marks >= 40) { grade = "P"; gradePoints = 4; }
		
		sam.setGrade(grade);
		sam.setGradePoints(gradePoints);
		return HibernateTemplate.updateObject(sam);
	}
	
	public List<ScriptsAndMarks> getAllSAM() {
		List<Object> SAMObjects = HibernateTemplate.getAllObjects("SAM");
		List<ScriptsAndMarks> sams = new ArrayList<>();
		for(Object SAMObject : SAMObjects) {
			sams.add((ScriptsAndMarks)SAMObject);
		}
		return sams;
	}
	
	public void deleteSAM(int year) {
		SubjectDao subjectDao = new SubjectDao();
		List<ScriptsAndMarks> sams = getAllSAM();
		for(ScriptsAndMarks sam : sams) {
			String YBSId = sam.getYBSId();
			Subject subject = subjectDao.getSubject(YBSId);
			
			if(subject.getYear() == year) {
				HibernateTemplate.deleteObject(sam);
			}
		}
	}
	
}
