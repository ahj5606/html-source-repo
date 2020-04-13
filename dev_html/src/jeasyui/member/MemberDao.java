package jeasyui.member;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleStatement;
import oracle.jdbc.internal.OracleTypes;
import oracle.jdbc.oracore.OracleType;
/*
 * DML(기본) - 프로시저 - MyBatis[ORM솔루션 -30%이상 줄어듬]
 * 
 */
public class MemberDao {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	CallableStatement cstmt = null;
	OracleCallableStatement ocstmt = null;
	//회원목록 조회 실습1 - SELECT문
	public List<Map<String,Object>> memberList(){
		List<Map<String,Object>> mList =new ArrayList<Map<String,Object>>();
		StringBuilder sql = new StringBuilder();
		con = dbMgr.getConnection();
		sql.append("SELECT mem_no,mem_id,mem_pw,mem_name,zipcode,mem_addr,mem_email FROM test_member");
		Map<String,Object> rMap = null;
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("mem_no", rs.getInt("mem_no"));
				rMap.put("mem_id", rs.getString("mem_id"));
				rMap.put("mem_pw", rs.getString("mem_pw"));
				rMap.put("mem_name", rs.getString("mem_name"));
				rMap.put("zipcode", rs.getString("zipcode"));
				rMap.put("mem_addr", rs.getString("mem_addr"));
				rMap.put("mem_email", rs.getString("mem_email"));
				mList.add(rMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return mList;
	}
	//회원목록 조회 실습2 - 프로시저
	public List<Map<String,Object>> proc_memberList(){
		/*
		 	Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			CallableStatement cstmt = null;
			OracleCallableStatement ocstmt = null;
		 */
		List<Map<String,Object>> mList =new ArrayList<Map<String,Object>>();
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_memberList(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			//오라클에서만 제공되는 REFCURSOR이므로 오라클에서 제공하는 인터페이스로 형전환하기
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			Map<String,Object> rMap = null;
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("mem_no", rs.getInt("mem_no"));
				rMap.put("mem_id", rs.getString("mem_id"));
				rMap.put("mem_pw", rs.getString("mem_pw"));
				rMap.put("mem_name", rs.getString("mem_name"));
				rMap.put("zipcode", rs.getString("zipcode"));
				rMap.put("mem_addr", rs.getString("mem_addr"));
				rMap.put("mem_email", rs.getString("mem_email"));
				mList.add(rMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mList;
	}
	
	public static void main(String[] args) {
		MemberDao mdao = new MemberDao();
		List<Map<String,Object>> mList = null;
		mList = mdao.memberList();
		if(mList!=null) {
			System.out.println("mList.size====> "+mList.size());
		}
		System.out.println("================ ");
		mList = null;
		mList = mdao.proc_memberList();
		if(mList!=null) {
			System.out.println("mList.size====> "+mList.size());
		}
	}
}
