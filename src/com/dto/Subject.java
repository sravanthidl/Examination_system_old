package com.dto;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Subject")
public class Subject {
	
	@Column
	private int year;
	@Column
	private String branch;
	@Column
	private String subjectName;
	@Id
	private String YBSId;
	@Column
	private String BSId;
	@Column
	private String teacherId;
	
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Subject(int year, String branch, String subjectName, String yBSId, String bSId, String teacherId) {
		super();
		this.year = year;
		this.branch = branch;
		this.subjectName = subjectName;
		YBSId = yBSId;
		BSId = bSId;
		this.teacherId = teacherId;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getYBSId() {
		return YBSId;
	}
	public void setYBSId(String yBSId) {
		YBSId = yBSId;
	}
	public String getBSId() {
		return BSId;
	}
	public void setBSId(String bSId) {
		BSId = bSId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	
	@Override
	public String toString() {
		return "Subject [year=" + year + ", branch=" + branch + ", subjectName=" + subjectName + ", YBSId=" + YBSId + ", BSId="
				+ BSId + ", teacherId=" + teacherId + "]";
	}
	
	
}
