package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.model.UserVO;

@WebServlet("/editProfileCon")
public class editProfileCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;");
		
		String user_name = request.getParameter("name");
		String user_pw = request.getParameter("pw");
		String user_addr = request.getParameter("addr");
		String user_carnum = request.getParameter("carNum");
		String user_phone = request.getParameter("phone");
		String guardian_phone = request.getParameter("gNum");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginVO");
		String user_id = vo.getUser_id();
		
		System.out.println(vo.getUser_id());
		System.out.println(user_name);
		System.out.println(user_pw);
		System.out.println(user_addr);
		System.out.println(user_carnum);
		System.out.println(user_phone);
		System.out.println(guardian_phone);
		
		UserDAO dao = new UserDAO();
		int cnt = dao.updateInfo(vo.getUser_id(),user_name,user_pw,user_addr,user_carnum,user_phone,guardian_phone);
		
		if(cnt > 0) {
			System.out.println("수정 성공");
			
			UserVO vo2 = new UserVO(vo.getUser_id(),user_pw);
			session.setAttribute("loginVO", vo2);
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("수정 실패");
			
			response.sendRedirect("editProfile.jsp");
		}
	}
}