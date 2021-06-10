package com.db;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.dto.AcadYear;
import com.dto.Controller;
import com.dto.Descriptive;
import com.dto.ExamTask;
import com.dto.ExtTeacher;
import com.dto.LabMarks;
import com.dto.Quiz;
import com.dto.SAM;
import com.dto.Subject;
import com.dto.Teacher;
import com.dto.AcadYear;

public class HibernateTemplate {

	private static SessionFactory sessionFactory;
	
	static
	{
		//Configuration cfg = new Configuration();
        //cfg.configure("hibernate.cfg.xml");
		sessionFactory=new Configuration().configure().buildSessionFactory();
		
	}
	
	public static int addObject(Object obj)
	{
		int result=0;
		
		Transaction tx=null;
		
		try {
			
			Session session=sessionFactory.openSession();
			tx=session.beginTransaction();
			
			session.save(obj);
			
			tx.commit();
			
			result=1;
			
		} catch (Exception e) {
		
			tx.rollback();
			
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static Object getObject(java.lang.Class c,Serializable serializable)
	{
		Object obj=null;
		
		try {			
			return sessionFactory.openSession().get(c,serializable);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return obj;
	}
	
	
	public static int updateObject(Object obj)
	{
		int result=0;
		
		Transaction tx=null;
		
		try {
			
			Session session=sessionFactory.openSession();
			tx=session.beginTransaction();
			
			//session.saveOrUpdate(obj);
			session.merge(obj);
			
			tx.commit();
			
			result=1;
			
		} catch (Exception e) {
		
			tx.rollback();
			
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static int deleteObject(Object obj)
	{
		int result=0;
		
		Session session=sessionFactory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		try {			
			session.delete(obj); 
			
			tx.commit();
			
			result=1;
						
		} catch (Exception e) {
			
			e.printStackTrace();
			
			tx.rollback();
		}
		
		return result;
	}
	
	public static int deleteObject(java.lang.Class c,Serializable serializable)
	{
		int result=0;
		
		Session session=sessionFactory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		try {
			
			Object obj=session.get(c,serializable);
			
			session.delete(obj); 
			
			/*Query query = session.createQuery("delete from Cart where custId = ");
			int result = query.executeUpdate();*/
			
			tx.commit();
			
			result=1;
						
		} catch (Exception e) {
			
			e.printStackTrace();
			
			tx.rollback();
		}
		
		return result;
	}
	
	/*public static int updatePassword(String user, String id, String password) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String queryString = null;
		if(user.equals("controller")) queryString = "update Controller set password= :password where controllerId = :id";
		else if(user.equals("teacher")) queryString = "update Teacher set password= :password where teacherId = :id";
		else queryString = "update ExtTeacher set password= :password where extTeacherId = :id";
		Query query = session.createQuery(queryString);  
		query.setString("id", id);  
		query.setString("password", password);  
		int status = query.executeUpdate();   
		tx.commit();
		return status;
	}

	public static int updateTeacherId(String YBSId, String teacherId) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Subject set teacherId= :teacherId where YBSId= :YBSId");  
		query.setString("teacherId", teacherId);  
		query.setString("YBSId", YBSId);  
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateExtTeacherByParams(String extTeacherId, String YBSId, int subjectSNo) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update ExtTeacher set YBSId= :YBSId, subjectSNo= :subjectSNo where extTeacherId = :extTeacherId");  
		query.setString("extTeacherId", extTeacherId);  
		query.setString("YBSId", YBSId);
		query.setInteger("subjectSNo", subjectSNo);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateSettingDates(int year, String examType, String settingOpenDate, String settingCloseDate) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update ExamTask set settingOpenDate= :settingOpenDate, settingCloseDate = :settingCloseDate where year = :year and examType = :examType");  
		query.setString("settingOpenDate", settingOpenDate);  
		query.setString("settingCloseDate", settingCloseDate); 
		query.setInteger("year", year);  
		query.setString("examType", examType);  
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateEvaluationDates(int year, String examType, String evaluationOpenDate, String evaluationCloseDate) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update ExamTask set evaluationOpenDate= :evaluationOpenDate, evaluationCloseDate = :evaluationCloseDate where year = :year and examType = :examType");  
		query.setString("evaluationOpenDate", evaluationOpenDate);  
		query.setString("evaluationCloseDate", evaluationCloseDate); 
		query.setInteger("year", year);  
		query.setString("examType", examType);  
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateResultDates(int year, String examType, String resultOpenDate) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update ExamTask set resultOpenDate = :resultOpenDate where year = :year and examType = :examType");  
		query.setString("resultOpenDate", resultOpenDate); 
		query.setInteger("year", year);  
		query.setString("examType", examType);  
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateExamTimeStamp(String YBSId, String examType, String examDate, String openTime, String closeTime) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Descriptive set examDate = :examDate, examOpenTime = :openTime, examCloseTime = :closeTime where YBSId = :YBSId and examType = :examType");  
		 
		query.setString("YBSId", YBSId);  
		query.setString("examType", examType);
		query.setString("examDate", examDate);
		query.setString("openTime", openTime);
		query.setString("closeTime", closeTime);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateQPaperPath(String YBSId, String examType, String teacherId, String QPaperPath) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Descriptive set QPaperPath = :QPaperPath, teacherId = :teacherId where YBSId = :YBSId and examType = :examType");
		query.setString("YBSId", YBSId);  
		query.setString("examType", examType);
		query.setString("teacherId", teacherId);
		query.setString("QPaperPath", QPaperPath);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}

	public static int updateAsgnPaperPath(String YBSId, String examType, String teacherId, String asgnPaperPath, String asgnOpenDate, String asgnCloseDate) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Descriptive set teacherId = :teacherId, asgnPaperPath = :asgnPaperPath, asgnOpenDate = :asgnOpenDate, asgnCloseDate = :asgnCloseDate where YBSId = :YBSId and examType = :examType");
		query.setString("YBSId", YBSId);  
		query.setString("examType", examType);
		query.setString("teacherId", teacherId);
		query.setString("asgnPaperPath", asgnPaperPath);
		query.setString("asgnOpenDate", asgnOpenDate);
		query.setString("asgnCloseDate", asgnCloseDate);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateEvaluatedMarks(String studentId, String YBSId, String examType, int total) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = null;
		if(examType.equals("mid1")) query = session.createQuery("update SAM set desc1Marks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("mid2")) query = session.createQuery("update SAM set desc2Marks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("asgn1")) query = session.createQuery("update SAM set asgn1Marks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("asgn2")) query = session.createQuery("update SAM set asgnMarks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("sem")) query = session.createQuery("update SAM set semMarks = :total where studentId = :studentId and YBSId = :YBSId");
		System.out.println("c" + examType);
		query.setInteger("total", total);
		query.setString("studentId", studentId);
		query.setString("YBSId", YBSId);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateNetMarks(String studentId, String YBSId, String examType, int total) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = null;
		if(examType.equals("mid1")) query = session.createQuery("update SAM set Mid1NetMarks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("mid2")) query = session.createQuery("update SAM set Mid2NetMarks = :total where studentId = :studentId and YBSId = :YBSId");
		else if(examType.equals("sem")) query = session.createQuery("update SAM set semNetMarks = :total where studentId = :studentId and YBSId = :YBSId");
		query.setInteger("total", total);
		query.setString("studentId", studentId);
		query.setString("YBSId", YBSId);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateSemester(int year, int semester) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("update AcadYear set semester = :semester where year = :year");
		query.setInteger("year", year);
		query.setInteger("semester", semester);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateLabMarks(String studentId, String YBSId, int marks, String labType) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = null;
		if(labType.equals("internal")) query = session.createQuery("update LabMarks set internalMarks = :marks where studentId = :studentId and YBSId = :YBSId");
		else query = session.createQuery("update LabMarks set externalMarks = :marks where studentId = :studentId and YBSId = :YBSId");
		query.setInteger("marks", marks);
		query.setString("studentId", studentId);
		query.setString("YBSId", YBSId);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateNetLabMarks(String studentId, String YBSId, int netMarks) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("update LabMarks set netMarks = :netMarks where studentId = :studentId and YBSId = :YBSId");
		query.setInteger("netMarks", netMarks);
		query.setString("studentId", studentId);
		query.setString("YBSId", YBSId);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}
	
	public static int updateQuiz(String YBSId, String examType, int questionNo, String question, String optionA, String optionB, String optionC, String optionD, String answerOption) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("update Quiz set questionNo = :questionNo,question = :question,optionA = :optionA,optionB = :optionB,optionC = :optionC,optionD = :optionD,answerOption = :answerOption where YBSId = :YBSId and examType = :examType and questionNo = :questionNo");
		query.setInteger("questionNo", questionNo);
		query.setString("examType", examType);
		query.setString("YBSId", YBSId);
		query.setString("question", question);
		query.setString("optionA", optionA);
		query.setString("optionB", optionB);
		query.setString("optionC", optionC);
		query.setString("optionD", optionD);
		query.setString("answerOption", answerOption);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}*/
	
	public static ExamTask getExamTask(int year, String examType) {
		String queryString="from ExamTask where year = :year and examType = :examType";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("examType", examType);
		return (ExamTask)query.uniqueResult();
	}
	
	public static List<Object> getExamTask(int year) {
		String queryString="from ExamTask where year = :year";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		return  query.list();
	}
	
	public static Subject getSubject(String YBSId) {
		String queryString="from Subject where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return (Subject)query.uniqueResult();
	}
	
	public static Object getUser(String user, String id)
	{
		String queryString = null;
		if(user.equals("student")) queryString="from Student where studentId = :id";
		else if(user.equals("teacher")) queryString="from Teacher where teacherId = :id";
		else if(user.equals("extTeacher")) queryString="from ExtTeacher where extTeacherId = :id";
		else queryString="from Controller where controllerId = :id";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("id", id);
		return query.uniqueResult();
	}
	
	public static Descriptive getDescriptiveByYBSIdAndExamType(String YBSId, String examType) {
		String queryString="from Descriptive where YBSId = :YBSId and examType = :examType";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("examType", examType);
		return (Descriptive)query.uniqueResult();
	}
	
	public static List<Object> getAllSubjects()
	{
		String queryString = "from Subject where subjectCategory = :theory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("theory", "Theory");
		return query.list();
	}
	
	public static List<Object> getSubjectObjectsByParams(String teacherId)
	{
		String queryString = "from Subject where teacherId = :teacherId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		return query.list();
	}
	
	public static List<Object> getSubjectObjectsByParams(String teacherId, String subjectCategory)
	{
		String queryString = "from Subject where teacherId = :teacherId and subjectCategory = :subjectCategory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		query.setString("subjectCategory", subjectCategory);
		return query.list();
	}
	
	public static List<Object> getSubjectObjectsByParams(int year, String branch, String subjectCategory)
	{
		String queryString = "from Subject where year = :year and branch = :branch and subjectCategory = :subjectCategory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		query.setString("subjectCategory", subjectCategory);
		return query.list();
	}
	
	public static List<Object> getSubjectObjectsByParams(int year, String branch)
	{
		String queryString = "from Subject where year = :year and branch = :branch";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		return query.list();
	}
	
	public static List<Object> getStudents(int year, String branch)
	{
		String queryString = "from Student where currentyear = :year and branch = :branch";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		return query.list();
	}
	
	public static List<Object> getAllYBSScripts(String YBSId)
	{
		String queryString = "from SAM where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	
	public static List<Object> getStudentSAMs(String studentId)
	{
		String queryString = "from SAM where studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("studentId", studentId);
		return query.list();
	}
	
	public static Quiz getQuiz(String YBSId, String examType, int questionNo) {
		String queryString="from Quiz where YBSId = :YBSId and examType = :examType and questionNo = :questionNo";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("examType", examType);
		query.setInteger("questionNo", questionNo);
		return (Quiz)query.uniqueResult();
	}
	
	public static List<Object> getLabMarks(String YBSId)
	{
		String queryString = "from LabMarks where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	
	public static List<Object> getStudentLabs(String studentId)
	{
		String queryString = "from LabMarks where studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("studentId", studentId);
		return query.list();
	}
	
	public static LabMarks getLabMarks(String studentId, String YBSId) {
		String queryString="from LabMarks where YBSId = :YBSId and studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("studentId", studentId);
		return (LabMarks)query.uniqueResult();
	}
	
	public static SAM getSam(String studentId, String YBSId) {
		String queryString="from SAM where YBSId = :YBSId and studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("studentId", studentId);
		return (SAM)query.uniqueResult();
	}
	
	public static AcadYear getSemester(int year) {
		String queryString="from AcadYear where year = :year";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		return (AcadYear)query.uniqueResult();
	}
	
	public static List<Object> getExtTeacherWithYBSId(String YBSId)
	{
		String queryString = "from ExtTeacher where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	
	public static List<Object> getExtTeacherWithSubjectCode(String subjectCode)
	{
		String queryString = "from ExtTeacher where subjectCode = :subjectCode";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("subjectCode", subjectCode);
		return query.list();
	}
	
	public static List<Object> getAllObjects(String tableName)
	{
		String queryString = null;
		if(tableName.equals("Descriptive")) queryString = "from Descriptive";
		else if(tableName.equals("ExamTask")) queryString = "from ExamTask";
		else if(tableName.equals("ExtTeacher")) queryString = "from ExtTeacher";
		else if(tableName.equals("Subject")) queryString = "from Subject";
		else if(tableName.equals("SAM")) queryString = "from SAM";
		else if(tableName.equals("LabMarks")) queryString = "from LabMarks";
		else if(tableName.equals("Quiz")) queryString = "from Quiz";
		Query query = sessionFactory.openSession().createQuery(queryString);
		return query.list();
	}
	
	public static int deleteObjectByQuery(String query)
	{
		Session session = sessionFactory.openSession();
		Transaction tx =  session.beginTransaction();
		Query query1 = session.createQuery(query);
		
		int result = query1.executeUpdate();
		tx.commit();
		return result;		
	}
	
	public static List<Object> getObjectListByQuery(String query)
	{
		return sessionFactory.openSession().createQuery(query).list();
	}

	public static Object getObjectByQuery(String query)
	{
		Session session = sessionFactory.openSession();
		Transaction tx =  session.beginTransaction();
		Query query1 = session.createQuery(query);
		
		Object result = query1.executeUpdate();
		tx.commit();
		return result;		
	}

	
}
	

