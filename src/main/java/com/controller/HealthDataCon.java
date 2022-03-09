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
		
		MonitoringDAO dao = new MonitoringDAO();
		ArrayList<MonitoringVO> al = dao.selectMonitoring(mvo.getUser_id());
		
		if(al.size() < 1) {
			response.sendRedirect("./278board/HealthDataFail.jsp");
		}else {
			response.sendRedirect("./278board/HealthData.jsp");
		}
		
	}
}