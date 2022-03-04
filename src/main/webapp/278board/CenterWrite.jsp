<%@page import="com.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>CenterWrite</title>
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
    </style>
</head>
<body class="is-preload">
	<%
	UserVO mvo = (UserVO) session.getAttribute("loginVO");
	String writer = mvo.getUser_id();
	%>
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <!-- Header -->
                <header id="header">
                    <a href="CenterList.jsp" class="logo"><strong>Community</strong></a>
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
								<div class="inner">

                                    <section class="main">
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CenterList.jsp'" /></li>
                                            </ul>
                                        </div>
                                        <form
											action="../CenterWriteCon" id="writeForm" 
											name="writeForm"  method="post" enctype="application/x-www-form-urlencoded">
											<header class="major">
												<p>
													<input id="centerTitle" name="centerTitle" type="text"
														placeholder="문의 제목" id="centerTitle">
												</p>
												<p
													style="text-align: left; margin-bottom: 1%; margin-top: -1.75em;">
													작성자 :
													<%=writer%></p>
											</header>
											<hr style="margin-top: 0;">
					
											<div style="margin-top: 3%;">
												<textarea name="centerContent" placeholder="문의 내용"
													style="resize: none;" rows="20" id="centerContent"></textarea>
											</div>
					
											<ul class="actions"
												style="display: flex; justify-content: center; margin-top: 3%;">
												<li><input type="button" value="글쓰기" class="primary"
													onclick="send()" /></li>
												<li><input type="button" value="취소" onclick="history.back()" /></li>
											</ul>
										</form>
                                    </section>

								</div>
							</div>
						</div>
					</div>
				</section>
            </div>
        </div>
</div>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
    function send(){
        if(document.getElementById("centerTitle").value == ""){
            alert("제목을 작성해주세요.");
            return;
        } else if(document.getElementById("centerContent").value == ""){
            alert("내용을 작성해주세요.");
            return;
        } else{
        	document.getElementById('writeForm').submit();
        }
    }
    </script>
</body>
</html>