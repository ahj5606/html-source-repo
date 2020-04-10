package restaurant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class RestaurantDao {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null;
	ResultSet rs =null;
	
	public String login(String u_id , String u_pw) {
		String msg =null;
		con = dbMgr.getConnection();
		try {
			cstmt = con.prepareCall("{call proc_login2020(?,?,?)}");
			cstmt.setString(1, u_id);
			cstmt.setString(2, u_pw);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
			cstmt.execute();
			msg=cstmt.getString(3);
			System.out.println("결과: "+msg);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, cstmt);
		}
		return msg;
	}

	
	
	
	public int restINS(Map<String,Object> pMap) {
		int result =0;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO restaurant(res_num,res_name,res_tel,res_addr ");
        sql.append("    ,res_hate,res_like,res_photo                         ");
        sql.append("    ,res_info,res_time,lat,lng)                          ");
        sql.append("    values(seq_restaurant_num.nextval,?,?,?,0,0,?,?,?,?,?) ");
		
		
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			result = pstmt.executeUpdate();
			System.out.println("result : "+result);
		}catch(SQLException se) {
			System.out.println("[[query]] :"+sql.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt);
		}
		return result;
	}
	
	public List<Map<String,Object>> restList(){
		List<Map<String,Object>> rList = new ArrayList<Map<String, Object>>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT res_num,res_name,res_tel,res_addr,res_hate");
		sql.append("  ,res_like,res_photo,res_info,res_time,lat,lng");
		sql.append(" FROM restaurant");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> rmap = null;
			while(rs.next()) {
				rmap = new HashMap<String, Object>();
				rmap.put("res_num", rs.getInt("res_num"));
				rmap.put("res_name", rs.getString("res_name"));
				rmap.put("res_tel", rs.getString("res_tel"));
				rmap.put("res_addr", rs.getString("res_addr"));
				rmap.put("res_hate", rs.getInt("res_hate"));
				rmap.put("res_like", rs.getInt("res_like"));
				rmap.put("res_photo", rs.getString("res_photo"));
				rmap.put("res_info", rs.getString("res_info"));
				rmap.put("res_time", rs.getString("res_time"));
				rmap.put("lat", rs.getDouble("lat"));
				rmap.put("lng", rs.getDouble("lng"));
				rList.add(rmap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return rList;
		
	}
	public List<Map<String,Object>> proc_restList(){
		List<Map<String,Object>> rList = new ArrayList<Map<String, Object>>();
		CallableStatement cstmt = null;
		OracleCallableStatement ocstmt = null;
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_restaurant(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			Map<String,Object> rmap = null;
			while(rs.next()) {
				rmap = new HashMap<String, Object>();
				rmap.put("res_num", rs.getInt("res_num"));
				rmap.put("res_name", rs.getString("res_name"));
				rmap.put("res_tel", rs.getString("res_tel"));
				rmap.put("res_addr", rs.getString("res_addr"));
				rmap.put("res_hate", rs.getInt("res_hate"));
				rmap.put("res_like", rs.getInt("res_like"));
				rmap.put("res_photo", rs.getString("res_photo"));
				rmap.put("res_info", rs.getString("res_info"));
				rmap.put("res_time", rs.getString("res_time"));
				rmap.put("lat", rs.getDouble("lat"));
				rmap.put("lng", rs.getDouble("lng"));
				rList.add(rmap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, cstmt, rs);
		}
		
		return rList;
		
	}
	public List<Map<String,Object>> mapRestList(){
		List<Map<String,Object>> rList = new ArrayList<Map<String, Object>>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT res_name,res_photo,lat,lng");
		sql.append(" FROM restaurant");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> rmap = null;
			while(rs.next()) {
				rmap = new HashMap<String, Object>();
				rmap.put("res_name", rs.getString("res_name"));
				rmap.put("res_photo", rs.getString("res_photo"));
				rmap.put("lat", rs.getDouble("lat"));
				rmap.put("lng", rs.getDouble("lng"));
				rList.add(rmap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return rList;
	}
	public List<Map<String,Object>> proc_mapRestList(){
		List<Map<String,Object>> rList = new ArrayList<Map<String, Object>>();
		CallableStatement cstmt = null;
		OracleCallableStatement ocstmt = null;
		try {
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_restaurantMap(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			Map<String,Object> rmap = null;
			while(rs.next()) {
				rmap = new HashMap<String, Object>();
				rmap.put("res_name", rs.getString("res_name"));
				rmap.put("res_photo", rs.getString("res_photo"));
				rmap.put("lat", rs.getDouble("lat"));
				rmap.put("lng", rs.getDouble("lng"));
				rList.add(rmap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, cstmt, rs);
		}
		return rList;
	}
	
	public static void main(String[] args) {
		RestaurantDao rdao = new RestaurantDao();
		List<Map<String,Object>> rList = rdao.proc_restList();
		if(rList!=null) {
			System.out.println(rList);
		}
		rList = null;
		rList = rdao.proc_mapRestList();
		if(rList!=null) {
			System.out.println(rList.size());
		}
	}
	
}
