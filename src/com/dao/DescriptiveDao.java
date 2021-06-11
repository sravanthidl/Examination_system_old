package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Descriptive;
import com.dto.Subject;

public class DescriptiveDao {
	
	public int addDescriptive(Descriptive descriptive) {
		return HibernateTemplate.addObject(descriptive);
	}
	
	public int updateExamTimeStamp(String YBSId, String examType, String examDate, String openTime, String closeTime) {
		DescriptiveDao descriptiveDao = new DescriptiveDao();
		Descriptive descriptive = descriptiveDao.getDescriptive(YBSId, examType);
		descriptive.setExamDate(examDate);
		descriptive.setExamOpenTime(openTime);
		descriptive.setExamCloseTime(closeTime);
		return HibernateTemplate.updateObject(descriptive);
	}
	
	public int updateQPaperPath(String YBSId, String examType, String teacherId, String QPaperPath) {
		DescriptiveDao descriptiveDao = new DescriptiveDao();
		Descriptive descriptive = descriptiveDao.getDescriptive(YBSId, examType);
		descriptive.setTeacherId(teacherId);
		descriptive.setQPaperPath(QPaperPath);
		return HibernateTemplate.updateObject(descriptive);
	}
	
	public int updateAsgnPaperPath(String YBSId, String examType, String teacherId, String asgnPaperPath, String asgnOpenDate, String asgnCloseDate) {
		DescriptiveDao descriptiveDao = new DescriptiveDao();
		Descriptive descriptive = descriptiveDao.getDescriptive(YBSId, examType);
		descriptive.setTeacherId(teacherId);
		descriptive.setAsgnPaperPath(asgnPaperPath);
		descriptive.setAsgnOpenDate(asgnOpenDate);
		descriptive.setAsgnCloseDate(asgnCloseDate);
		System.out.println("In descDao"+descriptive.toString());
		return HibernateTemplate.updateObject(descriptive);
	}
	
	public Descriptive getDescriptive(String YBSId, String examType) {
		return HibernateTemplate.getDescriptive(YBSId, examType);
	}
	
	public List<Descriptive> getAllDescriptive() {
		List<Object> descriptiveObjects = HibernateTemplate.getAllObjects("Descriptive");
		List<Descriptive> descriptives = new ArrayList<>();
		for(Object descriptiveObject : descriptiveObjects) {
			descriptives.add((Descriptive)descriptiveObject);
		}
		return descriptives;
	}
	
	public void deleteDescriptive(int year) {
		SubjectDao subjectDao = new SubjectDao();
		List<Descriptive> descriptives = getAllDescriptive();
		for(Descriptive descriptive : descriptives) {
			String YBSId = descriptive.getYBSId();
			Subject subject = subjectDao.getSubject(YBSId);
			
			if(subject.getYear() == year) {
				System.out.println("Hey! "+ descriptive.toString());
				HibernateTemplate.deleteObject(descriptive);
			}
		}
	}
	
}
