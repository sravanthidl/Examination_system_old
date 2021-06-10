package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Controller;
import com.dto.Teacher;

public class ControllerDao {
	
	public int add(Controller controller) {
		System.out.println(controller.toString());
		return HibernateTemplate.addObject(controller);
	}
	
	public int updatePassword(String controllerId, String password) {
		ControllerDao controllerDao = new ControllerDao();
		Controller controller = getController(controllerId);
		controller.setPassword(password);
		return HibernateTemplate.updateObject(controller);
	}
	
	public Controller getController(String controllerId) {
		Controller controller = (Controller)HibernateTemplate.getUser("controller", controllerId);
		return controller;
	}

}
