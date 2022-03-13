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
								<form style="width:60%; margin:0 auto;">
									<table>
										<tr>
											<td>이름</td>
											<td><input type="text" id="name"></td>
										</tr>
										<tr>
											<td>연락처</td>
											<td><input type="text" id="phone"></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" id="addr"></td>
										</tr>
										<tr>
											<td>결제방법</td>
											<td>
												<input type="radio" id="purchase" value="money" checked>
												<label for="money">무통장입금</label>
											</td>
										</tr>
										<tr>
											<td>음성선택</td>
											<td>
												<input type="radio" id="girl" name="voice_ck" value="girl" checked>
												<label for="girl">여자아이</label>
												<input type="radio" id="boy" name="voice_ck" value="boy" >
												<label for="boy">남자아이</label>
												<input type="radio" id="woman" name="voice_ck" value="woman" >
												<label for="woman">여자노인</label>
												<input type="radio" id="man" name="voice_ck" value="man">
												<label for="man">남자노인</label>
											</td>
										</tr>
										<tr>
											<td>수량선택</td>
											<td>
												<input type="number" id="num" name="num" value="1" style="padding:3px;">
											</td>
										</tr>
										<tr>
											<td>배송방법</td>
											<td>
											
												<input type="radio" id="girl" name="ck" value="x" checked>
												<label for="ck">택배</label>
												<input type="radio" id="boy" name="ck" value="y" >
												<label for="ck">방문수령</label>
											
											</td>
										</tr>
										<tr>
											<td>배송메모</td>
											<td><input type="text"></td>
										</tr>
									</table>
								</form>
								<button id="purchaseBtn" style="line-height: 1.5em;display: block;margin: 0 auto;font-size: 1.5em;margin-top: 30px;
								">구매하기</button>
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
    	let purchaseBtn = document.querySelector("#purchaseBtn");
    	let name = document.querySelector("#name");
    	let phone = document.querySelector("#phone");
    	let addr = document.querySelector("#addr");
    	let pur_btn = document.querySelector("#pur_btn");
    	
    	
    	name.value = "<%=uvo.getUser_name() %>";
    	phone.value = "<%=uvo.getUser_phone() %>";
    	addr.value = "<%=uvo.getUser_addr() %>";
    	
    	purchaseBtn.addEventListener("click", function(){ //  left='+ popupX + ', top='+ popupY
    		location.href ="./WithU_Purchase2.jsp";
    	});
    		
    	/* pur_btn.addEventListener("click", function(){
    		pur_btn.setAttribute('href','./WithU_Purchase2.jsp';);
    	}); */
    	
    </script>
</body>
</html>