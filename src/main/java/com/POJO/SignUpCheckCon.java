package com.POJO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.SignUpDAO;

public class SignUpCheckCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		PrintWriter out = response.getWriter();
		
		SignUpDAO dao = new SignUpDAO();
		
		int idCheck = dao.checkId(userId);
		
		if(idCheck == 0) {
			System.out.println("�̹� �����ϴ� �̸��� �Դϴ�");
			
		} else if (idCheck==1) {
			System.out.println("��� ������ �̸��� �Դϴ�.");
		} 
		//out.write(idCheck+"");
		String idCheck2=Integer.toString(idCheck);
		return idCheck2;
	}

}
