<%@page import="com.model.MonitoringVO"%>
<%@page import="com.dao.MonitoringDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@page import="com.model.CenterCommentVO"%>
<%@page import="com.model.CenterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Health Data Graph</title>
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
		
		MonitoringDAO dao = new MonitoringDAO();
    	ArrayList<MonitoringVO> al = dao.selectMonitoring("user_id01@naver.com");
    	al.get(0).getRegdate().substring(0, 10);
		
	%>
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <!-- Header -->
                <header id="header">
                    <a href="CenterList.jsp" class="logo"><strong>Health Data Graph</strong></a>
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
									<div style="width: 500px; height: 500px; display: inline-block;">
										<canvas id="myChart1" width="400" height="400"></canvas>
									</div>
									<div style="width: 500px; height: 500px; display: inline-block;">
										<canvas id="myChart2" width="400" height="400"></canvas>
									</div>
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
						<li ><a href="#">WITH U</a></li>
						<li><a href="#">Checks</a></li>
						<li><a href="#">Healthy</a></li>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
	    let ctx1 = document.getElementById('myChart1').getContext('2d');
	    let ctx2 = document.getElementById('myChart2').getContext('2d');
	    
	    let myChart1 = new Chart(ctx1, {
	      type: 'bar',
	      data: {
	        labels: [
	        	'<%=al.get(0).getRegdate().substring(5, 10) %>',
	            '<%=al.get(1).getRegdate().substring(5, 10) %>',
	            '<%=al.get(2).getRegdate().substring(5, 10) %>',
	            '<%=al.get(3).getRegdate().substring(5, 10) %>',
	            '<%=al.get(4).getRegdate().substring(5, 10) %>',
	            '<%=al.get(5).getRegdate().substring(5, 10) %>',
	            '<%=al.get(6).getRegdate().substring(5, 10) %>'
	        ],
	        datasets: [{
	          label: '심박수',
	          type: 'line',
	          data: [
				<%=al.get(0).getHeartrate() %>,
				<%=al.get(1).getHeartrate() %>,
				<%=al.get(2).getHeartrate() %>,
				<%=al.get(3).getHeartrate() %>,
				<%=al.get(4).getHeartrate() %>,
				<%=al.get(5).getHeartrate() %>,
				<%=al.get(6).getHeartrate() %>
				],
	          backgroundColor: 'rgba(255, 99, 132, 0)',
	          borderColor: 'rgba(255, 99, 132, 1)',
	          borderWidth: 3,
	            yAxesID : 'yLeft'
	        },{
	            label: '산소포화도',
	            type: 'line',
	            data: [
	            	<%=al.get(0).getO2() %>,
	            	<%=al.get(1).getO2() %>,
	            	<%=al.get(2).getO2() %>,
	            	<%=al.get(3).getO2() %>,
	            	<%=al.get(4).getO2() %>,
	            	<%=al.get(5).getO2() %>,
	            	<%=al.get(6).getO2() %>
	            ],
	            backgroundColor: 'rgba(54, 162, 235, 0)',
	            borderColor: 'rgba(54, 162, 235, 1)',
	            borderWidth: 3,
	            yAxesID : 'yLeft'
	          }]
	      },
	      options: {
	        scales : {
						yAxes: [{
	            id : 'yLeft',
	            position : 'left',
							ticks: {
								max: 140,
								min: 0,
								stepSize : 20,
								fontSize : 14,
							},
	            gridLines: { 
	              // grid line 설정
	              display: false, 
	              drawBorder: false,
	            },
				}
	        ],
			}
	      }
	    });
	    let myChart2 = new Chart(ctx2, {
	      type: 'bar',
	      data: {
	        labels: [
	        	'<%=al.get(0).getRegdate().substring(5, 10) %>',
	            '<%=al.get(1).getRegdate().substring(5, 10) %>',
	            '<%=al.get(2).getRegdate().substring(5, 10) %>',
	            '<%=al.get(3).getRegdate().substring(5, 10) %>',
	            '<%=al.get(4).getRegdate().substring(5, 10) %>',
	            '<%=al.get(5).getRegdate().substring(5, 10) %>',
	            '<%=al.get(6).getRegdate().substring(5, 10) %>'
	        ],
	        datasets: [{
	            label: '체온',
	            type: 'bar',
	            data: [
	            	<%=al.get(0).getTemp() %>,
	            	<%=al.get(1).getTemp() %>,
	            	<%=al.get(2).getTemp() %>,
	            	<%=al.get(3).getTemp() %>,
	            	<%=al.get(4).getTemp() %>,
	            	<%=al.get(5).getTemp() %>,
	            	<%=al.get(6).getTemp() %>
	            ],
	            backgroundColor: 'rgba(255, 159, 64, 1)',
	            borderColor: 'rgba(255, 159, 64, 1)',
	            borderWidth: 1,
	            yAxesID : 'yRight'
	        }]
	      },
	      options: {
	        scales : {
						yAxes: [
	          {
	            id : 'yRight',
	            position : 'left',
							ticks: {
								max: 39,
								min: 35,
								stepSize : 0.5,
								fontSize : 14,
							},
	            gridLines: { 
	              // grid line 설정
	              display: false, 
	              drawBorder: false,
	            },
	          }
	        ],
					}
	      }
	    });
	</script>


</body>
</html>