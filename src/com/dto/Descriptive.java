package com.dto;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Descriptive")
public class Descriptive implements Serializable{
	
	@Id
	private String YBSId;
	@Id
	private String examType;
	@Column
	private String TeacherId;
	@Column
	private String QPaperPath;
	@Column
	private String examDate;
	@Column
	private String examOpenTime;
	@Column
	private String examCloseTime;
	@Column
	private String asgnPaperPath;
	@Column
	private String asgnOpenDate;
	@Column
	private String asgnCloseDate;
	
	public Descriptive() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Descriptive(String yBSId, String examType, String teacherId, String qPaperPath, String examDate,
			String examOpenTime, String examCloseTime, String asgnPaperPath, String asgnOpenDate,
			String asgnCloseDate) {
		super();
		YBSId = yBSId;
		this.examType = examType;
		TeacherId = teacherId;
		QPaperPath = qPaperPath;
		this.examDate = examDate;
		this.examOpenTime = examOpenTime;
		this.examCloseTime = examCloseTime;
		this.asgnPaperPath = asgnPaperPath;
		this.asgnOpenDate = asgnOpenDate;
		this.asgnCloseDate = asgnCloseDate;
	}
	
	public String getYBSId() {
		return YBSId;
	}
	public void setYBSId(String yBSId) {
		YBSId = yBSId;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getTeacherId() {
		return TeacherId;
	}
	public void setTeacherId(String teacherId) {
		TeacherId = teacherId;
	}
	public String getQPaperPath() {
		return QPaperPath;
	}
	public void setQPaperPath(String qPaperPath) {
		QPaperPath = qPaperPath;
	}
	public String getExamDate() {
		return examDate;
	}
	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}
	public String getExamOpenTime() {
		return examOpenTime;
	}
	public void setExamOpenTime(String examOpenTime) {
		this.examOpenTime = examOpenTime;
	}
	public String getExamCloseTime() {
		return examCloseTime;
	}
	public void setExamCloseTime(String examCloseTime) {
		this.examCloseTime = examCloseTime;
	}
	public String getAsgnPaperPath() {
		return asgnPaperPath;
	}
	public void setAsgnPaperPath(String asgnPaperPath) {
		this.asgnPaperPath = asgnPaperPath;
	}
	public String getAsgnOpenDate() {
		return asgnOpenDate;
	}
	public void setAsgnOpenDate(String asgnOpenDate) {
		this.asgnOpenDate = asgnOpenDate;
	}
	public String getAsgnCloseDate() {
		return asgnCloseDate;
	}
	public void setAsgnCloseDate(String asgnCloseDate) {
		this.asgnCloseDate = asgnCloseDate;
	}
	
	@Override
	public String toString() {
		return "Descriptive [YBSId=" + YBSId + ", examType=" + examType + ", TeacherId=" + TeacherId + ", QPaperPath="
				+ QPaperPath + ", examDate=" + examDate + ", examOpenTime=" + examOpenTime + ", examCloseTime="
				+ examCloseTime + ", asgnPaperPath=" + asgnPaperPath + ", asgnOpenDate=" + asgnOpenDate
				+ ", asgnCloseDate=" + asgnCloseDate + "]";
	}
	
}
