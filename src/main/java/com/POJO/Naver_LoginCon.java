package com.POJO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.command.Command;
import com.dao.LoginDAO;
import com.model.UserVO;

public class Naver_LoginCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		 String email = null;
		 String name = null;
		 String mobile =null;
		 
	    String clientId = "0TslkJsscQQ4XWJozF5D";//?ï†?îåÎ¶¨Ï??ù¥?Öò ?Å¥?ùº?ù¥?ñ∏?ä∏ ?ïÑ?ù¥?îîÍ∞?";
	    String clientSecret = "4s2KfD_bKb";//?ï†?îåÎ¶¨Ï??ù¥?Öò ?Å¥?ùº?ù¥?ñ∏?ä∏ ?ãú?Å¨Î¶øÍ∞í";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/27.8Hz/main.jsp", "UTF-8");
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
	      if(responseCode==200) { // ?†ï?ÉÅ ?ò∏Ï∂?
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // ?óê?ü¨ Î∞úÏÉù
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
	    String header = "Bearer " + access_token; // Bearer ?ã§?ùå?óê Í≥µÎ∞± Ï∂îÍ?
	    
	    if(access_token != null) { // access_token?ùÑ ?ûò Î∞õÏïÑ?ôî?ã§Î©?
	    	try {
	    		 String apiurl = "https://openapi.naver.com/v1/nid/me";
	    		 URL url = new URL(apiurl);
	    		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    		con.setRequestMethod("GET");
	    		con.setRequestProperty("Authorization", header);
	    		int responseCode = con.getResponseCode();
	    		BufferedReader br;
	    		if(responseCode==200) { // ?†ï?ÉÅ ?ò∏Ï∂?
	    		 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    		} else {  // ?óê?ü¨ Î∞úÏÉù
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
	    		  
	    		 //?ôºÏ™? Î≥??àò ?ù¥Î¶ÑÏ? ?õê?ïò?äî ??Î°? ?†ï?ïòÎ©? ?êú?ã§. 
	    		 //?ã®, ?ö∞Ï∏°Ïùò get()?ïà?óê ?ì§?ñ¥Í∞??äî Í∞íÏ? ???ù∏?Éâ ?ÉÅ?ûê ?ïà?ùò Í∞íÏùÑ Í∑∏Î?Î°? ?†Å?ñ¥Ï£ºÏñ¥?ïº ?ïú?ã§.
	    		
	    		  email = (String)resObj.get("email");
	    		  name = (String)resObj.get("name");
	    		  mobile = (String)resObj.get("mobile");
	    		  
	    		 System.out.println();
	    		 System.out.println("?Ñ§?ù¥Î≤ÑÏóê ?ì±Î°ùÎêú ?ù¥Î©îÏùº: " + email);
	    		 System.out.println("?Ñ§?ù¥Î≤ÑÏóê ?ì±Î°ùÎêú ?ù¥Î¶?: " +name);
	    		 System.out.println("?Ñ§?ù¥Î≤ÑÏóê ?ì±Î°ùÎêú ?ó∞?ùΩÏ≤?: " +mobile);
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
		String url="";
		
		if(vo!=null){

			HttpSession session = request.getSession();
			session.setAttribute("loginVO", vo);	
			url="main.jsp"; 
		}else { //vo=null
			UserVO vo2 = new UserVO(email, name, mobile);
			System.out.println(vo2.getUser_id());
		HttpSession session = request.getSession();
		session.setAttribute("SignUpVO", vo2);
		url="./SignUP/signUp.jsp"; 
		// ?ùº?ã®?? ?ã§?å®?ïòÎ©? ?ã§?ãú Î°úÍ∑∏?ù∏?úºÎ°?
	}
		
		return url;
	  
	  
	}

}
