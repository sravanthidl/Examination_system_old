package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Controller;
import com.dto.Teacher;


public class ControllerDao {
	private SessionFactory factory = null;
	
	public int register(Controller controller) {
		System.out.println(controller.toString());
		return HibernateTemplate.addObject(controller);
	}
	
	public Controller getControllerById(String controllerId) {
		Controller controller = HibernateTemplate.getControllerById(controllerId);
		return controller;
	}
	
	public int updateControllerPassword(String controllerId, String password) {
		return HibernateTemplate.updateControllerPassword(controllerId, password);
	}

}
