<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.NewsCommentVO"%>
<%@page import="com.model.NewsVO"%>
<%@page import="com.dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>NewsView</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
form textarea {
	border-radius: 0;
	resize: none;
	color: black !important;
}

form div#reply {
	display: flex;
	margin-bottom: 3%;
}

input[type='submit']:not(#register), input[type='button'] {
	border-radius: 0;
}

ul.actions li {
	padding: 0 0 0 0.2em;
}

input#board_title {
	border-radius: 0;
	border: none;
	text-align: left;
	font-size: 1.75em;
	font-weight: 500;
	line-height: 1.5;
	letter-spacing: 0.1em;
	padding: 0;
}

input[type='file'] {
	display: none;
}

div.files {
	text-align: center;
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
	NewsDAO ndao = new NewsDAO();
	NewsVO nvo = ndao.getOne(num);

	String writer = nvo.getUser_id();
	String title = nvo.getNews_title();
	String content = nvo.getNews_content();

	ArrayList<NewsCommentVO> ncvo = ndao.getReply(num);

	UserVO mvo = (UserVO) session.getAttribute("loginVO");
	UserDAO udao = new UserDAO();
	UserVO uvo = null;
	if (mvo != null) {
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
					<a href="NewsList.jsp" class="logo"><strong>�ǰ� ���� �Խ���</strong></a>
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
											<ul class="actions"
												style="display: flex; justify-content: flex-end;">
												<%
												if (mvo != null && (uvo.getUser_id().equals(writer) || uvo.getAdmin_yn().equals("Y"))) {
												%>
												<li><input id="update" type="button" value="����"
													onclick="location.href='${pageContext.request.contextPath}/278board/NewsModify.jsp?num=<%=num%>'" /></li>
												<li><input type="button" value="����"
													onclick="location.href='../NewsDeleteCon.do?num=<%=num%>'" /></li>
												<%
												}
												%>
												<li><input type="button" value="���" class="primary"
													onclick="location.href='${pageContext.request.contextPath}/278board/NewsList.jsp'" /></li>
											</ul>
										</div>
										<header class="major">
											<h2 style="text-align: left;"><%=title%></h2>
											<p style="text-align: left; margin-bottom: 1%">
												�ۼ��� :<%=writer%></p>
										</header>
										<hr style="margin-top: 0;">
										<div><%=content%></div>
										<hr />
										<h3></h3>
									</section>

									<section class="main_accent2">
										<header class="major" style="text-align: left;">
											<h2 style=""></h2>
											<p>�������� ������ ����� �ۼ����ּ���.</p>
										</header>
								
										<%if (mvo != null) {%>
											<%if (nvo.getUser_id().equals(mvo.getUser_id()) || !nvo.getUser_id().equals(mvo.getUser_id())) {%>
										<form method="post" action="#" class="combined"
											style="width: auto;">
											<textarea name="content" id="content"
												placeholder="���ͳ��� �츮�� �Բ� �������� ������ �����Դϴ�. ��� �ۼ��� Ÿ�ο� ���� ����� å���� ����ּ���."
												class="invert" rows="5"
												style="border-radius: 0; resize: none;"></textarea>
											<input id="register" type="button" class="primary" value="���"
												onclick="comment()"
												style="margin-top: 6px; border-radius: 0.375em;" />
										</form>
										<%
											}
										}
										%>

										<form id="replies" class="combined"
											style="flex-direction: column; margin: 0; display: contents;">

											<%for (int i = ncvo.size() - 1; i >= 0; i--) {%>
												<!--  �̸���  															�ۼ���¥ -->
												<%=ncvo.get(i).getUser_id()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=ncvo.get(i).getNc_date()%>

												<!-- 								���� -->
												<br>
												<span id="replyComment"><%=ncvo.get(i).getNc_content()%>&nbsp</span>
												<%if (mvo != null) {%>
													<%if (ncvo.get(i).getUser_id().equals(mvo.getUser_id())) {%>
														<input type="hidden" name="News_Seq"
														value="<%=ncvo.get(i).getNc_seq()%>" /> <input type="button"
														id="DeleteButton" style="float: right" value="����"
														onclick="NewsCommentDelete('<%=ncvo.get(i).getNc_date()%>', '<%=ncvo.get(i).getUser_id()%>')" /><br>

													<%}%>
												<%}%><hr>
											<%}%>
										</form>
									</div>
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

			let data = {
				'boardnum' : <%=num%>
		,
				'reply' : ta.value
			};
			let xhr = new XMLHttpRequest();

			//��û���, ��û���
			xhr.open('post', '../NewsCommentCon.do');

			//���� �������� ����
			xhr.setRequestHeader('Content-Type',
					'application/json; charset=UTF-8');

			//��û & ������ ������
			xhr.send(JSON.stringify(data));

			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) { //��û����
					if (xhr.status === 200) { //���伺��
						console.log("���伺��")
						console.log(xhr.responseText) //���䵥���� Ȯ�� (responseXML)
						if (xhr.responseText === "success") {
							location.reload();
						} else {
							alert("��� �ۼ��� �����Ͽ����ϴ�.");
							location.reload();
						}
					} else {
						console.log("�������")
					}
				} else { //��û����
					console.log("��û����")
				}
			}
		}

		function NewsCommentDelete(date, ID) {
			let data = {'date': date, 'ID': ID};
			let xhr = new XMLHttpRequest();

			//��û���, ��û���
			xhr.open('post', '../NewsCommentDeleteCon.do');
			//���� �������� ����
			xhr.setRequestHeader('Content-Type',
					'application/json;charset=UTF-8');
			//��û & ������ ������
			xhr.send(JSON.stringify(data));

			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) { //��û ����
					if (xhr.status === 200) { //���� ����
						console.log("���� ����")
						console.log(xhr.responseText) //���䵥���� Ȯ�� (XML�� ������ ��쿡�� responseXML)
						if (xhr.responseText == "success") {
							location.reload();
						} else {
							location.reload();
						}
					} else {
						console.log("���� ����")
					}
				} else {
					console.log("��û ����") //��û ����
				}
			}
		}
	</script>
</body>
</html>