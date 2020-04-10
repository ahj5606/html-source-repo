package restaurant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class login {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
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
		}
		return msg;
	}
	public static void main(String[] args) {
		login lg = new login();
		lg.login("test", "12");
	}
}
