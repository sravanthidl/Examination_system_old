package com.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ScriptsAndMarks")
public class SAM implements Serializable{
	
	@Id
	private String studentId;
	@Id
	private String YBSId;
	@Column
	private String desc1Script;
	@Column
	private Integer desc1Marks;
	@Column
	private Integer quiz1Marks;
	@Column
	private String asgn1Script;
	@Column
	private Integer asgn1Marks;
	@Column
	private Integer mid1NetMarks;
	@Column
	private String desc2Script;
	@Column
	private Integer desc2Marks;
	@Column
	private Integer quiz2Marks;
	@Column
	private String asgn2Script;
	@Column
	private Integer asgn2Marks;
	@Column
	private Integer mid2NetMarks;
	@Column
	private Integer midNetMarks;
	@Column
	private String semScript;
	@Column
	private Integer semMarks;
	@Column
	private Integer semNetMarks;
	@Column
	private String grade;
	@Column
	private Integer gradePoints;
	
	public SAM() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SAM(String studentId, String yBSId, String desc1Script, Integer desc1Marks, Integer quiz1Marks,
			String asgn1Script, Integer asgn1Marks, Integer mid1NetMarks, String desc2Script, Integer desc2Marks,
			Integer quiz2Marks, String asgn2Script, Integer asgn2Marks, Integer mid2NetMarks, Integer midNetMarks,
			String semScript, Integer semMarks, Integer semNetMarks, String grade, Integer gradePoints) {
		super();
		this.studentId = studentId;
		YBSId = yBSId;
		this.desc1Script = desc1Script;
		this.desc1Marks = desc1Marks;
		this.quiz1Marks = quiz1Marks;
		this.asgn1Script = asgn1Script;
		this.asgn1Marks = asgn1Marks;
		this.mid1NetMarks = mid1NetMarks;
		this.desc2Script = desc2Script;
		this.desc2Marks = desc2Marks;
		this.quiz2Marks = quiz2Marks;
		this.asgn2Script = asgn2Script;
		this.asgn2Marks = asgn2Marks;
		this.mid2NetMarks = mid2NetMarks;
		this.midNetMarks = midNetMarks;
		this.semScript = semScript;
		this.semMarks = semMarks;
		this.semNetMarks = semNetMarks;
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
	public String getDesc1Script() {
		return desc1Script;
	}
	public void setDesc1Script(String desc1Script) {
		this.desc1Script = desc1Script;
	}
	public Integer getDesc1Marks() {
		return desc1Marks;
	}
	public void setDesc1Marks(Integer desc1Marks) {
		this.desc1Marks = desc1Marks;
	}
	public Integer getQuiz1Marks() {
		return quiz1Marks;
	}
	public void setQuiz1Marks(Integer quiz1Marks) {
		this.quiz1Marks = quiz1Marks;
	}
	public String getAsgn1Script() {
		return asgn1Script;
	}
	public void setAsgn1Script(String asgn1Script) {
		this.asgn1Script = asgn1Script;
	}
	public Integer getAsgn1Marks() {
		return asgn1Marks;
	}
	public void setAsgn1Marks(Integer asgn1Marks) {
		this.asgn1Marks = asgn1Marks;
	}
	public Integer getMid1NetMarks() {
		return mid1NetMarks;
	}
	public void setMid1NetMarks(Integer mid1NetMarks) {
		this.mid1NetMarks = mid1NetMarks;
	}
	public String getDesc2Script() {
		return desc2Script;
	}
	public void setDesc2Script(String desc2Script) {
		this.desc2Script = desc2Script;
	}
	public Integer getDesc2Marks() {
		return desc2Marks;
	}
	public void setDesc2Marks(Integer desc2Marks) {
		this.desc2Marks = desc2Marks;
	}
	public Integer getQuiz2Marks() {
		return quiz2Marks;
	}
	public void setQuiz2Marks(Integer quiz2Marks) {
		this.quiz2Marks = quiz2Marks;
	}
	public String getAsgn2Script() {
		return asgn2Script;
	}
	public void setAsgn2Script(String asgn2Script) {
		this.asgn2Script = asgn2Script;
	}
	public Integer getAsgn2Marks() {
		return asgn2Marks;
	}
	public void setAsgn2Marks(Integer asgn2Marks) {
		this.asgn2Marks = asgn2Marks;
	}
	public Integer getMid2NetMarks() {
		return mid2NetMarks;
	}
	public void setMid2NetMarks(Integer mid2NetMarks) {
		this.mid2NetMarks = mid2NetMarks;
	}
	public Integer getMidNetMarks() {
		return midNetMarks;
	}
	public void setMidNetMarks(Integer midNetMarks) {
		this.midNetMarks = midNetMarks;
	}
	public String getSemScript() {
		return semScript;
	}
	public void setSemScript(String semScript) {
		this.semScript = semScript;
	}
	public Integer getSemMarks() {
		return semMarks;
	}
	public void setSemMarks(Integer semMarks) {
		this.semMarks = semMarks;
	}
	public Integer getSemNetMarks() {
		return semNetMarks;
	}
	public void setSemNetMarks(Integer semNetMarks) {
		this.semNetMarks = semNetMarks;
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
		return "SAM [studentId=" + studentId + ", YBSId=" + YBSId + ", desc1Script=" + desc1Script + ", desc1Marks="
				+ desc1Marks + ", quiz1Marks=" + quiz1Marks + ", asgn1Script=" + asgn1Script + ", asgn1Marks="
				+ asgn1Marks + ", mid1NetMarks=" + mid1NetMarks + ", desc2Script=" + desc2Script + ", desc2Marks="
				+ desc2Marks + ", quiz2Marks=" + quiz2Marks + ", asgn2Script=" + asgn2Script + ", asgn2Marks="
				+ asgn2Marks + ", mid2NetMarks=" + mid2NetMarks + ", midNetMarks=" + midNetMarks + ", semScript="
				+ semScript + ", semMarks=" + semMarks + ", semNetMarks=" + semNetMarks + ", grade=" + grade
				+ ", gradePoints=" + gradePoints + "]";
	}

}