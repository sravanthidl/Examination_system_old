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
		labMarks.setNetMarks(labMarks.getInternalMarks() + labMarks.getExternalMarks());
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
