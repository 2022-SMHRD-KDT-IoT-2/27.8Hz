<%@page import="com.model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("EUC-KR"); %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�Խ���</title>
    <link rel="stylesheet" href="../../assets_board/css/main_board.css" />
    <style>
        table tbody tr {
            background-color: rgb(245 246 246 / 48%) !important;
        }
    </style>
</head>
<body class="is-preload">

<%
		CommunityDAO dao = new CommunityDAO();
		ArrayList<CommunityVO> al = dao.C_getList();
		System.out.print(al.size());
	%>
	
	
    <!-- Page Wrapper -->
    <div id="page-wrapper">
        <!-- Wrapper -->
        <div class="wrapper">
            <div class="inner">
                <jsp:include page="/app/fix/header.html" />
            </div>
        </div>

        <!-- Wrapper -->
        <div class="wrapper">
            <div class="inner">

                <!-- Main -->
                <section class="main">

                    <header class="major">
                        <h1>�Խ���</h1>
                        <p>���� �Խ���</p>
                    </header>

                    <div class="table-wrapper">
                        <div style="display:flex; justify-content:space-between;">
                            <span>�� ���� : </span>
                            <button style="border-radius:0;" onclick="location.href='${pageContext.request.contextPath}/app/board/CommunityWrite.jsp'">�۾���</button>
                        </div>

                        <table>
                            <caption style="text-align:left; margin-bottom:3%;">

                            </caption>
                            <thead>
                                <tr>
                                    <th>��ȣ</th>
                                    <th>����</th>
                                    <th>�ۼ���</th>
                                    <th>��¥</th>
                                    <th>��ȸ��</th>
                                </tr>
                            </thead>
                            <tbody>
                            
							                               <%
									for(int i = al.size()-1;i >= 0;i--){
								%>
								<tr>
									<td><%=al.get(i).getArticle_seq()%></td>
									<td><a href="boardView.jsp?num=<%=al.get(i).getArticle_seq()%>"></a></td>
									<td><%=al.get(i).getArticle_title()%></td>
									<td><%=al.get(i).getUser_id() %></td>
									<td><%=al.get(i).getArticle_date() %></td>
									<td><%=al.get(i).getArticle_cnt() %></td>
								</tr>
								
								<%
									}
								%>
                                
                            </tbody>
                        </table>

                        <table style="font-size:1.3rem">
                            <tr align="center" valign="middle">
                                <td>
                                    <a href="#">&lt;</a>
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                    <a href="#">&gt;</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>

            </div>
        </div>
    </div>
</body>

<!-- Scripts -->
<script src="../../assets_board/js/jquery.min.js"></script>
<script src="../../assets_board/js/browser.min.js"></script>
<script src="../../assets_board/js/breakpoints.min.js"></script>
<script src="../../assets_board/js/util.js"></script>
<script src="../../assets_board/js/main.js"></script>
</html>