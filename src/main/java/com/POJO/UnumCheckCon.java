package com.POJO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.SignUpDAO;

public class UnumCheckCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		
		String userNum = request.getParameter("userNum");
		System.out.println(userNum);
		
		PrintWriter out = response.getWriter();
		
		SignUpDAO dao = new SignUpDAO();
		
		int idCheck = dao.checkTel(userNum);
		
		if(idCheck == 0) {
			System.out.println("�̹� ���Ե� ��ȣ�Դϴ�.");
			
		}  	else if (idCheck==1) {
			System.out.println("��� ������ ��ȣ �Դϴ�.");
		}
		
		//out.write(idCheck+"");
		String idCheck2=Integer.toString(idCheck);
		return idCheck2;
	}

}
