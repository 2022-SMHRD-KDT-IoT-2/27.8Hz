package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CommunityDAO;


@WebServlet("/CommunityModifyCon")
public class CommunityModifyCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//게시판 수정하기 
				request.setCharacterEncoding("euc-kr");
				
				String boardTitle = request.getParameter("boardTitle");
				String boardContent = request.getParameter("boardContent");
				String userID = request.getParameter("userID");
				int num = Integer.parseInt(request.getParameter("num"));
				
				System.out.println(boardTitle);
				System.out.println(boardContent);
				System.out.println(num);
				
				CommunityDAO dao = new CommunityDAO();
				
				int cnt = dao.boardModify(boardTitle, boardContent, num);
				
				
				if(cnt>0) {
					
					response.sendRedirect("./278board/CommunityList.jsp");
				}else {
					response.sendRedirect("./278board/CommunityList.jsp");
				}
				
			}
	
		
	}


