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
		//String lat = request.getParameter("LAT");
		//String lon = request.getParameter("LON");
		String hr = request.getParameter("HR");
		String o2 = request.getParameter("O2");
		int I_o2 = Integer.parseInt(o2);
		//String temp = request.getParameter("TEMP");
		//String shockVal = request.getParameter("SHOCKVAL");
		
		
		/* if(lat != null && lon != lat){
			System.out.print("lat = " + lat);
			System.out.print(" lon = " + lon);			
		} */
		if(I_o2!=0){
		System.out.print("hr = " + hr);
		System.out.println(" o2 = " + o2);
		}
		//System.out.print(" temp = " + temp);
		//System.out.println(" shockVal = " + shockVal);
	%>
</body>
</html>