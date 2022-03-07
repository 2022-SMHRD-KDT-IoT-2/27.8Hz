package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewsDAO;
import com.model.UserVO;

@WebServlet("/NewsWriteCon")
public class NewsWriteCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시판 글쓰기
		request.setCharacterEncoding("euc-kr");

		String NewsTitle = request.getParameter("NewsTitle");
		String NewsContent = request.getParameter("NewsContent");
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO) session.getAttribute("loginVO");
		String writer = mvo.getUser_id();

		System.out.println(NewsTitle);
		System.out.println(NewsContent);
		System.out.println(writer);

		NewsDAO ndao = new NewsDAO();

		int cnt = ndao.NewsWrite(NewsTitle, NewsContent, writer);

		if (cnt > 0) {
			response.sendRedirect("./278board/NewsList.jsp");
		} else {
			response.sendRedirect("./278board/NewsWrite.jsp");
		}
	}
}
