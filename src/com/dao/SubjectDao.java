package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Controller;
import com.dto.ExamTask;
import com.dto.Subject;

public class SubjectDao {
	
private SessionFactory factory = null;
	
	public int register(Subject subject) {
		System.out.println(subject.toString());
		return HibernateTemplate.addObject(subject);
	}
	
	public int updateTeacherId(String YBSId, String teacherId) {
		SubjectDao subjectDao = new SubjectDao();
		Subject subject = subjectDao.getSubject(YBSId);
		subject.setTeacherId(teacherId);
		return HibernateTemplate.updateObject(subject);
	}
	
	public Subject getSubject(String YBSId) {
		return HibernateTemplate.getSubject(YBSId);
	}
	
	public String getYBSIdFromSubjectList(List<Subject> subjects, int year){
		for(Subject subject : subjects) {
			if(subject.getYear() == year) return subject.getYBSId();
		}
		return null;
	}
	
	public String getShortBranch(String branch) {
		if(branch.equals("CSE")) return "CS";
		if(branch.equals("ECE")) return "EC";
		if(branch.equals("EEE")) return "EE";
		return branch;	
	}
	
	public List<Subject> getAllSubjects(){
		
		List<Object> subjectObjects = HibernateTemplate.getAllObjects("Subject");
		List<Subject> subjects = new ArrayList<>();
		for(Object subjectObject : subjectObjects) {
			subjects.add((Subject)subjectObject);
			System.out.println((Subject)subjectObject);
		}
		return subjects;
	}

	public List<Subject> getSubjectsByShortBranch(String shortBranch) {
		List<Subject> allSubjects = getAllSubjects();
		List<Subject> subjects = new ArrayList<>();
		for(Subject subject : allSubjects) {
			if((subject.getSubjectCode()).indexOf(shortBranch) > 0) subjects.add(subject);
		}
		return subjects;
	}
	
	public List<Subject> getSubjectsByParams(String teacherId){
		
		List<Object> subjectObjects = HibernateTemplate.getSubjectObjectsByParams(teacherId);
		List<Subject> subjects = new ArrayList<>();
		for(Object subjectObject : subjectObjects) {
			subjects.add((Subject)subjectObject);
			System.out.println((Subject)subjectObject);
		}
		return subjects;
	}
	
	public List<Subject> getSubjectsByParams(String teacherId, String subjectCategory){
		
		List<Object> subjectObjects = HibernateTemplate.getSubjectObjectsByParams(teacherId, subjectCategory);
		List<Subject> subjects = new ArrayList<>();
		for(Object subjectObject : subjectObjects) {
			subjects.add((Subject)subjectObject);
			System.out.println((Subject)subjectObject);
		}
		System.out.println("-->" + subjects);
		return subjects;
	}
	
	public List<Subject> getSubjectsByParams(int year, String branch, String subjectCategory){
		
		List<Object> subjectObjects = HibernateTemplate.getSubjectObjectsByParams(year, branch, subjectCategory);
		if(subjectObjects == null) return null;
		List<Subject> subjects = new ArrayList<Subject>();
		for(Object subjectObject : subjectObjects){
			subjects.add((Subject)subjectObject);
		}
		return subjects;	
	}
	
	public List<Subject> getSubjectsByParams(int year, String branch){
		
		List<Object> subjectObjects = HibernateTemplate.getSubjectObjectsByParams(year, branch);
		if(subjectObjects == null) return null;
		List<Subject> subjects = new ArrayList<Subject>();
		for(Object subjectObject : subjectObjects){
			subjects.add((Subject)subjectObject);
		}
		return subjects;	
	}
	
	public void deleteSubject(int year) {
		List<Subject> subjects = getAllSubjects();
		for(Subject subject : subjects) {			
			if(subject.getYear() == year) {
				HibernateTemplate.deleteObject(subject);
			}
		}
	}


}
