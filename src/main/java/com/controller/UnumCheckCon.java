package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SignUpDAO;


@WebServlet("/UnumCheckCon")
public class UnumCheckCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		
		String userNum = request.getParameter("userNum");
		System.out.println(userNum);
		
		PrintWriter out = response.getWriter();
		
		SignUpDAO dao = new SignUpDAO();
		
		int idCheck = dao.checkTel(userNum);
		
		if(idCheck == 0) {
			System.out.println("이미 가입된 번호입니다.");
			
		}  	else if (idCheck==1) {
			System.out.println("사용 가능한 번호 입니다.");
		}
		
		out.write(idCheck+"");
		
	}

}
