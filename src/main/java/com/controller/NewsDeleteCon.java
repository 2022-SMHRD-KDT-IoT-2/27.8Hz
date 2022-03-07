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

		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버퍼안에 데이터 읽을 때 사용 (임시저장)

		BufferedReader reader = request.getReader(); // 요청 데이터 읽을 때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을 때 반복수행
			sb.append(line); // 읽어온 데이터를 sb(stringbuffer)에 추가할 때 사용
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경 후 JSON으로 다시 변경

		System.out.println("뉴스 번호 : " + num);

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
