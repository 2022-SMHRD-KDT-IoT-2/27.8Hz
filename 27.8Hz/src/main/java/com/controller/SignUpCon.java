package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SignUpDAO;


@WebServlet("/SignUpCon")
public class SignUpCon extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String addr = request.getParameter("addr");
		String carNum = request.getParameter("carNum");
		String phone = request.getParameter("phone");
		String gNum = request.getParameter("gNum");
		
		System.out.println(id);
		System.out.println(name);
		System.out.println(pw);
		System.out.println(addr);
		System.out.println(carNum);
		System.out.println(phone);
		System.out.println(gNum);
		
		SignUpDAO dao = new SignUpDAO();
		
		int cnt = dao.join(id, name, pw, addr, carNum, phone, gNum);
		
		if(cnt>0) {
			
			response.sendRedirect("header.jsp"); // 회원가입 성공시 페이지 (2.28현재 아직 없음)
		}else {
			response.sendRedirect("header.jsp"); // 회원가입 실패시 메인페이지로
		}
		
	}

}
