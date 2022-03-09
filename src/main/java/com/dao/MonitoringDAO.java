package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import com.model.MonitoringVO;

public class MonitoringDAO {

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
	
	public ArrayList<MonitoringVO> selectMonitoring(String driver_id) {
		ArrayList<MonitoringVO> selectMonitoring = new ArrayList<>();

		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now();
		
		//현재 날짜 문자열로 변환
		String date = now.toString();
		
		try {
			connect();
			String sql = "select * from t_monitoring where driver_id = ? and reg_date <= ? order by reg_date";
			pst = conn.prepareStatement(sql);
			pst.setString(1, driver_id);
			pst.setString(2, date);

			rs = pst.executeQuery();

			while (rs.next()) {
				int monitoring_seq = rs.getInt("MONITORING_SEQ");
				int heartrate = rs.getInt("HEART_RATE");
				int o2 = rs.getInt("O2_SATURATION");
				double temp = rs.getDouble("TEMPERATURE");
				String regdate = rs.getString("REG_DATE");
				
				MonitoringVO mvo = new MonitoringVO(driver_id, monitoring_seq, heartrate, o2, temp, regdate);
				selectMonitoring.add(mvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return selectMonitoring;
	}

	public int insertMo(String hr, String o2, String temp) {
		int cnt = 0;
		double HR = Double.parseDouble(hr);
		int O2 = Integer.parseInt(o2);
		double TEMP = Double.parseDouble(temp);
		
		try {
		connect();
		String sql = "insert into T_MONITORING values(T_MONITORING_SEQ.nextval, wish@naver.com, ?, ?, ?, sysdate)";
		
		pst = conn.prepareStatement(sql);
		pst.setDouble(1, HR);
		pst.setInt(2, O2);
		pst.setDouble(3, TEMP);
		
		cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int updateMo(String hr, String o2, String temp) {
		int cnt = 0;
		double HR = Double.parseDouble(hr);
		int O2 = Integer.parseInt(o2);
		double TEMP = Double.parseDouble(temp);

		try {
			connect();
			String sql = "update T_MONITORING set HEART_RATE = ?, O2_SATURATION = ?, TEMPERATURE =? where DRIVER_ID = wish@naver.com";
			pst = conn.prepareStatement(sql);
			pst.setDouble(1, HR);
			pst.setInt(2, O2);
			pst.setDouble(3, TEMP);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public boolean selectMo () {
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now();
				
		//현재 날짜 문자열로 변환
		String date = now.toString();
		boolean tf = false;
		
		try {
			connect();
			String sql = "SELECT * FROM T_MONITORING WHERE TO_CHAR(REG_DATE,'yyyy-mm-dd') = ? AND DRIVER_ID = wish@naver.com";
			pst = conn.prepareStatement(sql);
			pst.setString(1, date);

			rs = pst.executeQuery();
			if (rs.next()) {
				tf = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return tf;

	}
}
