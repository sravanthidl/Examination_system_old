package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Descriptive;
import com.dto.Quiz;
import com.dto.Subject;

public class QuizDao {

	public int addQuestion(Quiz quiz) {
		return HibernateTemplate.addObject(quiz);
	}
	
	public int updateQuiz(String YBSId, String examType, int questionNo, String question, String optionA, String optionB, String optionC, String optionD, String answerOption) {
		QuizDao quizDao = new QuizDao();
		Quiz quiz = quizDao.getQuiz(YBSId, examType, questionNo);
		quiz.setQuestion(question);
		quiz.setOptionA(optionA);
		quiz.setOptionB(optionB);
		quiz.setOptionC(optionC);
		quiz.setOptionD(optionD);
		quiz.setAnswerOption(answerOption);
		return HibernateTemplate.updateObject(quiz);
	}
	
	public Quiz getQuiz(String YBSId, String examType, int questionNo) {
		return HibernateTemplate.getQuiz(YBSId, examType, questionNo);
	}
	
	public List<Quiz> getAllQuiz() {
		List<Object> quizObjects = HibernateTemplate.getAllObjects("Quiz");
		List<Quiz> quizzes = new ArrayList<>();
		for(Object quizObject : quizObjects) {
			quizzes.add((Quiz)quizObject);
		}
		return quizzes;
	}
	
	public void deleteQuiz(int year) {
		SubjectDao subjectDao = new SubjectDao();
		List<Quiz> quizzes = getAllQuiz();
		for(Quiz quiz : quizzes) {
			String YBSId = quiz.getYBSId();
			Subject subject = subjectDao.getSubject(YBSId);
			
			if(subject.getYear() == year) {
				HibernateTemplate.deleteObject(quiz);
			}
		}
	}
	
}
