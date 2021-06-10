package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Descriptive;
import com.dto.ExamTask;
import com.dto.Quiz;
import com.dto.Subject;

public class ExamTaskDao {
	
	public int addDates(ExamTask examTask) {
		return HibernateTemplate.addObject(examTask);
	}
	
	public int updateSettingDates(int year, String examType, String settingOpenDate, String settingCloseDate) {
		ExamTaskDao examTaskDao = new ExamTaskDao();
		ExamTask examTask = examTaskDao.getExamTask(year, examType);
		examTask.setSettingOpenDate(settingOpenDate);
		examTask.setSettingCloseDate(settingCloseDate);
		return HibernateTemplate.updateObject(examTask);
	}
	
	public int updateEvaluationDates(int year, String examType, String evaluationOpenDate, String evaluationCloseDate) {
		ExamTaskDao examTaskDao = new ExamTaskDao();
		ExamTask examTask = examTaskDao.getExamTask(year, examType);
		examTask.setEvaluationOpenDate(evaluationOpenDate);
		examTask.setEvaluationCloseDate(evaluationCloseDate);
		return HibernateTemplate.updateObject(examTask);
	}
	
	public int updateResultDates(int year, String examType, String resultOpenDate) {
		ExamTaskDao examTaskDao = new ExamTaskDao();
		ExamTask examTask = examTaskDao.getExamTask(year, examType);
		examTask.setResultOpenDate(resultOpenDate);
		return HibernateTemplate.updateObject(examTask);
	}
	
	public ExamTask getExamTask(int year, String examType) {
		ExamTask examTask = HibernateTemplate.getExamTask(year, examType);
		return examTask;
	}
	
	public List<ExamTask> getExamTask(int year) {
		List<Object> examTaskObjects = HibernateTemplate.getExamTask(year);
		List<ExamTask> examTasks = new ArrayList<>();
		for(Object examTaskObject : examTaskObjects) {
			examTasks.add((ExamTask)examTaskObject);
		}
		return examTasks;
	}
	
	public List<ExamTask> getAllExamTask() {
		List<Object> examTaskObjects = HibernateTemplate.getAllObjects("ExamTask");
		List<ExamTask> examTasks = new ArrayList<>();
		for(Object examTaskObject : examTaskObjects) {
			examTasks.add((ExamTask)examTaskObject);
		}
		return examTasks;
	}
	
	public void deleteExamTask(int year) {
		List<ExamTask> examTasks = getAllExamTask();
		for(ExamTask examTask : examTasks) {			
			if(examTask.getYear() == year) {
				HibernateTemplate.deleteObject(examTask);
			}
		}
	}

}
