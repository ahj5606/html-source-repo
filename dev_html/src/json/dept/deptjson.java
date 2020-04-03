package json.dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.google.gson.Gson;
import com.util.DBConnectionMgr;

public class deptjson {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public List<Map<String,Object>> deptList(){
		List<Map<String,Object>> dlist = new ArrayList();
		Map<String,Object> rMap = null;
		StringBuilder sql = new StringBuilder("");
		con=dbMgr.getConnection();
		sql.append("select deptno,dname,loc from dept");
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			//parsing-DBMS 실행계획-옵티마이저 -Open..Fetch..Close
			//세개 컬럼은 Map에 담고 여러개의 로우는 List담기
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("deptno", rs.getInt("deptno"));
				rMap.put("dname",rs.getString("dname"));
				rMap.put("loc",rs.getString("loc"));
				dlist.add(rMap);
			}
		} catch(SQLException se) {
			System.out.println("[[SQLException]]"+sql.toString());
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return dlist;
	}
	public List<deptVO> deptVOList(){
		List<deptVO> dlist = new ArrayList();
		deptVO dvo = null;
		StringBuilder sql = new StringBuilder("");
		con=dbMgr.getConnection();
		sql.append("select deptno,dname,loc from dept");
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dvo = new deptVO();
				dvo.setDeptno(rs.getInt("deptno"));
				dvo.setDname(rs.getString("dname"));
				dvo.setLoc(rs.getString("loc"));
				dlist.add(dvo);
			}
		} catch(SQLException se) {
			System.out.println("[[SQLException]]"+sql.toString());
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return dlist;
	}
	public static void main(String[] args) {
		deptjson ej = new deptjson();
		List<Map<String, Object>> v = ej.deptList(); 
		Gson g = new Gson();
		String temp = g.toJson(v);
		System.out.println(temp);
	}
}
