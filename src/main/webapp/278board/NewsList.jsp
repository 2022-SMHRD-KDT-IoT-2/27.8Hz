<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.NewsCommentVO"%>
<%@page import="com.model.NewsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>NewsList</title>
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
	NewsDAO dao = new NewsDAO();
	ArrayList<NewsVO> NewsList = dao.N_getList();
	System.out.print(NewsList.size());

	UserVO mvo = (UserVO) session.getAttribute("loginVO");

	UserVO uvo = null;
	if (mvo != null) {
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
					<a href="NewsList.jsp" class="logo"><strong>건강 뉴스
							게시판</strong></a>
				</header>
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<div id="page-wrapper">
							<!-- Wrapper -->
							<div class="wrapper"></div>
							<!-- Wrapper -->
							<div class="wrapper">
								<div class="inner">

									<!-- Main -->
									<section class="main">


										<div class="table-wrapper">
											<div style="display: flex; justify-content: space-between;">
												<%if (mvo != null && uvo.getAdmin_yn().equals("Y")) {%>
												<button style="border-radius: 0;"
													onclick="location.href='${pageContext.request.contextPath}/278board/NewsWrite.jsp'">글쓰기</button>
												<%} %>
											</div>

											<table>
												<caption style="text-align: left; margin-bottom: 3%;">

												</caption>
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>날짜</th>
														<th>조회수</th>
													</tr>
												</thead>
												<tbody>
													<%
													//게시글
													for (int i = NewsList.size()-1; i>=0; i--) {
														out.print("<tr><td>" + (i+1) + "</td>");
														out.print("<td><a href='NewsView.jsp?num=" + NewsList.get(i).getNews_seq() + "'>" + NewsList.get(i).getNews_title()
														+ " [" + dao.NewCommentCnt(NewsList.get(i).getNews_seq()) + "]</a></td>");
														out.print("<td>" + NewsList.get(i).getUser_id() + "</td>");
														out.print("<td>" + NewsList.get(i).getNews_date() + "</td>");
														out.print("<td>" + NewsList.get(i).getNews_cnt() + "</td>");
													}
													%>
												</tbody>
											</table>
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

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul class="sidemenu">
						<li><a href="../main.jsp">Home</a></li>
						<li><a href="#">WITH U</a></li>
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
</body>
</html>