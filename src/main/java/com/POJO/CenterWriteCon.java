package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.CenterDAO;
import com.model.UserVO;

public class CenterWriteCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		String url = "";
		
		if(cnt>0) {
			url = "./278board/CenterList.jsp";
		}else {
			url = "./278board/CenterWrite.jsp";
		}

		return url;
	}

}
