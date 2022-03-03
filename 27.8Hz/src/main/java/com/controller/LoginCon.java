package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.LoginDAO;
import com.model.UserVO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("euc-kr");
		PrintWriter out =response.getWriter();
		
		String id = request.getParameter("email");
		String pw = request.getParameter("pass");
		
		System.out.println(id );
		System.out.println(pw );
		
		LoginDAO dao = new LoginDAO();
		UserVO vo = dao.Login(id, pw);
		
		if(vo!=null){

			HttpSession session = request.getSession();
			session.setAttribute("loginVO", vo);	
			
			response.sendRedirect("header.jsp"); 
		}else { //vo=null
		response.sendRedirect("./Login/login.html"); 
		// 일단은 실패하면 다시 로그인으로
	}
		
	}

}
