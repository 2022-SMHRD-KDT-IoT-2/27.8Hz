package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.UserVO;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null ;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_d_1_0216";
			String password = "smhrd1";

			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end of connect

	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pst!=null) {
				pst.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // end of close
	
	public UserVO getOneList(String userID) {
		UserVO uvo = null;

		try {
			connect();
			String sql = "select * from t_user where user_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, userID);

			rs = pst.executeQuery();

			while (rs.next()) {
				String user_id = rs.getString("USER_ID");
				String user_pw = rs.getString("USER_PW");
				String user_name = rs.getString("USER_NAME");
				String user_phone = rs.getString("USER_PHONE");
				String user_carnum = rs.getString("USER_CARNUM");
				String user_addr = rs.getString("USER_ADDR");
				String guardian_phone = rs.getString("GUARDIAN_PHONE");
				String user_joindate = rs.getString("USER_JOINDATE");
				String admin_yn = rs.getString("ADMIN_YN");

				uvo = new UserVO(user_id, user_pw, user_name, user_phone, user_carnum, user_addr, guardian_phone, user_joindate, admin_yn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return uvo;
	}
	
	public int updateInfo(String user_id,String user_name,String user_pw,String user_addr,String user_carnum,String user_phone, String guardian_phone) {
		int cnt = 0;
		try {
			connect();
			
			String sql = "update t_user"
					+ " set user_pw = ?, user_name = ?, user_phone = ?, user_carnum = ?, user_addr = ?, guardian_phone = ?"
					+ " where user_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, user_pw);
			pst.setString(2, user_name);
			pst.setString(3, user_phone);
			pst.setString(4, user_carnum);
			pst.setString(5, user_addr);
			pst.setString(6, guardian_phone);
			pst.setString(7, user_id);
			
			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}// end of updateInfo
	
}// end of class
