<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="com.dao.MonitoringDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	MonitoringDAO mdao = new MonitoringDAO();
	boolean tf = false;
	
	String lat = request.getParameter("LAT");
	String lon = request.getParameter("LON");
	String hr = request.getParameter("hr");
	String o2 = request.getParameter("o2");
	String temp = request.getParameter("temp");
	
	//System.out.print("hr = " + hr);
	//System.out.print(" o2 = " + o2);
	//System.out.println(" temp = " + temp);

	
	if (hr != null && o2 != null && temp != null) {
		double I_hr = Double.parseDouble(hr);
		double I_o2 = Double.parseDouble(o2);
		double I_temp = Double.parseDouble(temp);
		System.out.print("hr = " + I_hr);
		System.out.print(" o2 = " + I_o2);
		System.out.println(" temp = " + I_temp);
		
		//DB에 값 저장하기
		
		tf = mdao.selectMo();
		if (tf) {
			mdao.updateMo(hr, o2, temp);
		} else {
			mdao.insertMo(hr, o2, temp);
		}
	}
	/*
	if (lat!=null && lon!=null) {
		System.out.print(" lat = " + lat);
		System.out.println(" lon = " + lon);
	}
	*/
	%>
</body>
</html>