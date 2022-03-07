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

@WebServlet("/NewsCommentDeleteCon")
public class NewsCommentDeleteCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StringBuffer sb = new StringBuffer(); //�о�� ������ ����
		String line = null; //���۾ȿ� ������ ���� �� ��� (�ӽ�����)
		
		BufferedReader reader = request.getReader(); //��û ������ ���� �� ���
		while((line = reader.readLine()) != null) { //���� �����Ͱ� ���� �� �ݺ�����
			sb.append(line); //�о�� �����͸� sb(stringbuffer)�� �߰��� �� ���
		}
		
		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); //���۵����� ���ڿ��� ���� �� JSON���� �ٽ� ����

		String date = element.getAsJsonObject().get("date").getAsString(); //Ű���� ��¥�� ������
		String ID = element.getAsJsonObject().get("ID").getAsString(); //Ű���� id�� ������

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
			
			String sql = "delete from T_NEWS_COMMENT where "
					+ "NC_DATE = to_date(?, 'yyyy-mm-dd hh24:mi:ss') and USER_ID=? ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, date);
			pst.setString(2, ID);
			
			int cnt = pst.executeUpdate();
			
			PrintWriter out = response.getWriter();
			
			if (cnt>0) {
				out.print("success");
			} else {
				out.print("fail");
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
