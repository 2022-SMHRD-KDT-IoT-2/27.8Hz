package com.POJO;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.CenterDAO;
import com.dao.CommunityDAO;
import com.dao.NewsDAO;
import com.dao.UserDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.model.UserVO;

public class AdminDeleteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버퍼안에 데이터 읽을 때 사용 (임시저장)

		BufferedReader reader = request.getReader(); // 요청 데이터 읽을 때 사용
		
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을 때 반복수행
			sb.append(line); // 읽어온 데이터를 sb(stringbuffer)에 추가할 때 사용
		}
		
		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경 후 JSON으로 다시 변경
		
		String id = element.getAsJsonObject().get("ID").getAsString(); // 키값이 id인 데이터
		
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO) session.getAttribute("loginVO");
		
		CommunityDAO Cdao = new CommunityDAO();
		// 삭제예정회원이 작성한 글 삭제 (자유게시판)
		ArrayList<Integer> communityList = Cdao.selectIDCommunity(id); // id로 자유게시판에 쓴 글의 글번호 조회
		for (int i=0; i<communityList.size(); i++) {
			Cdao.CommentDelete(communityList.get(i)); // 글번호로 해당 글의 댓글 전체 삭제
			Cdao.CommunityDelete(communityList.get(i)); // 글번호로 해당 글 삭제
		}
		
		//삭제예정회원이 남긴 댓글 삭제 (자유게시판)
		Cdao.deleteNumComment(id);
		
		//삭제예정회원이 남긴 댓글 삭제 (건강뉴스)
		NewsDAO ndao = new NewsDAO();
		ndao.NewCommentDelete2(id);

		//삭제예정회원이 남긴 문의글 삭제
		CenterDAO cdao = new CenterDAO();
		ArrayList<Integer> centerList = cdao.selectIDcenter(id);
		for (int i=0; i<centerList.size(); i++) {			
			cdao.centerCommentDelete(centerList.get(i)); //문의글에 남긴 관리자 댓글 삭제
		}
		cdao.centerDelete(id); //문의글 삭제
		
		UserDAO udao = new UserDAO();
		udao.deleteUser(id);
		String url="";
		
		return url;
	}
	

}
