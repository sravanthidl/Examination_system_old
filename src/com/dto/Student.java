package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Student")
public class Student {
	
	@Id
	private String studentId;
	@Column
	private String password;
	@Column
	private String name;
	@Column
	private Integer batch;
	@Column
	private String branch;
	@Column
	private String mobile;
	@Column
	private String email;
	@Column
	private Integer currentYear;
	@Column
	private Integer currentSem;
	@Column
	private Float sgpa1 = (float)0.0;
	@Column
	private Float sgpa2 = (float)0.0;
	@Column
	private Float sgpa3 = (float)0.0;
	@Column
	private Float sgpa4 = (float)0.0;
	@Column
	private Float sgpa5 = (float)0.0;
	@Column
	private Float sgpa6 = (float)0.0;
	@Column
	private Float sgpa7 = (float)0.0;
	@Column
	private Float sgpa8 = (float)0.0;
	@Column
	private Float cgpa = (float)0.0;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Student(String studentId, String password, String name, Integer batch, String branch, String mobile,
			String email, Integer currentYear, Integer currentSem, Float sgpa1, Float sgpa2, Float sgpa3, Float sgpa4,
			Float sgpa5, Float sgpa6, Float sgpa7, Float sgpa8, Float cgpa) {
		super();
		this.studentId = studentId;
		this.password = password;
		this.name = name;
		this.batch = batch;
		this.branch = branch;
		this.mobile = mobile;
		this.email = email;
		this.currentYear = currentYear;
		this.currentSem = currentSem;
		this.sgpa1 = sgpa1;
		this.sgpa2 = sgpa2;
		this.sgpa3 = sgpa3;
		this.sgpa4 = sgpa4;
		this.sgpa5 = sgpa5;
		this.sgpa6 = sgpa6;
		this.sgpa7 = sgpa7;
		this.sgpa8 = sgpa8;
		this.cgpa = cgpa;
	}
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
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
	public Integer getBatch() {
		return batch;
	}
	public void setBatch(Integer batch) {
		this.batch = batch;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
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
	public Integer getCurrentYear() {
		return currentYear;
	}
	public void setCurrentYear(Integer currentYear) {
		this.currentYear = currentYear;
	}
	public Integer getCurrentSem() {
		return currentSem;
	}
	public void setCurrentSem(Integer currentSem) {
		this.currentSem = currentSem;
	}
	public Float getSgpa1() {
		return sgpa1;
	}
	public void setSgpa1(Float sgpa1) {
		this.sgpa1 = sgpa1;
	}
	public Float getSgpa2() {
		return sgpa2;
	}
	public void setSgpa2(Float sgpa2) {
		this.sgpa2 = sgpa2;
	}
	public Float getSgpa3() {
		return sgpa3;
	}
	public void setSgpa3(Float sgpa3) {
		this.sgpa3 = sgpa3;
	}
	public Float getSgpa4() {
		return sgpa4;
	}
	public void setSgpa4(Float sgpa4) {
		this.sgpa4 = sgpa4;
	}
	public Float getSgpa5() {
		return sgpa5;
	}
	public void setSgpa5(Float sgpa5) {
		this.sgpa5 = sgpa5;
	}
	public Float getSgpa6() {
		return sgpa6;
	}
	public void setSgpa6(Float sgpa6) {
		this.sgpa6 = sgpa6;
	}
	public Float getSgpa7() {
		return sgpa7;
	}
	public void setSgpa7(Float sgpa7) {
		this.sgpa7 = sgpa7;
	}
	public Float getSgpa8() {
		return sgpa8;
	}
	public void setSgpa8(Float sgpa8) {
		this.sgpa8 = sgpa8;
	}
	public Float getCgpa() {
		return cgpa;
	}
	public void setCgpa(Float cgpa) {
		this.cgpa = cgpa;
	}
	
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", password=" + password + ", name=" + name + ", batch=" + batch
				+ ", branch=" + branch + ", mobile=" + mobile + ", email=" + email + ", currentYear=" + currentYear
				+ ", currentSem=" + currentSem + ", sgpa1=" + sgpa1 + ", sgpa2=" + sgpa2 + ", sgpa3=" + sgpa3
				+ ", sgpa4=" + sgpa4 + ", sgpa5=" + sgpa5 + ", sgpa6=" + sgpa6 + ", sgpa7=" + sgpa7 + ", sgpa8=" + sgpa8
				+ ", cgpa=" + cgpa + "]";
	}

}
