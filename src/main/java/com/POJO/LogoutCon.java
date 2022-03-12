package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;

public class LogoutCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginVO");
		session.removeAttribute("SignUpVO");
		
		return "main.jsp";
	}
	
	

}
