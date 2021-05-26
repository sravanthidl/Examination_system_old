package com.db;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.dto.Controller;
import com.dto.Descriptive;
import com.dto.ExamTask;
import com.dto.Subject;
import com.dto.Teacher;

public class HibernateTemplate {

	private static SessionFactory sessionFactory;
	
	static
	{
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
	
	public static int updateControllerPassword(String controllerId, String password) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Controller set password= :password where controllerId= :controllerId");  
		query.setString("controllerId", controllerId);  
		query.setString("password", password);  
		int status = query.executeUpdate();   
		tx.commit();
		return status;
	}
	
	public static int updateTeacherPassword(String teacherId, String password) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Teacher set password= :password where teacherId= :teacherId");  
		query.setString("teacherId", teacherId);  
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
	
	public static int updateQPaperPath(String YBSId, String examType, String QPaperPath) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Descriptive set QPaperPath = :QPaperPath where YBSId = :YBSId and examType = :examType");
		query.setString("YBSId", YBSId);  
		query.setString("examType", examType);
		query.setString("QPaperPath", QPaperPath);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
	}

	public static int updateAsgnPaperPath(String YBSId, String examType, String asgnPaperPath, String asgnOpenDate, String asgnCloseDate) {
		Session session=sessionFactory.openSession();
		Transaction tx = session.beginTransaction();  
		Query query = session.createQuery("update Descriptive set asgnPaperPath = :asgnPaperPath, asgnOpenDate = :asgnOpenDate, asgnCloseDate = :asgnCloseDate where YBSId = :YBSId and examType = :examType");
		query.setString("YBSId", YBSId);  
		query.setString("examType", examType);
		query.setString("asgnPaperPath", asgnPaperPath);
		query.setString("asgnOpenDate", asgnOpenDate);
		query.setString("asgnCloseDate", asgnCloseDate);
		int status = query.executeUpdate();   
		tx.commit();
		System.out.println(status); 
		return status;
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
	
	public static ExamTask getExamTask(int year, String examType) {
		String queryString="from ExamTask where year = :year and examType = :examType";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("examType", examType);
		return (ExamTask)query.uniqueResult();
	}
	
	public static Subject getSubject(String YBSId) {
		String queryString="from Subject where YBSId = :YBSId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		return (Subject)query.uniqueResult();
	}

	public static List<Object> getObjectListByQuery(String query)
	{
		return sessionFactory.openSession().createQuery(query).list();
	}
	
	public static Teacher getTeacherById(String teacherId)
	{
		String queryString="from Teacher where teacherId = :teacherId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		return (Teacher)query.uniqueResult();
	}
	
	public static Controller getControllerById(String controllerId) {
		String queryString="from Controller where controllerId = :controllerId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("controllerId", controllerId);
		return (Controller)query.uniqueResult();
	}
	
	public static Descriptive getDescriptiveByYBSIdAndExamType(String YBSId, String examType) {
		String queryString="from Descriptive where YBSId = :YBSId and examType = :examType";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("YBSId", YBSId);
		query.setString("examType", examType);
		return (Descriptive)query.uniqueResult();
	}
	
	public static List<Object> getObjectListByConstraints(String teacherId)
	{
		String queryString = "from Subject where teacherId = :teacherId";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setString("teacherId", teacherId);
		return query.list();
	}
	
	public static List<Object> getObjectListByConstraints(int year, String branch)
	{
		String queryString = "from Subject where year = :year and branch = :branch";
		Query query = sessionFactory.openSession().createQuery(queryString);
		query.setInteger("year", year);
		query.setString("branch", branch);
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
	

