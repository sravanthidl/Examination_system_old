package com.dao;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Teacher;

public class TeacherDao {
	
	private SessionFactory factory = null;
	

	public int register(Teacher teacher) {
		return HibernateTemplate.addObject(teacher);
	}
	
	public Teacher getTeacherById(String teacherId) {
		Teacher teacher = HibernateTemplate.getTeacherById(teacherId);
		return teacher;
	}
	
	public int updateTeacherPassword(String teacherId, String password) {
		return HibernateTemplate.updateTeacherPassword(teacherId, password);
	}
	
	public String getBranchByTeacherId(String teacherId) {
		Teacher teacher = (Teacher) HibernateTemplate.getObjectByQuery("from Teacher where teacherId = :teacherId");
		System.out.println(teacher.getBranch());
		return teacher.getBranch();
	}
}
