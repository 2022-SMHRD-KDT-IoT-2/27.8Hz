package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.model.UserVO;

@WebServlet("/NewsCommentCon")
public class NewsCommentCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버퍼안의 데이터 읽을때 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복 수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

		int boardnum = element.getAsJsonObject().get("boardnum").getAsInt(); // 키값이 boardnum인 데이터
		String reply = element.getAsJsonObject().get("reply").getAsString(); // 키값이 reply인 데이터

		System.out.println("번호 : " + boardnum);
		System.out.println("댓글 : " + reply);

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginVO");
		
		// 로그인 가능할 경우 콘솔창에 : 로그인성공 출력 (페이지이동X)
		// 로그인 불가능할 경우 콘솔창에 : 로그인실패 출력 (페이지이동X)
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_d_1_0216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			String sql = "INSERT INTO t_news_comment VALUES(t_news_seq.nextval, ?, ?, SYSDATE, ?, 0)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardnum);
			psmt.setString(2, reply);
			psmt.setString(3, vo.getUser_id());

			int cnt = psmt.executeUpdate();

			PrintWriter out = response.getWriter();

			if (cnt > 0) {
				// "success" 응답
				out.print("success"); 
			} else {
				// "fail" 응답
				out.print("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}// end of finally
		
	}

}
