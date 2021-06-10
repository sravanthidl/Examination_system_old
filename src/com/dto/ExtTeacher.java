package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ExtTeacher")

public class ExtTeacher {
	
	@Id
	private String extTeacherId;
	@Column
	private String password;
	@Column
	private String name;
	@Column
	private String branch;
	@Column
	private String subjectCode;
	@Column
	private String YBSId;
	@Column
	private Integer subjectSNo;
	@Column
	private String mobile;
	
	public ExtTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ExtTeacher(String extTeacherId, String password, String name, String branch, String subjectCode,
			String yBSId, Integer subjectSNo, String mobile) {
		super();
		this.extTeacherId = extTeacherId;
		this.password = password;
		this.name = name;
		this.branch = branch;
		this.subjectCode = subjectCode;
		YBSId = yBSId;
		this.subjectSNo = subjectSNo;
		this.mobile = mobile;
	}
	
	public String getExtTeacherId() {
		return extTeacherId;
	}
	public void setExtTeacherId(String extTeacherId) {
		this.extTeacherId = extTeacherId;
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
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getYBSId() {
		return YBSId;
	}
	public void setYBSId(String yBSId) {
		YBSId = yBSId;
	}
	public Integer getSubjectSNo() {
		return subjectSNo;
	}
	public void setSubjectSNo(Integer subjectSNo) {
		this.subjectSNo = subjectSNo;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Override
	public String toString() {
		return "ExtTeacher [extTeacherId=" + extTeacherId + ", password=" + password + ", name=" + name + ", branch="
				+ branch + ", subjectCode=" + subjectCode + ", YBSId=" + YBSId + ", subjectSNo=" + subjectSNo
				+ ", mobile=" + mobile + "]";
	}

}
