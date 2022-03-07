package com.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewsDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.model.UserVO;

@WebServlet("/NewsDeleteCon")
public class NewsDeleteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));

		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ���۾ȿ� ������ ���� �� ��� (�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û ������ ���� �� ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ���� �� �ݺ�����
			sb.append(line); // �о�� �����͸� sb(stringbuffer)�� �߰��� �� ���
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ���� �� JSON���� �ٽ� ����

		System.out.println("���� ��ȣ : " + num);

		HttpSession session = request.getSession();
		UserVO mvo = (UserVO) session.getAttribute("loginVO");

		NewsDAO dao = new NewsDAO();
		int Ncnt = dao.NewCommentDelete(num);
		int Ccnt = dao.NewsDelete(num);
		if (Ncnt*Ccnt > 0) {
			response.sendRedirect("./278board/NewsList.jsp");
		} else {
			response.sendRedirect("./278board/NewsList.jsp");
		}
	}
}
