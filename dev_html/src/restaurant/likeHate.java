package restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConnectionMgr;

public class likeHate {
	DBConnectionMgr dbMgr =DBConnectionMgr.getInstance();
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	public int likeup(String res_name) {
		int result =0;
		con=dbMgr.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE RESTAURANT SET RES_LIKE=RES_LIKE+1 WHERE RES_NAME=?");
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, res_name);
			int imsi=0;
			imsi=pstmt.executeUpdate();
			if(imsi==1) {
				pstmt = null;
				String sql2="SELECT RES_LIKE FROM RESTAURANT WHERE RES_NAME=?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, res_name);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("RES_LIKE");
				}
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	public int hateup(String res_name) {
		int result =0;
		con=dbMgr.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE RESTAURANT SET RES_HATE=RES_HATE+1 WHERE RES_NAME=?");
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, res_name);
			int imsi=0;
			imsi=pstmt.executeUpdate();
			if(imsi==1) {
				pstmt = null;
				String sql2="SELECT RES_HATE FROM RESTAURANT WHERE RES_NAME=?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, res_name);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("RES_HATE");
				}
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return result;
	}
}
