package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CenterDAO;
import com.model.UserVO;

@WebServlet("/CenterWriteCon")
public class CenterWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 글쓰기 
				request.setCharacterEncoding("euc-kr");

				String centerTitle = request.getParameter("centerTitle");
				String centerContent = request.getParameter("centerContent");
				HttpSession session = request.getSession();
				UserVO mvo = (UserVO) session.getAttribute("loginVO");
				String writer = mvo.getUser_id();
				
				System.out.println(centerTitle);
				System.out.println(centerContent);
				System.out.println(writer);
				
				CenterDAO cdao = new CenterDAO();
				
				int cnt = cdao.centerWrite(centerTitle, centerContent, writer);
			
				if(cnt>0) {
					response.sendRedirect("./278board/CenterList.jsp");
				}else {
					response.sendRedirect("./278board/CenterWrite.jsp");
				}
		
	}

}
