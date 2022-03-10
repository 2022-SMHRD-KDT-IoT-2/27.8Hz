package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.UserVO;

public class AdminDAO {
	
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
	
	
	

	//회원 목록 불러오기 
public ArrayList<UserVO> getUser_List() {
		
		
		ArrayList<UserVO> al = new ArrayList<UserVO>();
		
		try {
			conn();
				
			
			String sql = "select * from T_USER order by user_id desc";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()){

				String user_id = rs.getString(1);
				String user_pw = rs.getString(2);
				String user_name = rs.getString(3);
				String user_phone = rs.getString(4);
				String user_carnum = rs.getString(5);
				String user_addr = rs.getString(6);
				String user_gphone = rs.getString(7);
				String user_date =  rs.getString(8);
				
				
				
				
				UserVO vo = new UserVO(user_id, user_pw, user_name, user_phone, user_addr,user_carnum, user_gphone, user_date);
				al.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return al;
	}



}
