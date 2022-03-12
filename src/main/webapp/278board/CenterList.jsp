<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.CenterCommentVO"%>
<%@page import="com.model.CenterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CenterList</title>
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
		CenterDAO cdao = new CenterDAO();
		ArrayList<CenterVO> centerList = cdao.getList();
		System.out.print(centerList.size());
		
		UserVO mvo = (UserVO)session.getAttribute("loginVO");
		if (mvo!=null) {
		UserDAO udao = new UserDAO();
		UserVO uvo = udao.getOneList(mvo.getUser_id());
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


										<div class="table-wrapper">
											<div style="display:flex; justify-content:space-between;">
												<button style="border-radius:0;" onclick="location.href='${pageContext.request.contextPath}/278board/CenterWrite.jsp'">문의하기</button>
											</div>

											<table>
												<caption style="text-align:left; margin-bottom:3%;">

												</caption>
												<thead>
													<tr>
														<th>문의 번호</th>
														<th>문의</th>
														<th>작성자</th>
														<th>날짜</th>
														<th>답변 여부</th>
													</tr>
												</thead>
												<tbody>
													<%
														for (int i=0; i<centerList.size(); i++) {
															out.print("<tr><td>" + Math.abs(i-centerList.size()) + "</td>");
													  		out.print("<td><a href='CenterView.jsp?num=" + centerList.get(i).getQ_seq()+ "'>" + centerList.get(i).getQ_title() + "</a></td>");
													  		out.print("<td>" + centerList.get(i).getUser_id() + "</td>");
													  		out.print("<td>" + centerList.get(i).getQ_date() + "</td>");
													  		
													  		CenterCommentVO ccvo = cdao.getReply(centerList.get(i).getQ_seq());
													  		if (ccvo!=null) {								  			
													  		out.print("<td>답변 완료</td></tr>");
													  		} else {
													  		out.print("<td>답변 대기중</td></tr>");
													  		}
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


</body>
</html>