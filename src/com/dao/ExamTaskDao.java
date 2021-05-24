package com.dao;

import com.db.HibernateTemplate;
import com.dto.ExamTask;
import com.dto.Quiz;

public class ExamTaskDao {
	
	public int addDates(ExamTask examTask) {
		return HibernateTemplate.addObject(examTask);
	}
	
	public boolean checkIfExamTaskExists(int year, String examType) {
		ExamTask examTask = HibernateTemplate.checkIfExamTaskExists(year, examType);
		if(examTask == null) return false;
		return true;
	}
	
	public int updateSettingDates(int year, String examType, String settingOpenDate, String settingCloseDate) {
		return HibernateTemplate.updateSettingDates(year, examType, settingOpenDate, settingCloseDate);
	}
	
	public int updateEvaluationDates(int year, String examType, String evaluationOpenDate, String evaluationCloseDate) {
		return HibernateTemplate.updateEvaluationDates(year, examType, evaluationOpenDate, evaluationCloseDate);
	}
	
	public int updateResultDates(int year, String examType, String resultOpenDate) {
		return HibernateTemplate.updateResultDates(year, examType, resultOpenDate);
	}

}
