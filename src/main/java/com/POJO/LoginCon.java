package com.POJO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.LoginDAO;
import com.model.UserVO;

public class LoginCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out =response.getWriter();
		
		String id = request.getParameter("email");
		String pw = request.getParameter("pass");
		
		System.out.println(id );
		System.out.println(pw );
		
		LoginDAO dao = new LoginDAO();
		UserVO vo = dao.Login(id, pw);
		
		String url="";
		if(vo!=null){

			HttpSession session = request.getSession();
			session.setAttribute("loginVO", vo);	
			
			 url="main.jsp"; 
		}else { //vo=null
			 url="./Login/Login.jsp"; 
		// 일단은 실패하면 다시 로그인으로
	}
		return url;
	}

}
