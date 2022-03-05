<%@page import="com.model.MonitoringVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.MonitoringDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%
    	MonitoringDAO dao = new MonitoringDAO();
    	ArrayList<MonitoringVO> al = dao.selectMonitoring("heon");
    	al.get(0).getRegdate().substring(0, 10);
    	
    %>
    
    <div style="width: 900px; height: 900px;">
        <!--차트가 그려질 부분-->
        <canvas id="myChart"></canvas>
    </div>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

    <script type="text/javascript">
        var context = document
            .getElementById('myChart')
            .getContext('2d');
        var myChart = new Chart(context, {
            type: 'line', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '<%=al.get(0).getRegdate().substring(5, 10) %>',
                    '<%=al.get(1).getRegdate().substring(5, 10) %>',
                    '<%=al.get(2).getRegdate().substring(5, 10) %>',
                    '<%=al.get(3).getRegdate().substring(5, 10) %>',
                    '<%=al.get(4).getRegdate().substring(5, 10) %>',
                    '<%=al.get(5).getRegdate().substring(5, 10) %>',
                    '<%=al.get(6).getRegdate().substring(5, 10) %>'
                ],
                datasets: [
                    { //데이터
                        label: '심박수', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [ //x축 label에 대응되는 데이터 값
                        	<%=al.get(0).getHeartrate() %>,
                        	<%=al.get(1).getHeartrate() %>,
                        	<%=al.get(2).getHeartrate() %>,
                        	<%=al.get(3).getHeartrate() %>,
                        	<%=al.get(4).getHeartrate() %>,
                        	<%=al.get(5).getHeartrate() %>,
                        	<%=al.get(6).getHeartrate() %>
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        //borderWidth: 1 //경계선 굵기
                    } ,
                    {
                        label: '산소포화도',
                        fill: false,
                        data: [
                        	<%=al.get(0).getO2() %>,
                        	<%=al.get(1).getO2() %>,
                        	<%=al.get(2).getO2() %>,
                        	<%=al.get(3).getO2() %>,
                        	<%=al.get(4).getO2() %>,
                        	<%=al.get(5).getO2() %>,
                        	<%=al.get(6).getO2() %>
                        ],
                        backgroundColor: 'rgba(54, 162, 235, 1)',
                        borderColor: 'rgba(54, 162, 235, 1)'
                    },
                    {
                        label: '체온',
                        fill: false,
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
                        borderColor: 'rgba(255, 159, 64, 1)'
                    }
                ]
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
    </script>

</body>
</html>