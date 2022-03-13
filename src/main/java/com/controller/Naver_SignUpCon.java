package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


import com.dao.LoginDAO;
import com.model.UserVO;


@WebServlet("/Naver_SignUpCon")
public class Naver_SignUpCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = null;
		 String name = null;
		 String mobile =null;
		 
	    String clientId = "0TslkJsscQQ4XWJozF5D";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "4s2KfD_bKb";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://211.227.224.169:8081/27.8Hz/main.jsp", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	  System.out.println(res.toString());
	    		JSONParser parsing = new JSONParser();
	    		Object obj = parsing.parse(res.toString());
	    		JSONObject jsonObj = (JSONObject)obj;
	    			        
	    		access_token = (String)jsonObj.get("access_token");
	    		refresh_token = (String)jsonObj.get("refresh_token");
	    		
	      }
	      
	      
	      
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
	    
	    if(access_token != null) { // access_token을 잘 받아왔다면
	    	try {
	    		 String apiurl = "https://openapi.naver.com/v1/nid/me";
	    		 URL url = new URL(apiurl);
	    		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    		con.setRequestMethod("GET");
	    		con.setRequestProperty("Authorization", header);
	    		int responseCode = con.getResponseCode();
	    		BufferedReader br;
	    		if(responseCode==200) { // 정상 호출
	    		 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    		} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    		}
	    		String inputLine;
	    		StringBuffer res = new StringBuffer();
	    		 while ((inputLine = br.readLine()) != null) {
	    		res.append(inputLine);
	    		}
	    		 
	    		 JSONParser parsing = new JSONParser();
	    		 Object obj = parsing.parse(res.toString());
	    		 JSONObject jsonObj = (JSONObject)obj;
	    		 JSONObject resObj = (JSONObject)jsonObj.get("response");
	    		  
	    		 //왼쪽 변수 이름은 원하는 대로 정하면 된다. 
	    		 //단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
	    		
	    		  email = (String)resObj.get("email");
	    		  name = (String)resObj.get("name");
	    		  mobile = (String)resObj.get("mobile");
	    		  
	    		 System.out.println();
	    		 System.out.println("네이버에 등록된 이메일: " + email);
	    		 System.out.println("네이버에 등록된 이름: " +name);
	    		 System.out.println("네이버에 등록된 연락처: " +mobile);
	    		br.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    
	    }
	    
	    
	    
	    
	    response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out =response.getWriter();
		
		
		LoginDAO dao = new LoginDAO();
		UserVO vo = dao.Naver_Login(email, name, mobile);
		
		if(vo==null){//없으면 회원가입

			UserVO vo2 = new UserVO(email, name, mobile);
			
			HttpSession session = request.getSession();
			session.setAttribute("SignUpVO", vo2);
			response.sendRedirect("./SignUP/signUp.jsp"); 
			
		}else { //이미 존재하는경우 로그인으로 바로 간다.
		response.sendRedirect("./Login/Login.jsp"); 
		
	}
	  
	  
	}

}
