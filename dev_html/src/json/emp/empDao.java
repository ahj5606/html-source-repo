package json.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class empDao {
	DBConnectionMgr dbMgr =DBConnectionMgr.getInstance();
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public List<Map<String,Object>> empList(){
		List<Map<String,Object>> eList = new ArrayList<Map<String,Object>>();
		StringBuilder sql = new StringBuilder();
		sql.append("select empno,ename,job,mgr,hiredate,sal,comm,deptno from emp");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> pMap = null;
			while(rs.next()) {
				pMap = new HashMap<String, Object>();
				pMap.put("empno", rs.getString("empno"));
				pMap.put("ename", rs.getString("ename"));
				pMap.put("job", rs.getString("job"));
				pMap.put("mgr", rs.getString("mgr"));
				pMap.put("hiredate", rs.getString("hiredate"));
				pMap.put("sal", rs.getString("sal"));
				pMap.put("comm", rs.getString("comm"));
				pMap.put("deptno", rs.getString("deptno"));
				eList.add(pMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		
		return eList;
	}
}
