<%@page import="com.dao.AdminDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>customer management</title>
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
	AdminDAO dao = new AdminDAO();
	ArrayList<UserVO> al = dao.getUser_List();

	System.out.print(al.size());
	UserVO vo = (UserVO) session.getAttribute("loginVO");
	%>


	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="CommunityList.jsp" class="logo"><strong>Customer
							Management</strong></a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span
								class="label">Medium</span></a></li>

					</ul>
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
												<span>ȸ�� �� : <%=al.size()%></span>

											</div>

											<table>
												<caption style="text-align: left; margin-bottom: 3%;">

												</caption>
												<thead>
													<tr>
														<th></th>
														<th>Id</th>
														<th>Pw</th>
														<th>�̸�</th>
														<th>����ó</th>
														<th>�ڵ�����ȣ</th>
														<th>�ּ�</th>
														<th>��ȣ�ڿ���ó</th>
														<th>���Գ�¥</th>
														<th>����</th>
													</tr>
												</thead>
												<tbody>

													<%
													for (int i = al.size() - 1; i >= 0; i--) {
													%>

													<tr>
														<td><%=al.size() - i%></td>
														<td><%=al.get(i).getUser_id()%></td>
														<td><%=al.get(i).getUser_pw()%></td>
														<td><%=al.get(i).getUser_name()%></td>
														<td><%=al.get(i).getUser_phone()%></td>
														<td><%=al.get(i).getUser_carnum()%></td>
														<td><%=al.get(i).getUser_addr()%></td>
														<td><%=al.get(i).getGuardian_phone()%></td>
														<td><%=al.get(i).getUser_joindate()%>
														<%
															if (vo != null) {
 														%>
 														<td><input type="button" id="DeleteButton" style="float: right" value="����" onclick="CommentDelete('<%=al.get(i).getUser_id()%>')" /><br>
														<%
															}
														%>
													</tr>
													<%
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
						<li><a href="../WithU.jsp">WITH U</a></li>
						<li><a href="HealthDataCon">Checks</a></li>
						<li><a href="NewsList.jsp">Healthy</a></li>
						<li><a href="CommunityList.jsp">Community</a></li>
						<li><a href="CenterList.jsp">Service</a></li>
					</ul>
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
		function CommentDelete(ID) {
			
			let data = {
				'ID' : ID
			};
			let xhr = new XMLHttpRequest();

			//��û���, ��û���
			xhr.open('post', '../AdminDeleteCon.do');
			//���� �������� ����
			xhr.setRequestHeader('Content-Type',
					'application/json;charset=UTF-8');
			//��û & ������ ������
			xhr.send(JSON.stringify(data));

			xhr.onreadystatechange = function() {
				console.log(xhr.readyState)
				console.log(xhr.status)
				if (xhr.readyState === XMLHttpRequest.DONE) { //��û ����					
					if (xhr.status === 200) { //���� ����
						console.log("���� ����")
						console.log(xhr.responseText) //���䵥���� Ȯ�� (XML�� ������ ��쿡�� responseXML)
						location.reload();
					} else {
						console.log("���� ����")
					}
				} else {
					console.log("��û ����") //��û ����
				}
			}
		}
	</script>
	<script src="https://kit.fontawesome.com/70d105e515.js" crossorigin="anonymous"></script>

</body>

</html>