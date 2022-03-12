package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.NewsDAO;

public class NewsModifyCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 게시판 수정하기
		request.setCharacterEncoding("euc-kr");

		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String userID = request.getParameter("userID");
		int num = Integer.parseInt(request.getParameter("num"));

		System.out.println(boardTitle);
		System.out.println(boardContent);
		System.out.println(num);

		NewsDAO dao = new NewsDAO();

		int cnt = dao.NewsModify(boardTitle, boardContent, num);
		String url = "";
		
		if (cnt > 0) {
			url="./278board/NewsList.jsp";
		} else {
			url="./278board/NewsList.jsp";
		}
		return url;
	}
}
