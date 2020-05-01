package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapEmpDao {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class);
	SqlSessionFactory sqlMapper =null;
	String resource = "orm/mybatis/Configuration.xml";
	public int empINS(Map<String, Object> pMap) {
		int result =0;
		logger.info("empINS호출 성공.");
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			result=sqlSes.insert("empInsert",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlMapper!=null) { sqlMapper =null;}
		}
		return result;
	}
	public int empDEL(String empnos[]) {
		int result =0;
		logger.info("empDEL호출 성공.");
		try {
			List<Integer> eList = new ArrayList<>();
			for(int i=0;i<empnos.length;i++) {
				eList.add(Integer.parseInt(empnos[i]));
			}
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			result=sqlSes.delete("empDelete2",eList);
			sqlSes.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlMapper!=null) { sqlMapper =null;}
		}
		return result;
	}
	public int empUPD(Map<String, Object> pMap) {
		int result =0;
		logger.info("empUPD호출 성공.");
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			result=sqlSes.update("empUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlMapper!=null) { sqlMapper =null;}
		}
		return result;
	}
	public List<Map<String, Object>> empList(Map<String,Object> pMap){
		logger.info("empList 호출 성공"); //2
//		logger.debug("debug"); //1
//		logger.warn("warn");
//		logger.error("error");
//		logger.fatal("fatal");
		
		List<Map<String, Object>> eList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기 
			SqlSession sqlSes = sqlMapper.openSession();
			
			eList = sqlSes.selectList("empList",pMap);
			System.out.println("조회한 로우 수:" +eList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlMapper!=null) { sqlMapper =null;}
			
		}
		
		return eList;
	}
	
	public static void main(String[] args) {
		SqlMapEmpDao smed = new SqlMapEmpDao();
		List<Map<String, Object>> eList =null;
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("empno", 7369);
		smed.empList(pMap);
	}
}
