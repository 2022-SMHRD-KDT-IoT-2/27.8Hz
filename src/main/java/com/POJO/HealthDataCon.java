package com.POJO;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.dao.MonitoringDAO;
import com.model.MonitoringVO;
import com.model.UserVO;

public class HealthDataCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO)session.getAttribute("loginVO");
		ArrayList<MonitoringVO> al = null;
		
		String url="";
		
		if(mvo == null) {
			//�α������� �ʰ� Ŭ���� '�α��� �� ����ϼ���!' �˸� ǥ��
			url="./278board/HealthDataLoginFail.jsp";			
		}else {
			MonitoringDAO dao = new MonitoringDAO();
			al = dao.selectMonitoring(mvo.getUser_id());		
			
			
			if(al.size() < 1) {
				//����� ������ ���� �� '����� ������ �����ϴ�' ��� 
				url="./278board/HealthDataFail.jsp";
			}else {
				url="./278board/HealthData.jsp";
			}
		}
		return url;
		
	}// end of service
}