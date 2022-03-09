<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String lat = request.getParameter("LAT");
	String lon = request.getParameter("LON");
	String hr = request.getParameter("hr");
	String o2 = request.getParameter("o2");
	String temp = request.getParameter("temp");

	if (hr != null && o2 != null && temp != null) {
		double I_hr = Double.parseDouble(hr);
		double I_o2 = Double.parseDouble(o2);
		double I_temp = Double.parseDouble(temp);

		System.out.print("hr = " + I_hr);
		System.out.print(" o2 = " + I_o2);
		System.out.print(" temp = " + I_temp);
	}
	
	if (lat!=null && lon!=null) {
		System.out.print(" lat = " + lat);
		System.out.print(" lon = " + lon);
	}
	%>
</body>
</html>