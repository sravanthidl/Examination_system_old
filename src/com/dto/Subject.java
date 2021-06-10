package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Subject")
public class Subject {
	
	@Column
	private Integer year;
	@Column
	private String branch;
	@Column
	private String subjectCode;
	@Id
	private String YBSId;
	@Column
	private String subjectName;
	@Column
	private String subjectCategory;
	@Column
	private String teacherId;
	
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Subject(Integer year, String branch, String subjectCode, String yBSId, String subjectName,
			String subjectCategory, String teacherId) {
		super();
		this.year = year;
		this.branch = branch;
		this.subjectCode = subjectCode;
		YBSId = yBSId;
		this.subjectName = subjectName;
		this.subjectCategory = subjectCategory;
		this.teacherId = teacherId;
	}
	
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
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
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectCategory() {
		return subjectCategory;
	}
	public void setSubjectCategory(String subjectCategory) {
		this.subjectCategory = subjectCategory;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	
	@Override
	public String toString() {
		return "Subject [year=" + year + ", branch=" + branch + ", subjectCode=" + subjectCode + ", YBSId=" + YBSId
				+ ", subjectName=" + subjectName + ", subjectCategory=" + subjectCategory + ", teacherId=" + teacherId
				+ "]";
	}
	
}
