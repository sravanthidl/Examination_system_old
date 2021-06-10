package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AcadYear")
public class AcadYear {
	
	@Id
	private int year;
	@Column
	private int semester;
	
	public AcadYear() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AcadYear(int year, int semester) {
		super();
		this.year = year;
		this.semester = semester;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	@Override
	public String toString() {
		return "AcadYear [year=" + year + ", semester=" + semester + "]";
	}

}
