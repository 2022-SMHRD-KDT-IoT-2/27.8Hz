package com.POJO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.model.UserVO;

public class CommentCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer(); // ?��?��?�� ?��?��?�� ???��
		String line = null; // 버퍼?��?�� ?��?��?�� ?��?��?�� ?��?��(?��?��???��)

		BufferedReader reader = request.getReader(); // ?���??��?��?�� ?��?��?�� ?��?��
		while ((line = reader.readLine()) != null) { // ?��?�� ?��?��?���? ?��?��?�� 반복 ?��?��
			sb.append(line); // ?��?��?��?��?��?���? sb(stringbuffer) ?�� 추�?
		}

		JsonParser parser = new JsonParser(); // ?��?��(문자?�� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼?��?��?�� 문자?���? �?경후 JSON?���? �?�?

		int boardnum = element.getAsJsonObject().get("boardnum").getAsInt(); // ?��값이 boardnum?�� ?��?��?��
		String reply = element.getAsJsonObject().get("reply").getAsString(); // ?��값이 reply?�� ?��?��?��

		System.out.println("번호 : " + boardnum);
		System.out.println("?���? : " + reply);

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginVO");
		
		// 로그?�� �??��?�� 경우 콘솔창에 : 로그?��?���? 출력 (?��?���??��?��X)
		// 로그?�� 불�??��?�� 경우 콘솔창에 : 로그?��?��?�� 출력 (?��?���??��?��X)
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_d_1_0216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			String sql = "insert into T_COMMENT values(T_COMMENT_SEQ.nextval, ?, ?, sysdate, ?, 0)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardnum);
			psmt.setString(2, reply);
			psmt.setString(3, vo.getUser_id());

			int cnt = psmt.executeUpdate();

			PrintWriter out = response.getWriter();

			if (cnt > 0) {
				// "success" ?��?��
				out.print("success");
			} else {
				// "fail" ?��?��
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
		String pass="";
		
		return pass;
		
	}

}
