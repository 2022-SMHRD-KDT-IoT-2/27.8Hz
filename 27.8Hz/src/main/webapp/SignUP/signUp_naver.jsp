<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	
<!-- 네이버 로그인 -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Join, Us</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrap d-md-flex">l
						<div class="text-wrap p-4 p-lg-5 d-flex img"
							style="background-image: url(images/bg.jpg);">
							<div class="text w-100">
								<h2 class="mb-4">Welcome to signup form</h2>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="login-wrap p-4 p-md-5">
							<div class="row justify-content-center py-md-5">
								<div class="col-lg-9">
									<div class="social-wrap">
										<h3 class="mb-3 text-center">Thanks for Join us</h3>
										<p class="social-media d-flex justify-content-center">
											<a href="#"
												class="social-icon google d-flex align-items-center justify-content-center"><span
												class="fa fa-google"></span></a> <a href="#"
												class="social-icon facebook d-flex align-items-center justify-content-center"><span
												class="fa fa-facebook"></span></a> <a href="#"
												class="social-icon twitter d-flex align-items-center justify-content-center"><span
												class="fa fa-twitter"></span></a>
										</p>
										<p class="or">
											<span>or</span>
										</p>
									</div>
									<form action="#" class="signup-form">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="id">아이디</label> <input
														type="text" class="form-control" id="KakaoId">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="name">이름</label> <input
														type="text" class="form-control" id="name">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="password">비밀번호</label> <input
														type="password" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="address">주소</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="carnumber">차량번호</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="user_num">연락처</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="pro_num">보호자 연락처</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12 my-4">
												<div class="form-group">
													<div class="w-100">
														<label class="checkbox-wrap checkbox-primary">I
															agree all statements in terms of service <input
															type="checkbox" checked> <span class="checkmark"></span>
														</label>
													</div>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<button type="submit" class="btn btn-primary submit p-3">Create
														an account</button>
												</div>
											</div>
										</div>

									</form>
									<div class="w-100">
										<p class="mt-4">
											I'm already a member! <a href="#signin">Sign In</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%
    String clientId = "w_HWHzWLLzNe0AqGU0wB";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "w_HWHzWLLzNe0AqGU0wB";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8081/27.8Hz/SignUP/signUp_naver.jsp", "UTF-8");
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
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
	
	
</body>
</html>