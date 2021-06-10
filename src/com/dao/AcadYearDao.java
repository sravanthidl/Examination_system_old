package com.dao;

import com.db.HibernateTemplate;
import com.dto.AcadYear;

public class AcadYearDao {
	
	public void startNewSemester(int year, int semester) {
		AcadYear acadYear = HibernateTemplate.getAcadYear(year);
		acadYear.setSemester(semester);
		HibernateTemplate.updateObject(acadYear);

		new DescriptiveDao().deleteDescriptive(year);
		new ExamTaskDao().deleteExamTask(year);
		new ExtTeacherDao().deleteExtTeacher(year);
		new SAMDao().deleteSAM(year);
		new QuizDao().deleteQuiz(year);
		new LabMarksDao().deleteLabMarks(year);
		new SubjectDao().deleteSubject(year);

		StudentDao studentDao = new StudentDao();
		studentDao.updateStudentsSemester(year);
	}
	
	public int getSemester(int year) {
		AcadYear acadYear = HibernateTemplate.getAcadYear(year);
		return acadYear.getSemester();
	}
	
	public void startNewAcademicYear() {
		startNewSemester(1,1);
		startNewSemester(2,1);
		startNewSemester(3,1);
		startNewSemester(4,1);
		StudentDao studentDao = new StudentDao();
		studentDao.deleteStudents(4);
		studentDao.updateStudentsAcadYear(3);
		studentDao.updateStudentsAcadYear(2);
		studentDao.updateStudentsAcadYear(1);
	}

}
