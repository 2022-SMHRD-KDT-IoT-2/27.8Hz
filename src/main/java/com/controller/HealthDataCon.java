package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MonitoringDAO;
import com.model.MonitoringVO;
import com.model.UserVO;

@WebServlet("/HealthDataCon")
public class HealthDataCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO)session.getAttribute("loginVO");
		ArrayList<MonitoringVO> al = null;
		
		
		if(mvo == null) {
			//로그인하지 않고 클릭시 '로그인 후 사용하세요!' 알림 표시
			response.sendRedirect("./278board/HealthDataLoginFail.jsp");			
		}else {
			MonitoringDAO dao = new MonitoringDAO();
			al = dao.selectMonitoring(mvo.getUser_id());		
			
			
			if(al.size() < 1) {
				//저장된 정보가 없을 시 '저장된 정보가 없습니다' 출력 
				response.sendRedirect("./278board/HealthDataFail.jsp");
			}else {
				response.sendRedirect("./278board/HealthData.jsp");
			}
		}
		
	}// end of service
}