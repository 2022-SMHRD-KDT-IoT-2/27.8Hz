package com.POJO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.dao.CommunityDAO;

public class CommunityWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//게시판 글쓰기 
				request.setCharacterEncoding("euc-kr");
				
				String boardTitle = request.getParameter("boardTitle");
				String boardContent = request.getParameter("boardContent");
				String userID = request.getParameter("userID");
				
				System.out.println(boardTitle);
				System.out.println(boardContent);
				System.out.println(userID);
				
				CommunityDAO dao = new CommunityDAO();
				
				int cnt = dao.boardWrite(boardTitle, boardContent, userID );
				
		return "./278board/CommunityList.jsp";
	}

}
