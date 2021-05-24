package com.dao;

import com.db.HibernateTemplate;
import com.dto.Quiz;

public class QuizDao {

	public int addQuestion(Quiz quiz) {
		return HibernateTemplate.addObject(quiz);
	}
	
}
