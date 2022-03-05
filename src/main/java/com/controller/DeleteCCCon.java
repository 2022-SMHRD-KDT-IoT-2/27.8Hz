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
		StringBuffer sb = new StringBuffer(); //�о�� ������ ����
		String line = null; //���۾ȿ� ������ ���� �� ��� (�ӽ�����)
		
		BufferedReader reader = request.getReader(); //��û ������ ���� �� ���
		while((line = reader.readLine()) != null) { //���� �����Ͱ� ���� �� �ݺ�����
			sb.append(line); //�о�� �����͸� sb(stringbuffer)�� �߰��� �� ���
		}
		
		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); //���۵����� ���ڿ��� ���� �� JSON���� �ٽ� ����

		int num = element.getAsJsonObject().get("num").getAsInt(); //Ű���� id�� ������
		
		System.out.println("���� ��ȣ : " + num);

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
