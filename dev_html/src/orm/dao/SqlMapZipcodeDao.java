package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapZipcodeDao {
	Logger logger = Logger.getLogger(SqlMapZipcodeDao.class);
	String resource = "orm/mybatis/Configuration.xml";
	public List<Map<String, Object>> zdoList(){
		List<Map<String, Object>> zList = null;
		SqlSessionFactory sqlMapper = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			zList = sqlSes.selectList("zdoList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zList;
	}
	public List<Map<String, Object>> siguList(Map<String,Object> pmap){
		List<Map<String, Object>> sList = null;
		SqlSessionFactory sqlMapper = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			sList = sqlSes.selectList("siguList",pmap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sList;
	}
	public List<Map<String, Object>> dongList(Map<String,Object> pmap){
		List<Map<String, Object>> dList = null;
		SqlSessionFactory sqlMapper = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dList = sqlSes.selectList("dongList",pmap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}
	/******************************************************
	 * 주소 검색 -우편번호 조회하기
	 * @param pmap pmap.get("dong")
	 * @return List<Map<String,Object>>
	 * 업무설명 : 동이름을 입력하면 조건검색을 통하여 구간검색 처리하기
	 * 작성자 : 000
	 * 2020년 04월 27일
	 ********************************************************/
	public List<Map<String, Object>> zipcodeList(Map<String,Object> pmap){
		List<Map<String, Object>> zipList = null;
		SqlSessionFactory sqlMapper = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			zipList = sqlSes.selectList("zipcodeList",pmap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zipList;
	}
	
}
