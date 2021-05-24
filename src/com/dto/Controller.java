package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Controller")

public class Controller {
	
	@Id
	private String controllerId;
	@Column
	private String password;
	@Column
	private String name;
	@Column
	private String designation;
	@Column
	private String mobile;
	@Column
	private String email;
	
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Controller(String controllerId, String password, String name, String designation, String mobile,
			String email) {
		super();
		this.controllerId = controllerId;
		this.password = password;
		this.name = name;
		this.designation = designation;
		this.mobile = mobile;
		this.email = email;
	}

	public String getControllerId() {
		return controllerId;
	}

	public void setControllerId(String controllerId) {
		this.controllerId = controllerId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Controller [controllerId=" + controllerId + ", password=" + password + ", name=" + name
				+ ", designation=" + designation + ", mobile=" + mobile + ", email=" + email + "]";
	}
	
	

}
