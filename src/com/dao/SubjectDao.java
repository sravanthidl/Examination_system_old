package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Controller;
import com.dto.Subject;

public class SubjectDao {
	
private SessionFactory factory = null;
	
	public int register(Subject subject) {
		System.out.println(subject.toString());
		return HibernateTemplate.addObject(subject);
	}
	
	public int updateTeacherId(String YBSId, String teacherId) {
		return HibernateTemplate.updateTeacherId(YBSId, teacherId);
		
	}
	
	public List<Subject> getAllSubjectsByTeacherId(String teacherId){
		
		List<Object> subjectObjects = HibernateTemplate.getObjectListByConstraints(teacherId);
		List<Subject> subjects = new ArrayList<>();
		for(Object subjectObject : subjectObjects) {
			subjects.add((Subject)subjectObject);
			System.out.println((Subject)subjectObject);
		}
		return subjects;
	}
	
	public List<String> getAllSubjectNamesByYearAndBranch(int year, String branch){
		
		List<Object> subjectObjects = HibernateTemplate.getObjectListByConstraints(year, branch);
		if(subjectObjects == null) return null;
		List<String> subjectNames = new ArrayList<String>();
		for(Object subjectObject : subjectObjects){
			subjectNames.add(((Subject)subjectObject).getSubjectName());
		}
		return subjectNames;	
	}



}
