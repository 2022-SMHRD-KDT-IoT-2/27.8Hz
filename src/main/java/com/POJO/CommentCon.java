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
		StringBuffer sb = new StringBuffer(); // ?ùΩ?ñ¥?ò® ?ç∞?ù¥?Ñ∞ ???û•
		String line = null; // Î≤ÑÌçº?ïà?ùò ?ç∞?ù¥?Ñ∞ ?ùΩ?ùÑ?ïå ?Ç¨?ö©(?ûÑ?ãú???û•)

		BufferedReader reader = request.getReader(); // ?öîÏ≤??ç∞?ù¥?Ñ∞ ?ùΩ?ùÑ?ïå ?Ç¨?ö©
		while ((line = reader.readLine()) != null) { // ?ùΩ?ùÑ ?ç∞?ù¥?Ñ∞Í∞? ?ûà?ùÑ?ïå Î∞òÎ≥µ ?àò?ñâ
			sb.append(line); // ?ùΩ?ñ¥?ò®?ç∞?ù¥?Ñ∞Î•? sb(stringbuffer) ?óê Ï∂îÍ?
		}

		JsonParser parser = new JsonParser(); // ?åå?ã±(Î¨∏Ïûê?ó¥ -> JSON)
		JsonElement element = parser.parse(sb.toString()); // Î≤ÑÌçº?ç∞?ù¥?Ñ∞ Î¨∏Ïûê?ó¥Î°? Î≥?Í≤ΩÌõÑ JSON?úºÎ°? Î≥?Í≤?

		int boardnum = element.getAsJsonObject().get("boardnum").getAsInt(); // ?Ç§Í∞íÏù¥ boardnum?ù∏ ?ç∞?ù¥?Ñ∞
		String reply = element.getAsJsonObject().get("reply").getAsString(); // ?Ç§Í∞íÏù¥ reply?ù∏ ?ç∞?ù¥?Ñ∞

		System.out.println("Î≤àÌò∏ : " + boardnum);
		System.out.println("?åìÍ∏? : " + reply);

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginVO");
		
		// Î°úÍ∑∏?ù∏ Í∞??ä•?ï† Í≤ΩÏö∞ ÏΩòÏÜîÏ∞ΩÏóê : Î°úÍ∑∏?ù∏?Ñ±Í≥? Ï∂úÎ†• (?éò?ù¥Ïß??ù¥?èôX)
		// Î°úÍ∑∏?ù∏ Î∂àÍ??ä•?ï† Í≤ΩÏö∞ ÏΩòÏÜîÏ∞ΩÏóê : Î°úÍ∑∏?ù∏?ã§?å® Ï∂úÎ†• (?éò?ù¥Ïß??ù¥?èôX)
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
				// "success" ?ùë?ãµ
				out.print("success");
			} else {
				// "fail" ?ùë?ãµ
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
