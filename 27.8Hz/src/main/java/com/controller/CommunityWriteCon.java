package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.CommunityDAO;

@WebServlet("/boardWriteCon")
public class CommunityWriteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//게시판 글쓰기 
		request.setCharacterEncoding("euc-kr");
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String userID = request.getParameter("userID");
		
		System.out.println(boardTitle);
		System.out.println(boardContent);
		System.out.println(userID);
		
		CommunityDAO dao = new CommunityDAO();
		
		int cnt = dao.boardWrite(boardTitle, boardContent, userID );
		
		
		if(cnt>0) {
			
			response.sendRedirect("./app/board/CommunityList.jsp");
		}else {
			response.sendRedirect("./app/board/CommunityList.jsp");
		}
		
	}

}
