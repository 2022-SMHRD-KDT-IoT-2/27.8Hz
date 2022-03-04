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
    <title>�Խñ� ����</title>
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
       //�Խù� ��ȣ ������Ʈ������ �Ѱ� �ް� �Խù� ��ȣ�� �ش��ϴ� ����, ����, ���̵� ������
       int num = Integer.parseInt(request.getParameter("num"));
       
       System.out.println("\nnum�� :"+num);
       
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = dao.getOne(num);
		
		ArrayList<CommentVO> al = dao.getReply(num);
		System.out.println(al.size());
		
		UserVO vo2 = (UserVO)session.getAttribute("loginVO");
		
	
		 
	//��ȸ���϶� ����,����, ��� ����
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
                                            <li><input type="button" value="���" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li>
                                                <%-- <li><input type="button" value="�۾���" class="primary"/></li>
                                                
                                                    <li><input type="button" value="����" onclick="location.href='/board/BoardModify.bo?boardNum=${board.getBoardNum()}'"/></li>
                                                    <li><input type="button" value="����" onclick="location.href='/board/BoardDeleteOk.bo?boardNum=${board.getBoardNum()}'"/></li> --%>
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;">���� <%=vo.getArticle_title() %></h2>
                                            <p style="text-align:left; margin-bottom:1%">�ۼ��� : <%=vo.getUser_id() %> </p>
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

<% //�ۼ��ڶ� ȸ���̶� �ٸ��� ��۸� ���� ��ȸ����

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
                                                
                                                <li><input type="button" value="���" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li>
                                                   
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;"><%=vo.getArticle_title() %> </h2>
                                            <p style="text-align:left; margin-bottom:1%">�ۼ��� :<%=vo.getUser_id() %> </p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%=vo.getArticle_content() %>)</div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2 style=""></h2>
                                            <p>�������� ������ ����� �ۼ����ּ���.</p>
                                        </header>
                                        <form method="post" action="#" class="combined" style="width:auto;">
                                            <textarea name="content" id="content" placeholder="���ͳ��� �츮�� �Բ� �������� ������ �����Դϴ�. ��� �ۼ��� Ÿ�ο� ���� ����� å���� ����ּ���." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                                            <input id="register" type="button" class="primary" value="���" onclick="comment()"style="margin-top:6px; border-radius: 0.375em;"/>
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
		let ta = document.querySelector("textarea"); //��� �ۼ�â
		let replyDiv = document.querySelector("#reply"); //��� ���â
		
		//JSON({Ű : ������}) ���� ������ �����
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //��û��� , ��û���
        xhr.open('post', '../CommentCon')
        
        //���۵������� ����
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        
        //��û & ������ ������
        xhr.send(JSON.stringify(data))
        
        xhr.onreadystatechange = function(){
           if(xhr.readyState===XMLHttpRequest.DONE){  //��û����
              if(xhr.status===200){ //���伺��
                 console.log("���伺��")
                 console.log(xhr.responseText) //���䵥���� Ȯ�� (responseXML)
                 if(xhr.responseText === "success"){
                	const reply = document.querySelector("#reply");
 					reply.innerText = ta.value;
 					ta.value = ''
 					location.reload();
                 }else{
                	 alert("��� �ۼ��� �����Ͽ����ϴ�.");
 					location.reload();
                 }
              }else{
                 console.log("�������")
              }
           }else{  //��û����
              console.log("��û����")
           }
        }
	}
    </script>

 <%} 
	//�ۼ��ڶ� ȸ���̶� ������ ����,����, ��� ���
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
                                                
                                                
                                               
                                               <li><input type="button" value="����" onclick="location.href='CommunityModify.jsp?num=<%=num%>'"/></li>
                                               <li><input type="button" value="����" onclick="location.href='../CommunityDelete?num=<%=num%>'"/></li>   
                                               <li><input type="button" value="���" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li> 
                                                
                                            </ul>
                                        </div>
                                        <header class="major">
                                        
                                            <h2 style="text-align:left;">���� <%=vo.getArticle_title() %> </h2>
                                            <p style="text-align:left; margin-bottom:1%">�ۼ��� :<%=vo.getUser_id() %> </p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%=vo.getArticle_content() %>)</div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2 style=""></h2>
                                            <p>�������� ������ ����� �ۼ����ּ���.</p>
                                        </header>
                                        <form method="post" action="#" class="combined" style="width:auto;">
                                            <textarea name="content" id="content" placeholder="���ͳ��� �츮�� �Բ� �������� ������ �����Դϴ�. ��� �ۼ��� Ÿ�ο� ���� ����� å���� ����ּ���." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                                            <input id="register" type="button" class="primary" value="���" onclick="comment()"style="margin-top:6px; border-radius: 0.375em;"/>
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
		let ta = document.querySelector("textarea"); //��� �ۼ�â
		let replyDiv = document.querySelector("#reply"); //��� ���â
		
		//JSON({Ű : ������}) ���� ������ �����
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //��û��� , ��û���
        xhr.open('post', '../CommentCon')
        
        //���۵������� ����
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        
        //��û & ������ ������
        xhr.send(JSON.stringify(data))
        
        xhr.onreadystatechange = function(){
           if(xhr.readyState===XMLHttpRequest.DONE){  //��û����
              if(xhr.status===200){ //���伺��
                 console.log("���伺��")
                 console.log(xhr.responseText) //���䵥���� Ȯ�� (responseXML)
                 if(xhr.responseText === "success"){
                    <%-- let li = document.creatElement('li')
                    li.className = 'list-group-item' //li�±׿� Ŭ���� �߰�
                    let span = document.createElement('span')
                    span.innerText = ta.value + '/ <%=vo2.getUser_id()%>'
                    li.appendChild(span) //li�±� �ڽĿ�ҷ� span �±� �߰�
                    replyDiv.insertBefore(li, replyDiv.firstChild ) //replyDiv ù ��° �ڽ����� �߰�
                    ta.value='' --%>
                    location.reload();
                 }else{
                    //check_p.innerText = '���̵�/��й�ȣ�� Ȯ�����ּ���'
                 }
              }else{
                 console.log("�������")
              }
           }else{  //��û����
              console.log("��û����")
           }
        }
	}
    </script>
	
	<%} %>

</html>