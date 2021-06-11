package com.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LabMarks")
public class LabMarks implements Serializable{

	@Id
	private String studentId;
	@Id
	private String YBSId;
	@Column
	private Integer internalMarks = 0;
	@Column
	private Integer externalMarks = 0;
	@Column
	private Integer netMarks = 0;
	@Column
	private String grade = "F";
	@Column
	private Integer gradePoints = 0;
	
	public LabMarks() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LabMarks(String studentId, String yBSId, Integer internalMarks, Integer externalMarks, Integer netMarks,
			String grade, Integer gradePoints) {
		super();
		this.studentId = studentId;
		YBSId = yBSId;
		this.internalMarks = internalMarks;
		this.externalMarks = externalMarks;
		this.netMarks = netMarks;
		this.grade = grade;
		this.gradePoints = gradePoints;
	}
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getYBSId() {
		return YBSId;
	}
	public void setYBSId(String yBSId) {
		YBSId = yBSId;
	}
	public Integer getInternalMarks() {
		return internalMarks;
	}
	public void setInternalMarks(Integer internalMarks) {
		this.internalMarks = internalMarks;
	}
	public Integer getExternalMarks() {
		return externalMarks;
	}
	public void setExternalMarks(Integer externalMarks) {
		this.externalMarks = externalMarks;
	}
	public Integer getNetMarks() {
		return netMarks;
	}
	public void setNetMarks(Integer netMarks) {
		this.netMarks = netMarks;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Integer getGradePoints() {
		return gradePoints;
	}
	public void setGradePoints(Integer gradePoints) {
		this.gradePoints = gradePoints;
	}
	
	@Override
	public String toString() {
		return "LabMarks [studentId=" + studentId + ", YBSId=" + YBSId + ", internalMarks=" + internalMarks
				+ ", externalMarks=" + externalMarks + ", netMarks=" + netMarks + ", grade=" + grade + ", gradePoints="
				+ gradePoints + "]";
	}
	
}
