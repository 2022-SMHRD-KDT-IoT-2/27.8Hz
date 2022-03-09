package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.CenterVO;
import com.model.CenterCommentVO;

public class CenterDAO {

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

	public ArrayList<CenterVO> getList() {

		ArrayList<CenterVO> centerList = new ArrayList<>();

		try {
			connect();
			String sql = "select * from t_center order by q_seq desc";
			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				int q_seq = rs.getInt("Q_SEQ");
				String q_title = rs.getString("Q_TITLE");
				String q_content = rs.getString("Q_CONTENT");
				String q_file = rs.getString("Q_FILE");
				String q_date = rs.getString("Q_DATE");
				String user_id = rs.getString("USER_ID");

				CenterVO cvo = new CenterVO(q_seq, q_title, q_content, q_file, q_date, user_id);
				centerList.add(cvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return centerList;
	}

	public CenterVO getOneList(int num) {
		CenterVO cvo = null;

		try {
			connect();
			String sql = "select * from t_center where q_seq = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);

			rs = pst.executeQuery();

			while (rs.next()) {
				int q_seq = rs.getInt("Q_SEQ");
				String q_title = rs.getString("Q_TITLE");
				String q_content = rs.getString("Q_CONTENT");
				String q_file = rs.getString("Q_FILE");
				String q_date = rs.getString("Q_DATE");
				String user_id = rs.getString("USER_ID");

				cvo = new CenterVO(q_seq, q_title, q_content, q_file, q_date, user_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cvo;
	}

	public CenterCommentVO getReply(int num) {

		CenterCommentVO ccvo = null;

		try {
			connect();

			String sql = "select * from t_center_comment where q_seq=? order by a_seq"; 
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);

			rs = pst.executeQuery();
			if (rs.next()) {
				int a_seq = rs.getInt("A_SEQ");
				int q_seq = rs.getInt("Q_SEQ");
				String a_content = rs.getString("A_CONTENT");
				String a_file = rs.getString("A_FILE");
				String a_date = rs.getString("A_DATE");
				String user_id = rs.getString("USER_ID");

				ccvo = new CenterCommentVO(a_seq, q_seq, a_content, a_file, a_date, user_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return ccvo;
	}

	public int centerWrite(String centerTitle, String centerContent, String userID) {
		int cnt = 0;

		try {
			connect();

			String sql = "INSERT INTO t_center VALUES (T_CENTER_SEQ.nextval, ?, ?, null, sysdate, ?)";
			
			pst = conn.prepareStatement(sql);

			pst.setString(1, centerTitle);
			pst.setString(2, centerContent);
			pst.setString(3, userID);
			cnt = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int centerWriteUp(int num, String centerTitle, String centerContent) {
		int cnt = 0;

		try {
			connect();

			String sql = "update t_center set q_title = ?, q_content = ? where q_seq = ?";
			
			pst = conn.prepareStatement(sql);

			pst.setString(1, centerTitle);
			pst.setString(2, centerContent);
			pst.setInt(3, num);
			cnt = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
