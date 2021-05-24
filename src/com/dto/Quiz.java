package com.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Quiz")
public class Quiz implements Serializable{
	
	@Id
	private String YBSId;
	@Id
	private String examType;
	@Id
	private int questionNo;
	@Column
	private String question;
	@Column
	private String optionA;
	@Column
	private String optionB;
	@Column
	private String optionC;
	@Column
	private String optionD;
	@Column
	private String answerOption;
	
	public Quiz() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Quiz(String yBSId, String examType, int questionNo, String question, String optionA, String optionB,
			String optionC, String optionD, String answerOption) {
		super();
		YBSId = yBSId;
		this.examType = examType;
		this.questionNo = questionNo;
		this.question = question;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.answerOption = answerOption;
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
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getAnswerOption() {
		return answerOption;
	}
	public void setAnswerOption(String answerOption) {
		this.answerOption = answerOption;
	}
	
	@Override
	public String toString() {
		return "Quiz [YBSId=" + YBSId + ", examType=" + examType + ", questionNo=" + questionNo + ", question="
				+ question + ", optionA=" + optionA + ", optionB=" + optionB + ", optionC=" + optionC + ", optionD="
				+ optionD + ", answerOption=" + answerOption + "]";
	}

}
