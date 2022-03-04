<%@page import="com.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
    <title>Editorial by HTML5 UP</title>
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
		UserVO vo = (UserVO)session.getAttribute("loginVO"); //세션가져옴
	%>
    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="index.html" class="logo"><strong>Community</strong></a>
                    <ul class="icons">
                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                        <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                    </ul>
                </header>
							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">

                                    <section class="main">
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li>
                                            </ul>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/CommunityWriteCon" name="writeForm" method="post" enctype="application/x-www-form-urlencoded">
                                            <header class="major">
                                                <p>
                                                    <input id="boardTitle" name="boardTitle" type="text" placeholder="제목 입력">
                                                </p>
                                                <p style="text-align:left; margin-bottom:1%; margin-top:-1.75em; margin-left: 10px;">작성자 :<%=vo.getUser_id() %></p>
                                            </header>
                                            <hr style="margin-top:0;">
                                            <input type="hidden" name="userID" value="<%=vo.getUser_id() %>">
                                            <div class="con_text" style="margin-top:3%;">
                                                <textarea name="boardContent" placeholder="내용 작성" style="resize:none;" rows="20"></textarea>
                                            </div>
                
                                            <ul class="actions" style="display:flex; justify-content:center; margin-top:3%;">
                                                <li><input type="button" value="글쓰기" class="primary" onclick="send()"/></li>
                                                <li><input type="button" value="취소" onclick="history.back()"/></li>
                                            </ul>
                                        </form>
                                    </section>

								</div>
							</div>
						</div>
					</div>
				</section>

                <!-- Section -->


            </div>
        </div>

        <!-- Sidebar -->
        <div id="sidebar">
            <div class="inner">

                <!-- Search -->
                <section id="search" class="alt">
                    <form method="post" action="#">
                        <input type="text" name="query" id="query" placeholder="Search" />
                    </form>
                </section>

                <!-- Menu -->
                <nav id="menu">
                    <header class="major">
                        <h2>Menu</h2>
                    </header>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">WITH U</a></li>
                        <li><a href="#">Checks</a></li>
                        <li><a href="#">Healthy</a></li>
                        <li><a href="#">Community</a></li>
                        <li><a href="#">Service</a></li>
                    </ul>
                    </section>

                    <!-- Section -->


                    <!-- Footer -->
                    <footer id="footer">
                        <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a
                                href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5
                                UP</a>.</p>
                    </footer>

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
            if(!$("input#boardTitle").val()){
                alert("제목을 작성해주세요.");
                return;
            }
            
            if(!$("textarea[name='boardContent']").val()){
                alert("내용을 작성해주세요.");
                return;
            }
            
            document.writeForm.submit();
        }
    </script>


</body>

</html>