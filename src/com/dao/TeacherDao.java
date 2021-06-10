package com.dao;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.ExtTeacher;
import com.dto.Teacher;

public class TeacherDao {

	public int register(Teacher teacher) {
		return HibernateTemplate.addObject(teacher);
	}
	
	public int updatePassword(String teacherId, String password) {
		TeacherDao teacherDao = new TeacherDao(); 
		Teacher teacher = teacherDao.getTeacher(teacherId);
		teacher.setPassword(password);
		return HibernateTemplate.updateObject(teacher);
	}
	
	public Teacher getTeacher(String teacherId) {
		Teacher teacher = (Teacher)HibernateTemplate.getUser("teacher", teacherId);
		return teacher;
	}

}
