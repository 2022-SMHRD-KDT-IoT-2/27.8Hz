<%@page import="com.model.UserVO"%>
<%@page import="com.model.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.CommunityVO"%>
<%@page import="com.dao.CommunityDAO"%>
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
    <title>게시글 보기</title>
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
       //게시물 번호 쿼리스트링으로 넘겨 받고 게시물 번호에 해당하는 제목, 내용, 아이디 가져옴
       int num = Integer.parseInt(request.getParameter("num"));
       
       System.out.println("\nnum값 :"+num);
       
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = dao.getOne(num);
		
		ArrayList<CommentVO> al = dao.getReply(num);
		System.out.println(al.size());
		
		UserVO vo2 = (UserVO)session.getAttribute("loginVO");
		
	
		 
	//비회원일때 수정,삭제, 댓글 못씀
	if(vo2==null){
		dao.updateViews(num);
	%>
	

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="CommunityList.jsp" class="logo"><strong>Community</strong></a>
                    <ul class="icons">
                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                        <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                    </ul>
                </header>

                <!-- Banner -->
                <%-- <section id="banner">
                    <div class="content">
						<div id="page-wrapper">
							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">
									<jsp:include page="/app/fix/header.jsp" />
								</div>
							</div> --%>

							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">

									<!-- Main -->
                                    <section class="main">
                                        
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                            <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li>
                                                <%-- <li><input type="button" value="글쓰기" class="primary"/></li>
                                                
                                                    <li><input type="button" value="수정" onclick="location.href='/board/BoardModify.bo?boardNum=${board.getBoardNum()}'"/></li>
                                                    <li><input type="button" value="삭제" onclick="location.href='/board/BoardDeleteOk.bo?boardNum=${board.getBoardNum()}'"/></li> --%>
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;">제목 <%=vo.getArticle_title() %></h2>
                                            <p style="text-align:left; margin-bottom:1%">작성자 : <%=vo.getUser_id() %> </p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%=vo.getArticle_content() %></div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                       
                                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
                                        <%for(int i = al.size()-1;i >= 0;i--){%>
										<pre><%=al.get(i).getUser_id()%></pre><span id="replyComment"><%=al.get(i).getComment_con()%>  </span><hr>
										<%} %>
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
                <!-- Menu -->
                <nav id="menu">
                    <header class="major">
                        <h2 >Menu</h2>
                    </header>
                    <ul>
                        <li><a href="../main.jsp">Home</a></li>
                        <li><a href="#">WITH U</a></li>
                        <li><a href="#">Checks</a></li>
                        <li><a href="#">Healthy</a></li>
                        <li><a href="CommunityList.jsp">Community</a></li>
                        <li><a href="CenterList.jsp">Service</a></li>
                    </ul>


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

</body>

<% //작성자랑 회원이랑 다를때 댓글만 가능 조회수업

	}else if(!vo.getUser_id().equals(vo2.getUser_id())){
				dao.updateViews(num);
		
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

                <!-- Banner -->
                <%-- <section id="banner">
                    <div class="content">
						<div id="page-wrapper">
							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">
									<jsp:include page="/app/fix/header.jsp" />
								</div>
							</div> --%>

							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">

									<!-- Main -->
                                    <section class="main">
                                        
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                                
                                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li>
                                                   
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;"><%=vo.getArticle_title() %> </h2>
                                            <p style="text-align:left; margin-bottom:1%">작성자 :<%=vo.getUser_id() %> </p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%=vo.getArticle_content() %>)</div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2 style=""></h2>
                                            <p>여러분의 소중한 댓글을 작성해주세요.</p>
                                        </header>
                                        <form method="post" action="#" class="combined" style="width:auto;">
                                            <textarea name="content" id="content" placeholder="인터넷은 우리가 함께 만들어나가는 소중한 공간입니다. 댓글 작성시 타인에 대한 배려와 책임을 담아주세요." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                                            <input id="register" type="button" class="primary" value="등록" onclick="comment()"style="margin-top:6px; border-radius: 0.375em;"/>
                                        </form>
                                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
                                        	<%for(int i = al.size()-1;i >= 0;i--){%>
											<pre><%=al.get(i).getUser_id()%></pre><span id="replyComment"><%=al.get(i).getComment_con()%>  </span><hr>
											<%} %>
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
    function comment(){
		let ta = document.querySelector("textarea"); //댓글 작성창
		let replyDiv = document.querySelector("#reply"); //댓글 출력창
		
		//JSON({키 : 실제값}) 형식 데이터 만들기
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //요청방식 , 요청경로
        xhr.open('post', '../CommentCon')
        
        //전송데이터의 형식
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        
        //요청 & 전송할 데이터
        xhr.send(JSON.stringify(data))
        
        xhr.onreadystatechange = function(){
           if(xhr.readyState===XMLHttpRequest.DONE){  //요청성공
              if(xhr.status===200){ //응답성공
                 console.log("응답성공")
                 console.log(xhr.responseText) //응답데이터 확인 (responseXML)
                 if(xhr.responseText === "success"){
                	const reply = document.querySelector("#reply");
 					reply.innerText = ta.value;
 					ta.value = ''
 					location.reload();
                 }else{
                	 alert("댓글 작성에 실패하였습니다.");
 					location.reload();
                 }
              }else{
                 console.log("응답실패")
              }
           }else{  //요청실패
              console.log("요청실패")
           }
        }
	}
    </script>

 <%} 
	//작성자랑 회원이랑 같을때 수정,삭제, 댓글 기능
	else{ %>
	
	<!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="CommunityList.jsp" class="logo"><strong>Community</strong></a>
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

									<!-- Main -->
                                    <section class="main">
                                        
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                                
                                                
                                               
                                               <li><input type="button" value="수정" onclick="location.href='CommunityModify.jsp?num=<%=num%>'"/></li>
                                               <li><input type="button" value="삭제" onclick="location.href='../CommunityDelete?num=<%=num%>'"/></li>   
                                               <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li> 
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;">제목 <%=vo.getArticle_title() %> </h2>
                                            <p style="text-align:left; margin-bottom:1%">작성자 :<%=vo.getUser_id() %> </p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%=vo.getArticle_content() %>)</div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2 style=""></h2>
                                            <p>여러분의 소중한 댓글을 작성해주세요.</p>
                                        </header>
                                        <form method="post" action="#" class="combined" style="width:auto;">
                                            <textarea name="content" id="content" placeholder="인터넷은 우리가 함께 만들어나가는 소중한 공간입니다. 댓글 작성시 타인에 대한 배려와 책임을 담아주세요." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                                            <input id="register" type="button" class="primary" value="등록" onclick="comment()"style="margin-top:6px; border-radius: 0.375em;"/>
                                        </form>
                                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
                                        	<%for(int i = al.size()-1;i >= 0;i--){%>
											<pre><%=al.get(i).getUser_id()%></pre><span id="replyComment"><%=al.get(i).getComment_con()%>  </span><hr>
											<%} %>
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
                <!-- Menu -->
                <nav id="menu">
                    <header class="major">
                        <h2 >Menu</h2>
                    </header>
                    <ul>
                        <li><a href="../main.jsp">Home</a></li>
                        <li><a href="#">WITH U</a></li>
                        <li><a href="#">Checks</a></li>
                        <li><a href="#">Healthy</a></li>
                        <li><a href="CommunityList.jsp">Community</a></li>
                        <li><a href="CenterList.jsp">Service</a></li>
                    </ul>
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
    function comment(){
		let ta = document.querySelector("textarea"); //댓글 작성창
		let replyDiv = document.querySelector("#reply"); //댓글 출력창
		
		//JSON({키 : 실제값}) 형식 데이터 만들기
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //요청방식 , 요청경로
        xhr.open('post', '../CommentCon')
        
        //전송데이터의 형식
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        
        //요청 & 전송할 데이터
        xhr.send(JSON.stringify(data))
        
        xhr.onreadystatechange = function(){
           if(xhr.readyState===XMLHttpRequest.DONE){  //요청성공
              if(xhr.status===200){ //응답성공
                 console.log("응답성공")
                 console.log(xhr.responseText) //응답데이터 확인 (responseXML)
                 if(xhr.responseText === "success"){
                    <%-- let li = document.creatElement('li')
                    li.className = 'list-group-item' //li태그에 클래스 추가
                    let span = document.createElement('span')
                    span.innerText = ta.value + '/ <%=vo2.getUser_id()%>'
                    li.appendChild(span) //li태그 자식요소로 span 태그 추가
                    replyDiv.insertBefore(li, replyDiv.firstChild ) //replyDiv 첫 번째 자식으로 추가
                    ta.value='' --%>
                    location.reload();
                 }else{
                    //check_p.innerText = '아이디/비밀번호를 확인해주세요'
                 }
              }else{
                 console.log("응답실패")
              }
           }else{  //요청실패
              console.log("요청실패")
           }
        }
	}
    </script>
	
	<%} %>

</html>