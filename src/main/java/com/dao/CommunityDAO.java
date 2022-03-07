package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.CommentVO;
import com.model.CommunityVO;


public class CommunityDAO {
	
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
	
	
	
	
	
	//========================== 커뮤니티 목록 가져오기============================
	public ArrayList<CommunityVO> C_getList() {
		
		
		ArrayList<CommunityVO> al = new ArrayList<CommunityVO>();
		
		try {
			conn();
				
			//				게시물번호				제목				ID 		작성날짜			조회수
			String sql = "select article_seq, article_title, user_id, article_date,  article_cnt  from t_community order by ARTICLE_SEQ";
			
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
				close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return al;
	}
	
	
	
	
	// ================================글쓰기 버튼 클릭시 게시글 작성==================
	public int boardWrite(String boardTitle, String boardContent, String userID) {
		
		int cnt =0;
		
		try {
		conn();
		
		String sql = "insert into T_COMMUNITY values(T_COMMUNITY_SEQ.nextval, ?, ?, null, sysdate, 0, ?, 0)";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, boardTitle);
		psmt.setString(2, boardContent);
		psmt.setString(3, userID);

		cnt = psmt.executeUpdate();

		} catch (Exception e) {
	
			e.printStackTrace();
		}finally {
			
			close();

		}
		
		return cnt;
	}
	
	
	// ================글하나 불러오기 ==============
	public CommunityVO getOne(int num) {
	
		CommunityVO vo = null;
		
		try {
			conn();
			
			String sql = "select USER_ID, ARTICLE_TITLE, ARTICLE_CONTENT from T_COMMUNITY where ARTICLE_SEQ= ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				
				String USER_ID = rs.getString(1);
				String ARTICLE_TITLE = rs.getString(2);
				String ARTICLE_CONTENT = rs.getString(3);
			
				
				vo = new CommunityVO(USER_ID, ARTICLE_TITLE, ARTICLE_CONTENT);
			}//end of while
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	         
	         String sql = "update T_COMMUNITY set ARTICLE_CNT=ARTICLE_CNT+1 where ARTICLE_SEQ=?";
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setInt(1, num);
	         int cnt = psmt.executeUpdate();
	   
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	   
	         try {
	           close();
	           
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      } 	
	}
	

//댓글목록 불러오기
public ArrayList<CommentVO> getReply(int num) {

	ArrayList<CommentVO> al = new ArrayList<CommentVO>();
	
	try {
		conn();
		
		String sql = "select COMMENT_CONTENT, USER_ID, COMMENT_DATE "
				+ "from T_COMMENT  where ARTICLE_SEQ = ? order by COMMENT_SEQ asc";
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, num);
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
			String getContent = rs.getString(1);
			String getWriter = rs.getString(2);
			String getDate  = rs.getString(3);
		
			
			CommentVO vo = new CommentVO(getContent, getWriter, getDate);
			al.add(vo);
		}//end of while
		
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
}// end of 


//커뮤니티 글 수정
public int boardModify(String boardTitle, String boardContent, int num) {
	
	int cnt =0;
	
	try {
	conn();
	
	String sql = "update T_COMMUNITY set ARTICLE_TITLE=?, ARTICLE_CONTENT=? where ARTICLE_SEQ=?";
	
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, boardTitle);
	psmt.setString(2, boardContent);
	psmt.setInt(3, num);

	cnt = psmt.executeUpdate();

	} catch (Exception e) {

		e.printStackTrace();
	}finally {
		
		close();

	}
	
	return cnt;
}


//게시글 삭제
public int CommunityDelete(int num) {
	int cnt = 0;
	
	
	try {
		conn();
		

	String sql = "delete from T_COMMUNITY where ARTICLE_SEQ=?";
	
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, num);
	
	cnt = psmt.executeUpdate();
			
	
	} catch (Exception e) {

		e.printStackTrace();
	}finally {
		
		close();
	}

	return cnt;
	


}




//댓글삭제
public int CommentDelete(int num) {
	int cnt = 0;
	
	
	try {
		conn();
		

	String sql = "delete from T_COMMENT where ARTICLE_SEQ=?";
	
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, num);
	
	cnt = psmt.executeUpdate();
			
	
	} catch (Exception e) {

		e.printStackTrace();
	}finally {
		
		close();
	}

	return cnt;

}

}
