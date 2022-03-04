package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GpsDAO {
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
	
	
	public GpsVO insertVal(double lat, double lon) {
		int cnt = 0;
		GpsVO vo = null;
		
		try {			
			conn();
			//위도경도값 t_gps테이블에 저장
			String sql = "insert into t_gps values(?, ?, sysdate)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, lat);
			psmt.setDouble(2, lon);
			
			cnt = psmt.executeUpdate();
			
			if(cnt > 0) {
				vo = new GpsVO(lat, lon);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}// end of insertVal
	
	public GpsVO selectVal() {
		GpsVO vo = null;
		
		try {			
			conn();
			//위도경도값 t_gps테이블에 저장
			String sql = "select lat, lon from t_gps order by m_time desc";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Double lat = rs.getDouble(1);
				Double lon = rs.getDouble(2);
				
				vo = new GpsVO(lat, lon);
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}// end of selectVal
	
	
	
	
} // end of class