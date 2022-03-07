<%@page import="com.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>NewsWrite</title>
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
	UserVO mvo = (UserVO) session.getAttribute("loginVO");
	String writer = null;
	if (mvo != null) {
		writer = mvo.getUser_id();
	}
	%>

	<script>
		
	<%if (mvo == null) {%>
		alert("로그인 후 이용하세요.")
		location.href = "NewsList.jsp"
	<%}%>
		
	</script>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="NewsList.jsp" class="logo"><strong>건강 뉴스 게시판</strong></a>
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

									<section class="main">
										<div class="col-12">
											<ul class="actions"
												style="display: flex; justify-content: flex-end;">
												<li><input type="button" value="목록" class="primary"
													onclick="location.href='${pageContext.request.contextPath}/278board/NewsList.jsp'" /></li>
											</ul>
										</div>
										<form action="../NewsWriteCon" id="writeForm" name="writeForm" method="post">
											<header class="major">
												<p>
													<input id="NewsTitle" name="NewsTitle" type="text"
														placeholder="제목 작성" id="NewsTitle">
												</p>
												<p
													style="text-align: left; margin-bottom: 1%; margin-top: -1.75em;">
													작성자 :<%=writer%></p>
											</header>
											<hr style="margin-top: 0;">
											<div style="margin-top: 3%;">
												<textarea name="NewsContent" placeholder="본문 작성"
													style="resize: none;" rows="20" id="NewsContent"></textarea>
											</div>

											<ul class="actions"
												style="display: flex; justify-content: center; margin-top: 3%;">
												<li><input type="button" value="글쓰기" class="primary"
													onclick="send()" /></li>
												<li><input type="button" value="취소"
													onclick="history.back()" /></li>
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
		function send() {
			if (document.getElementById("NewsTitle").value == "") {
				alert("제목을 작성해주세요.");
				return;
			} else if (document.getElementById("NewsContent").value == "") {
				alert("내용을 작성해주세요.");
				return;
			} else {
				document.getElementById('writeForm').submit();
			}
		}
	</script>
</body>
</html>