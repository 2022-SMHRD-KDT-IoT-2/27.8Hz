package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CommunityDAO;

@WebServlet("/CommunityDelete")
public class CommunityDelete extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		CommunityDAO dao = new CommunityDAO();
		
		int cnt = dao.CommunityDelete(num);
		
		
		if(cnt>0) {
			
			response.sendRedirect("./app/board/CommunityList.jsp");
		}else {
			response.sendRedirect("./app/board/CommunityList.jsp");
		}
	}

}
