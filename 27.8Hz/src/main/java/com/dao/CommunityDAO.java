package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.CommunityVO;

public class CommunityDAO {
	
	public ArrayList<CommunityVO> getList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ArrayList<CommunityVO> al = new ArrayList<CommunityVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_d_1_0216";
			String dbpw = "smhrd1";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
				
			//				게시물번호				제목				ID 		작성날짜			조회수
			String sql = "select article_seq, article_title, user_id, article_date,  article_cnt  from t_community";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()){

				int article_seq = rs.getInt(1);
				String article_title = rs.getString(2);
				String user_id = rs.getString(3);
				String article_date = rs.getString(4);
				int article_cnt = rs.getInt(5);
				
				
				
				CommunityVO vo = new CommunityVO(article_seq, article_title, user_id, article_date, article_cnt );
				al.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				psmt.close();
				conn.close();			
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return al;
	}
	
	
}
