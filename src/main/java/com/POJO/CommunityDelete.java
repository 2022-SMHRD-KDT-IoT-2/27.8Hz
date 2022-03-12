package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.CommunityDAO;

public class CommunityDelete implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
request.setCharacterEncoding("euc-kr");
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		CommunityDAO dao = new CommunityDAO();
		int cnt1= dao.CommentDelete(num);
		int cnt2 = dao.CommunityDelete(num);
		
		
		return "./278board/CommunityList.jsp";
	}
}
