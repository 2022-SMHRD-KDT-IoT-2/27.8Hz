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
		
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null;  // ���۾��� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ� ����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		int boardnum = element.getAsJsonObject().get("boardnum").getAsInt(); // Ű���� boardnum�� ������
		String reply = element.getAsJsonObject().get("reply").getAsString(); // Ű���� reply�� ������

		System.out.println("번호 : " + boardnum);
		System.out.println("?���? : " + reply);

		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginVO");
		
		// �α��� ������ ��� �ܼ�â�� : �α��μ��� ��� (�������̵�X)
		// �α��� �Ұ����� ��� �ܼ�â�� : �α��ν��� ��� (�������̵�X)
		
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
				// "success" ����
				out.print("success");
			} else {
				// "fail" ����
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
