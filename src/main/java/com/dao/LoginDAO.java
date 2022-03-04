package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.UserVO;

public class LoginDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	
	
	
	public void conn() {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	         String dbid = "campus_d_1_0216";
	         String dbpw = "smhrd1";
	         
	         conn = DriverManager.getConnection(url, dbid, dbpw);
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	
	
	public void close() {
		try {
			if(rs!=null) {
			rs.close();
			}
			
			if(psmt!=null) {
			psmt.close();
			}
			
			if(conn!=null) {
			conn.close();	
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	
	
	
	public UserVO Login(String id, String pw) {

		UserVO vo =null;
		
		try {
			
			conn(); // DB 접속
			
			if(conn!=null) {
				System.out.println("연결성공");
			}
			else {
				System.out.println("연결실패");
			}

		String sql = "select * from t_user where user_id=? and user_pw=? ";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);
		
		rs = psmt.executeQuery();
		

		if(rs.next()) {
			
			String getid = rs.getString(1);
			String getPw = rs.getString(2);
			
			System.out.println("이메일: " + getid);
			System.out.println("비밀번호: " + getPw);


			vo = new UserVO(getid, getPw);
		}


		} catch (Exception e) {

			e.printStackTrace();
		}finally {
			
			close();

		}
	return vo;
}
	
	
	
}
