package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.NewsCommentVO;
import com.model.NewsVO;

public class NewsDAO {

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
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	// 뉴스 목록 가져오기
	public ArrayList<NewsVO> N_getList() {

		ArrayList<NewsVO> al = new ArrayList<NewsVO>();

		try {
			conn();

			// 게시물번호 제목 ID 작성날짜 조회수
			String sql = "SELECT news_seq, news_title, user_id, news_date, news_cnt FROM t_news ORDER BY news_seq";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				int news_seq = rs.getInt(1);
				String news_title = rs.getString(2);
				String user_id = rs.getString(3);
				String news_date = rs.getString(4);
				int news_cnt = rs.getInt(5);

				NewsVO vo = new NewsVO(news_seq, news_title, user_id, news_date, news_cnt);
				al.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return al;
	}

	// 글쓰기 기능
	public int NewsWrite(String boardTitle, String boardContent, String userID) {

		int cnt = 0;

		try {
			conn();

			String sql = "INSERT INTO T_NEWS VALUES(T_NEWS_SEQ.nextval, ?, ?, 0, SYSDATE, 0, ?, 0)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardTitle);
			psmt.setString(2, boardContent);
			psmt.setString(3, userID);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 게시물 불러오기
	public NewsVO getOne(int num) {

		NewsVO vo = null;

		try {
			conn();

			String sql = "SELECT USER_ID, NEWS_TITLE, NEWS_CONTENT FROM T_NEWS WHERE NEWS_SEQ= ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {

				String USER_ID = rs.getString(1);
				String NEWS_TITLE = rs.getString(2);
				String NEWS_CONTENT = rs.getString(3);

				vo = new NewsVO(USER_ID, NEWS_TITLE, NEWS_CONTENT);
			} // end of while

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return vo;
	}

	// 조회수
	public void updateViews(int num) {

		try {
			conn();

			String sql = "UPDATE T_NEWS SET NEWS_CNT = NEWS_CNT+1 WHERE NEWS_SEQ=?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, num);
			int cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	//댓글
	public ArrayList<NewsCommentVO> getReply(int num) {

		ArrayList<NewsCommentVO> al = new ArrayList<NewsCommentVO>();

		try {
			conn();

			String sql = "SELECT NC_CONTENT, USER_ID, NC_DATE, NC_SEQ FROM T_NEWS_COMMENT WHERE NEWS_SEQ = ? order by nc_seq desc";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String getContent = rs.getString(1);
				String getWriter = rs.getString(2);
				String getDate = rs.getString("NC_DATE");
				int nc_seq = rs.getInt("nc_seq");

				NewsCommentVO vo = new NewsCommentVO(getContent, getWriter, getDate, nc_seq);
				al.add(vo);
			} // end of while

		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			try {
				close();			
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return al;
	}// end of

	// 뉴스 게시글 수정
	public int NewsModify(String boardTitle, String boardContent, int num) {

		int cnt = 0;

		try {
			conn();

			String sql = "UPDATE T_NEWS SET NEWS_TITLE=?, NEWS_CONTENT=? WHERE NEWS_SEQ=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boardTitle);
			psmt.setString(2, boardContent);
			psmt.setInt(3, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 게시글 삭제
	public int NewsDelete(int num) {
		int cnt = 0;

		try {
			conn();

			String sql = "DELETE FROM T_NEWS WHERE NEWS_SEQ = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 댓글 삭제
	public int NewCommentDelete(int num) {
		int cnt = 0;

		try {
			conn();

			String sql = "DELETE FROM T_NEWS_COMMENT WHERE NEWS_SEQ = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// id로 조회해서 댓글 삭제
	public int NewCommentDelete2(String id) {
		int cnt = 0;
		
		try {
			conn();

			String sql = "DELETE FROM T_NEWS_COMMENT WHERE USER_ID = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//댓글 개수
	public int NewCommentCnt(int num) {
		int cnt = 0;

		try {
			conn();

			String sql = "SELECT NC_CONTENT FROM T_NEWS_COMMENT WHERE NEWS_SEQ = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			 rs = psmt.executeQuery();
			 
			 while (rs.next()) {
				 cnt++;
			 }

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
