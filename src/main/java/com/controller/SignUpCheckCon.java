package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SignUpDAO;


@WebServlet("/SignUpCheckCon")
public class SignUpCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		PrintWriter out = response.getWriter();
		
		SignUpDAO dao = new SignUpDAO();
		
		int idCheck = dao.checkId(userId);
		
		if(idCheck == 0) {
			System.out.println("이미 존재하는 이메일 입니다");
			
		} else if (idCheck==1) {
			System.out.println("사용 가능한 이메일 입니다.");
		} else if(idCheck==2) {
			System.out.println("빈칸 입니다.");
		}
		
		out.write(idCheck+"");
		
	}

}
