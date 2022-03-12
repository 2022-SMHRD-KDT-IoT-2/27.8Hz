package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.SignUpDAO;

public class SignUpCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


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
		
		String url="";
		if(cnt>0) {
			url="main.jsp"; // ȸ������ ������ ������ (2.28���� ���� ����)
		}else {
			url="main.jsp"; // ȸ������ ���н� ������������
		}
		
		return url;
		
	}

}
