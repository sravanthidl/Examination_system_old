package com.dao;

import com.db.HibernateTemplate;
import com.dto.AcadYear;

public class AcadYearDao {
	
	public void updateSemester(int year, int semester) {
		AcadYear acadYear = HibernateTemplate.getSemester(year);
		acadYear.setSemester(semester);
		HibernateTemplate.updateObject(acadYear);

		new DescriptiveDao().deleteDescriptive(year);
		new ExamTaskDao().deleteExamTask(year);
		new ExtTeacherDao().deleteExtTeacher(year);
		new SAMDao().deleteSAM(year);
		new QuizDao().deleteQuiz(year);
		new LabMarksDao().deleteLabMarks(year);
		new SubjectDao().deleteSubject(year);
	}
	
	public void startNewAcademicYear() {
		updateSemester(1,1);
		updateSemester(2,1);
		updateSemester(3,1);
		updateSemester(4,1);
	}
	
	public int getSemester(int year) {
		AcadYear acadYear = HibernateTemplate.getSemester(year);
		return acadYear.getSemester();
	}

}
