package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.NewsDAO;
import com.model.UserVO;

public class NewsWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

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
		String url="";
		
		if (cnt > 0) {
			url="./278board/NewsList.jsp";
		} else {
			url="./278board/NewsWrite.jsp";
		}
		
		return url;
	}
}
