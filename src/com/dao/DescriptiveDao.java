package com.dao;

import com.db.HibernateTemplate;
import com.dto.Descriptive;

public class DescriptiveDao {
	
	public Descriptive getDescriptiveByYBSIdAndExamType(String YBSId, String examType) {
		return HibernateTemplate.getDescriptiveByYBSIdAndExamType(YBSId, examType);
	}
	
	public int addTimeStamp(Descriptive descriptive) {
		return HibernateTemplate.addObject(descriptive);
	}
	
	public int updateTimeStamp(String YBSId, String examType, String examDate, String openTime, String closeTime) {
		return HibernateTemplate.updateExamTimeStamp(YBSId, examType, examDate, openTime, closeTime);
	}
	
	public int updateQPaperPath(String YBSId, String examType, String QPaperPath) {
		return HibernateTemplate.updateQPaperPath(YBSId, examType, QPaperPath);
	}
}