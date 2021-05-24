package com.dao;
import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Customer;

public class CustomerDao {

	private SessionFactory factory = null;
	
	public static Customer getCustomer(String user) {

		return (Customer)HibernateTemplate.getObjectByUserName(user);
	}

	public int register(Customer customer) {
		return HibernateTemplate.addObject(customer);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomers() {
		List<Customer> customers=(List)HibernateTemplate.getObjectListByQuery("From Customer");
		System.out.println("Inside All Customers ..."+customers);
		return customers;	
	}

	public static Customer getCustomer(int id) {
		return (Customer)HibernateTemplate.getObject(Customer.class,id);
	}

	public static int DeleteCustomer(int custId) {
		// TODO Auto-generated method stub
		return HibernateTemplate.deleteObject(Customer.class,custId);
	}

	public static int editCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return HibernateTemplate.updateObject(customer);
	}
}