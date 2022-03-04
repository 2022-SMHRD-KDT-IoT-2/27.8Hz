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

@WebServlet("/DeleteCCCon")
public class DeleteCCCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer sb = new StringBuffer(); //읽어온 데이터 저장
		String line = null; //버퍼안에 데이터 읽을 때 사용 (임시저장)
		
		BufferedReader reader = request.getReader(); //요청 데이터 읽을 때 사용
		while((line = reader.readLine()) != null) { //읽을 데이터가 있을 때 반복수행
			sb.append(line); //읽어온 데이터를 sb(stringbuffer)에 추가할 때 사용
		}
		
		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); //버퍼데이터 문자열로 변경 후 JSON으로 다시 변경

		int num = element.getAsJsonObject().get("num").getAsInt(); //키값이 id인 데이터
		
		System.out.println("문의 번호 : " + num);

		HttpSession session = request.getSession();
		UserVO mvo = (UserVO)session.getAttribute("loginVO");
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_d_1_0216";
			String password = "smhrd1";

			conn = DriverManager.getConnection(url, user, password);
			
			String sql = "delete from t_center_comment where q_seq = ? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			
			int cnt = pst.executeUpdate();
			
			PrintWriter out = response.getWriter();
			
			if (cnt>0) {
				out.print("success");
			} else {
				out.print("fali");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
