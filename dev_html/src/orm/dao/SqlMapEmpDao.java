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
	public List<Map<String, Object>> empList(Map<String,Object> pMap){
		logger.info("empList 호출 성공"); //2
//		logger.debug("debug"); //1
//		logger.warn("warn");
//		logger.error("error");
//		logger.fatal("fatal");
		
		List<Map<String, Object>> eList = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기 
			SqlSession sqlSes = sqlMapper.openSession();
			
			eList = sqlSes.selectList("empList",pMap);
			System.out.println("조회한 로우 수:" +eList.size());
		} catch (Exception e) {
			e.printStackTrace();
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
