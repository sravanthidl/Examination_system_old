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
import com.dto.ScriptsAndMarks;
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
	
	public static int updateStudentsAcadYear(int year) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		int nextYear = year + 1;
		Query query = session.createQuery("update Student set currentYear= :nextYear, currentSem = 1 where currentYear = :year"); 
		query.setInteger("nextYear", nextYear);
		query.setInteger("year", year);  
		int status = query.executeUpdate();   
		tx.commit();
		return status;
	}
	public static int updateStudentsSemester(int year) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("update Student set currentSem = 2 where currentYear = :year"); 
		query.setInteger("year", year);  
		int status = query.executeUpdate();   
		tx.commit();
		return status;
	}
	
	public static Object getUser(String user, String id){
		String queryString = null;
		if(user.equals("student")) queryString="from Student where studentId = :id";
		else if(user.equals("teacher")) queryString="from Teacher where teacherId = :id";
		else if(user.equals("extTeacher")) queryString="from ExtTeacher where extTeacherId = :id";
		else queryString="from Controller where controllerId = :id";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("id", id);
		return query.uniqueResult();
	}
	public static List<Object> getAllObjects(String tableName){
		String queryString = null;
		if(tableName.equals("Descriptive")) queryString = "from Descriptive";
		else if(tableName.equals("ExamTask")) queryString = "from ExamTask";
		else if(tableName.equals("ExtTeacher")) queryString = "from ExtTeacher";
		else if(tableName.equals("Subject")) queryString = "from Subject";
		else if(tableName.equals("SAM")) queryString = "from ScriptsAndMarks";
		else if(tableName.equals("LabMarks")) queryString = "from LabMarks";
		else if(tableName.equals("Quiz")) queryString = "from Quiz";
		Query query = sessionFactory.openSession().createQuery(queryString);
		return query.list();
	}
	public static AcadYear getAcadYear(int year){
		String queryString="from AcadYear where year = :year";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		return (AcadYear)query.uniqueResult();
	}
	public static Descriptive getDescriptive(String YBSId, String examType) {
		String queryString="from Descriptive where YBSId = :YBSId and examType = :examType";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("examType", examType);
		return (Descriptive)query.uniqueResult();
	}
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
	public static List<Object> getExtTeacherWithYBSId(String YBSId){
		String queryString = "from ExtTeacher where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	public static List<Object> getExtTeacherWithSubjectCode(String subjectCode){
		String queryString = "from ExtTeacher where subjectCode = :subjectCode";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("subjectCode", subjectCode);
		return query.list();
	}
	public static List<Object> getLabMarks(String YBSId){
		String queryString = "from LabMarks where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	public static LabMarks getLabMarks(String studentId, String YBSId) {
		String queryString="from LabMarks where YBSId = :YBSId and studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("studentId", studentId);
		return (LabMarks)query.uniqueResult();
	}
	public static List<Object> getStudentLabs(String studentId){
		String queryString = "from LabMarks where studentId = :studentId";
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
	public static List<Object> getStudents(int year, String branch){
		String queryString = "from Student where currentyear = :year and branch = :branch";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		return query.list();
	}

	public static Subject getSubject(String YBSId) {
		String queryString="from Subject where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return (Subject)query.uniqueResult();
	}

	public static List<Object> getAllSubjects(){
		String queryString = "from Subject where subjectCategory = :theory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("theory", "Theory");
		return query.list();
	}
	
	public static List<Object> getSubjects(String teacherId){
		String queryString = "from Subject where teacherId = :teacherId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		return query.list();
	}
	
	public static List<Object> getSubjects(String teacherId, String subjectCategory){
		String queryString = "from Subject where teacherId = :teacherId and subjectCategory = :subjectCategory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		query.setString("subjectCategory", subjectCategory);
		return query.list();
	}
	public static List<Object> getSubjects(int year, String branch, String subjectCategory){
		String queryString = "from Subject where year = :year and branch = :branch and subjectCategory = :subjectCategory";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		query.setString("subjectCategory", subjectCategory);
		return query.list();
	}
	public static List<Object> getSubjects(int year, String branch){
		String queryString = "from Subject where year = :year and branch = :branch";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
		return query.list();
	}
	public static List<Object> getAllYBSScripts(String YBSId){
		System.out.println("INHERE");
		String queryString = "from ScriptsAndMarks where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return query.list();
	}
	
	public static List<Object> getStudentSAMs(String studentId){
		String queryString = "from ScriptsAndMarks where studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("studentId", studentId);
		return query.list();
	}	
	public static ScriptsAndMarks getSam(String studentId, String YBSId) {
		String queryString="from ScriptsAndMarks where YBSId = :YBSId and studentId = :studentId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("studentId", studentId);
		return (ScriptsAndMarks)query.uniqueResult();
	}
	
	public static int deleteStudents(int year){
		Session session = sessionFactory.openSession();
		Transaction tx =  session.beginTransaction();
		String queryString="delete from Student where year = :year";
		Query query = session.createQuery(queryString);	
		query.setInteger("year", year);
		int result = query.executeUpdate();
		tx.commit();
		return result;		
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
	

