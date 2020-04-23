package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapBookDao {
	Logger logger = Logger.getLogger(SqlMapBookDao.class);
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	/**********************************************
	 * 도서정보 조회하기 구현 
	 * @param pMap - 사용자가 자동완선 textbox에 입력한 도서 제목 정보
	 * @return - 사용자가 입력한 도서정보를 선분조건(Like패턴)으로 검색하여 결과 반환
	 */
	public List<Map<String, Object>> bookList(Map<String,Object> pMap){
		logger.info("book_title:"+pMap.get("book_title")+" , choMode: "+pMap.get("choMode") );
		//선언만 되있다 . 따라서 검색 결과가 존재하지 않을 경우 NullPointerException의 원인이 될 수도 있다.
		//가급적이면 에러를 피해 갈 수 있다록 코딩을 전개한다.
		List<Map<String, Object>> bList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			bList = sqlSes.selectList("bookList",pMap);
			logger.info("bList.size() ====>"+bList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
}
