package com.POJO;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.NewsDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.model.UserVO;

public class NewsDeleteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

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
		
		String url="";
		
		if (Ncnt*Ccnt > 0) {
			url="./278board/NewsList.jsp";
		} else {
			url="./278board/NewsList.jsp";
		}
		
		return url;
	}
}
