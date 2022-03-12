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
		
		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ���۾ȿ� ������ ���� �� ��� (�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û ������ ���� �� ���
		
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ���� �� �ݺ�����
			sb.append(line); // �о�� �����͸� sb(stringbuffer)�� �߰��� �� ���
		}
		
		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ���� �� JSON���� �ٽ� ����
		
		String id = element.getAsJsonObject().get("ID").getAsString(); // Ű���� id�� ������
		
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO) session.getAttribute("loginVO");
		
		CommunityDAO Cdao = new CommunityDAO();
		// ��������ȸ���� �ۼ��� �� ���� (�����Խ���)
		ArrayList<Integer> communityList = Cdao.selectIDCommunity(id); // id�� �����Խ��ǿ� �� ���� �۹�ȣ ��ȸ
		for (int i=0; i<communityList.size(); i++) {
			Cdao.CommentDelete(communityList.get(i)); // �۹�ȣ�� �ش� ���� ��� ��ü ����
			Cdao.CommunityDelete(communityList.get(i)); // �۹�ȣ�� �ش� �� ����
		}
		
		//��������ȸ���� ���� ��� ���� (�����Խ���)
		Cdao.deleteNumComment(id);
		
		//��������ȸ���� ���� ��� ���� (�ǰ�����)
		NewsDAO ndao = new NewsDAO();
		ndao.NewCommentDelete2(id);

		//��������ȸ���� ���� ���Ǳ� ����
		CenterDAO cdao = new CenterDAO();
		ArrayList<Integer> centerList = cdao.selectIDcenter(id);
		for (int i=0; i<centerList.size(); i++) {			
			cdao.centerCommentDelete(centerList.get(i)); //���Ǳۿ� ���� ������ ��� ����
		}
		cdao.centerDelete(id); //���Ǳ� ����
		
		UserDAO udao = new UserDAO();
		udao.deleteUser(id);
		String url="";
		
		return url;
	}
	

}
