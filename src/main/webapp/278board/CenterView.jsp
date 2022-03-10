<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.CenterCommentVO"%>
<%@page import="com.model.CenterVO"%>
<%@page import="com.dao.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>CenterView</title>
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
		int num = Integer.parseInt(request.getParameter("num"));
		CenterDAO cdao = new CenterDAO();
		CenterVO cvo = cdao.getOneList(num);
		String writer = cvo.getUser_id();
		String title = cvo.getQ_title();
		String content = cvo.getQ_content();
		
		CenterCommentVO ccvo = cdao.getReply(num);
		
		UserVO mvo = (UserVO)session.getAttribute("loginVO");
		UserDAO udao = new UserDAO();
		UserVO uvo = null;
		if (mvo!=null) {
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
                    <a href="CenterList.jsp" class="logo"><strong>Service Center</strong></a>
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
                                                <% if (mvo!=null&&uvo.getUser_id().equals(writer)) { %>
												<li><input id ="update" type="button" value="����" onclick="location.href='${pageContext.request.contextPath}/278board/CenterWriteUp.jsp?num=<%=num%>'" /></li>
												<%} %>
                                                <li><input type="button" value="���" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CenterList.jsp'" /></li>
                                            </ul>
                                        </div>
                                        <header class="major">
                                            <h2 style="text-align: left;"><%= title%></h2>
                                            <p style="text-align: left; margin-bottom: 1%">�ۼ��� : <%= writer%></p>
                                        </header>
                                        <hr style="margin-top:0;">
                                            <div><%= content%></div>
                                        <hr/>
                                        <h3></h3>
                                    </section>
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2>�亯</h2>
											<% if (ccvo == null) { %>
												<p id="reply">�����ڰ� �� �亯�� �����Դϴ�.</p>
											<%} else { %>
												<p id="reply"><%=ccvo.getA_content()%> </p>
												<% if (mvo!=null&&uvo.getAdmin_yn().equals("Y")) {%>
													<input id="delete" type="button" class="primary" value="����" onclick="commentDelete()" />
												<%} %>						
											<%} %>
                                        </header>
                                        <% if (mvo!=null&&uvo.getAdmin_yn().equals("Y")) {%>
                                        <form method="post" action="#" class="combined"
										style="width: auto;">
										<textarea name="content" id="content" placeholder="�亯�� �ۼ����ּ���."
											class="invert" rows="5" style="border-radius: 0; resize: none;"></textarea>
										<input id="register" type="button" class="primary" value="���"
											onclick="comment()" />
										</form>
										<%} %>
                                    </section>

								</div>
							</div>
						</div>
					</div>
				</section>

                <!-- Section -->


            </div>
        </div>



    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
    function comment() {
    	let ta = document.querySelector('textarea') // ��� �ۼ�â
    	let replyDiv = document.querySelector('#reply') //��� ���â
    	
    	let data = {'num':<%=num%> , 'reply':ta.value};
    	let xhr = new XMLHttpRequest();
    	
    	//��û���, ��û���
    	xhr.open('post', '../CenterComment');
    	//���� �������� ����
    	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    	//��û & ������ ������
    	xhr.send(JSON.stringify(data));
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState===XMLHttpRequest.DONE) { //��û ����
    			if(xhr.status===200) { //���� ����
    				console.log("���� ����")
    				console.log(xhr.responseText) //���䵥���� Ȯ�� (XML�� ������ ��쿡�� responseXML)
    				if(xhr.responseText == "success") {
    					const reply = document.querySelector("#reply");
    					reply.innerText = ta.value;
    					ta.value = ''
    					location.reload();
    				}else {
    					alert("�亯 �ۼ��� �����Ͽ����ϴ�");
    					location.reload();
    				}
    			}else {
    				console.log("���� ����")
    			}
    		}else {
    			console.log("��û ����") //��û ����
    		}
    	}
    }

    function commentDelete() {
    	let data = {'num':<%=num%>};
    	let xhr = new XMLHttpRequest();
    	
    	//��û���, ��û���
    	xhr.open('post', '../DeleteCCCon');
    	//���� �������� ����
    	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    	//��û & ������ ������
    	xhr.send(JSON.stringify(data));
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState===XMLHttpRequest.DONE) { //��û ����
    			if(xhr.status===200) { //���� ����
    				console.log("���� ����")
    				console.log(xhr.responseText) //���䵥���� Ȯ�� (XML�� ������ ��쿡�� responseXML)
    				if(xhr.responseText == "success") {
    					location.reload();
    				}else {					
    					location.reload();
    				}
    			}else {
    				console.log("���� ����")
    			}
    		}else {
    			console.log("��û ����") //��û ����
    		}
    	}
    }
    </script>


</body>
</html>