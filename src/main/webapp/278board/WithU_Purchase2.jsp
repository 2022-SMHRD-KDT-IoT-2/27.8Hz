<%@page import="com.model.MonitoringVO"%>
<%@page import="com.dao.MonitoringDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.CenterCommentVO"%>
<%@page import="com.model.CenterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Health Data Graph</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <style>
        form textarea{
            border-radius:0; 
            resize:none;
            color:black !important;
        }
        
        form div#reply{
            display:flex;
            margin-bottom:3%;
        }
        
        input[type='submit']:not(#register), input[type='button'] {border-radius:0;}
        
        ul.actions li {
            padding: 0 0 0 0.2em;
        }
        
        input#board_title{
            border-radius: 0;
            border: none;
            text-align: left;
            font-size: 1.75em;
            font-weight: 500;
            line-height: 1.5;
            letter-spacing: 0.1em;
            padding:0;
        }
        
        input[type='file']{
            display:none;
        }
        
        div.files{
            text-align:center;
            margin-right: 3%;
        }
        
        textarea {
            font-size: 1em;
                  font-weight: 600;
                  letter-spacing: 0.1em;
        }
        tr{
        	height: 100px;
        }
        td{
        	vertical-align: middle;
        }
        label{
        	margin-top: 21px !important;
        }
        p{
        	font-size: 1.5em;
        }
    </style>
</head>
<body class="is-preload">
	<%
		 UserVO mvo = (UserVO)session.getAttribute("loginVO");
		
		UserVO uvo = null;
		if (mvo!=null) {
			UserDAO udao = new UserDAO();
			uvo = udao.getOneList(mvo.getUser_id());
		} 
	%>
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <!-- Header -->
                <header id="header">
                    <a href="WithU.jsp" class="logo"><strong>Purchase Page</strong></a>
                    <ul class="icons">
                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                        <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                    </ul>
                </header>
                <!-- Banner -->
                <section id="banner">
                    <div class="content">
						<div id="page-wrapper">
							<!-- Wrapper -->
							<div class="wrapper">
							</div>
							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner" style="text-align: center;">
									<div id="container">
										<h2 style="margin-top:20px;font-size: 2.5em;">주문완료</h2>										
										<p style="font-size:1.6em;margin-bottom: 0.5em;"><%=uvo.getUser_id() %>님 주문이 완료되었습니다.</p>
										<p style="font-size:1.6em;margin-bottom: 0.5em;">아래 계좌 정보로 입금해 주시면</p>
										<p style="font-size:1.6em;">결제 완료처리가 됩니다.</p>
										
										<table style="width: 50%;margin:0 auto;font-size:1.1em">
											<tr>
												<td style="font-weight:bold;">주문번호</td>
												<td>20220315278</td>
											</tr>
											<tr>
												<td rowspan='2' style="font-weight:bold;">입금 계좌</td>
												<td>3333-06-3580310 카카오뱅크</td>
											</tr>
											<tr>
												<td>예금주 : 김소원</td>
											</tr>
											<tr>
												<td style="font-weight:bold;">주문 금액</td>
												<td style="color:red;">69,900원</td>
											</tr>
											<tr>
												<td style="font-weight:bold;">배송방법</td>
												<td>택배</td>
											</tr>
											<tr>
												<td style="font-weight:bold;">배송메모</td>
												<td>빠른배송부탁드립니다</td>
											</tr>
											<tr>
												<td colspan='2' style="font-size:1.2em;color:red;font-weight:bold;">24시간 내에 입금을 완료해주세요!</td>
											</tr>
										</table>
										<button id="clickBtn" style="margin-top:20px;font-size: 1.1em;">완료</button>
									</div>								

								</div>
							</div>
						</div>
					</div>
				</section>

                <!-- Section -->


            </div>
        </div>

        <!-- Sidebar -->
        <div id="sidebar" >
            <div class="inner">
                <!-- Menu -->
                <nav id="menu">
                    <header class="major">
                        <h2>Menu</h2>
                    </header>
                    <ul class="sidemenu">
						<li><a href="../main.jsp">Home</a></li>
						<li ><a href="WithU.jsp">WITH U</a></li>
						<li><a href="../HealthDataCon">Checks</a></li>
						<li><a href="NewsList.jsp">Healthy</a></li>
						<li><a href="CommunityList.jsp">Community</a></li>
						<li><a href="CenterList.jsp">Service</a></li>
					</ul>
                    <!-- Section -->
            </div>
        </div>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="https://kit.fontawesome.com/70d105e515.js" crossorigin="anonymous"></script>
    
    <!-- 구매하기 버튼 스크립트 -->
    <script>
    	let clickBtn = document.querySelector("#clickBtn");	
    
    	clickBtn.addEventListener("click", function(){ //  left='+ popupX + ', top='+ popupY
    		location.href ="../main.jsp";
    	});
    	
    	
    </script>
</body>
</html>