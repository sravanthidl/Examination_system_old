package com.dto;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="ExamTask")
public class ExamTask implements Serializable{
	
	@Id
	private int year;
	@Id
	private String examType;
	@Column
	private String settingOpenDate;
	@Column
	private String settingCloseDate;
	@Column
	private String evaluationOpenDate;
	@Column
	private String evaluationCloseDate;
	@Column
	private String resultOpenDate;
	
	public ExamTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ExamTask(int year, String examType, String settingOpenDate, String settingCloseDate,
			String evaluationOpenDate, String evaluationCloseDate, String resultOpenDate) {
		super();
		this.year = year;
		this.examType = examType;
		this.settingOpenDate = settingOpenDate;
		this.settingCloseDate = settingCloseDate;
		this.evaluationOpenDate = evaluationOpenDate;
		this.evaluationCloseDate = evaluationCloseDate;
		this.resultOpenDate = resultOpenDate;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getSettingOpenDate() {
		return settingOpenDate;
	}
	public void setSettingOpenDate(String settingOpenDate) {
		this.settingOpenDate = settingOpenDate;
	}
	public String getSettingCloseDate() {
		return settingCloseDate;
	}
	public void setSettingCloseDate(String settingCloseDate) {
		this.settingCloseDate = settingCloseDate;
	}
	public String getEvaluationOpenDate() {
		return evaluationOpenDate;
	}
	public void setEvaluationOpenDate(String evaluationOpenDate) {
		this.evaluationOpenDate = evaluationOpenDate;
	}
	public String getEvaluationCloseDate() {
		return evaluationCloseDate;
	}
	public void setEvaluationCloseDate(String evaluationCloseDate) {
		this.evaluationCloseDate = evaluationCloseDate;
	}
	public String getResultOpenDate() {
		return resultOpenDate;
	}
	public void setResultOpenDate(String resultOpenDate) {
		this.resultOpenDate = resultOpenDate;
	}
	
	@Override
	public String toString() {
		return "ExamTask [year=" + year + ", examType=" + examType + ", settingOpenDate=" + settingOpenDate
				+ ", settingCloseDate=" + settingCloseDate + ", evaluationOpenDate=" + evaluationOpenDate
				+ ", evaluationCloseDate=" + evaluationCloseDate + ", resultOpenDate=" + resultOpenDate + "]";
	}
	
}
