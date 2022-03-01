package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignUpDAO {

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
	
	
	public int join(String id, String name, String pw, String addr, String carNum, String phone, String gNum) {
		int cnt =0;
		
		try {
			
		conn();
		// 회원가입 하는 사람들은 마지막 ADMIN_YN 컬럼 무조건 'N' 관리자는 DB에서 따로 Y로 설정
		String sql = "insert into T_USER values(?, ?, ?, ?, ?, ?, ?, sysdate, 'N')";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, name);
		psmt.setString(4, phone);
		psmt.setString(5, carNum);
		psmt.setString(6, addr);
		psmt.setString(7, gNum);
		
		cnt = psmt.executeUpdate();

		} catch (Exception e) {
	
			e.printStackTrace();
		}finally {
			
			close();

		}
		
		return cnt;
	}
	
	
}
