package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Descriptive;
import com.dto.ExtTeacher;
import com.dto.Subject;

public class ExtTeacherDao {

	public int register(ExtTeacher extTeacher) {
		return HibernateTemplate.addObject(extTeacher);
	}
	
	public int updateExtTeacherPassword(String extTeacherId, String password) {
		ExtTeacherDao extTeacherDao = new ExtTeacherDao(); 
		ExtTeacher extTeacher = extTeacherDao.getExtTeacher(extTeacherId);
		extTeacher.setPassword(password);
		return HibernateTemplate.updateObject(extTeacher);
	}
	
	public int updateExtTeacherPrereq(String extTeacherId, String YBSId, int subjectSNo) {
		ExtTeacherDao extTeacherDao = new ExtTeacherDao(); 
		ExtTeacher extTeacher = extTeacherDao.getExtTeacher(extTeacherId);
		extTeacher.setYBSId(YBSId);
		extTeacher.setSubjectSNo(subjectSNo);
		return HibernateTemplate.updateObject(extTeacher);
	}
	
	public ExtTeacher getExtTeacher(String extTeacherId) {
		ExtTeacher extTeacher = (ExtTeacher)HibernateTemplate.getUser("extTeacher", extTeacherId);
		return extTeacher;
	}
	
	public List<ExtTeacher> getExtTeacherWithYBSId(String YBSId) {
		List<Object> extTeacherObjects = HibernateTemplate.getExtTeacherWithYBSId(YBSId);
		List<ExtTeacher> extTeachers = new ArrayList<>();
		for(Object extTeacherObject : extTeacherObjects) {
			extTeachers.add((ExtTeacher)extTeacherObject);
		}
		return extTeachers;
	}
	public List<ExtTeacher> getExtTeacherWithSubjectCode(String subjectCode) {
		List<Object> extTeacherObjects = HibernateTemplate.getExtTeacherWithSubjectCode(subjectCode);
		List<ExtTeacher> extTeachers = new ArrayList<>();
		for(Object extTeacherObject : extTeacherObjects) {
			extTeachers.add((ExtTeacher)extTeacherObject);
		}
		return extTeachers;
	}
	
	public List<ExtTeacher> getAllExtTeacher() {
		List<Object> extTeacherObjects = HibernateTemplate.getAllObjects("ExtTeacher");
		List<ExtTeacher> extTeachers = new ArrayList<>();
		for(Object extTeacherObject : extTeacherObjects) {
			extTeachers.add((ExtTeacher)extTeacherObject);
		}
		return extTeachers;
	}
	
	public void deleteExtTeacher(int year) {
		SubjectDao subjectDao = new SubjectDao();
		List<ExtTeacher> extTeachers = getAllExtTeacher();
		for(ExtTeacher extTeacher : extTeachers) {
			String YBSId = extTeacher.getYBSId();
			Subject subject = subjectDao.getSubject(YBSId);
			if(subject.getYear() == year) {
				HibernateTemplate.deleteObject(extTeacher);
			}
		}
	}
	
}
