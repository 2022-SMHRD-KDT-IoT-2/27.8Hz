<%@page import="com.model.UserVO"%>
<%@page import="com.model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
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
		UserVO vo = (UserVO)session.getAttribute("loginVO");
	%>
	
	
    <!-- Page Wrapper -->
    <div id="page-wrapper">
        <!-- Wrapper -->
        <div class="wrapper">
            <div class="inner">
                <jsp:include page="/app/fix/header.html"/>
            </div>
        </div>

        <!-- Wrapper -->
        <div class="wrapper">
            <div class="inner">

                <!-- Main -->
                <section class="main">

                    <header class="major">
                        <h1>자유 게시판</h1>
                        <p></p>
                    </header>

                    <div class="table-wrapper">
                        <div style="display:flex; justify-content:space-between;">
                            <span>글 개수 : <%=al.size() %> </span>
                            <%if(vo!=null) 
                            {
                            %>
                            <button style="border-radius:0;" onclick="location.href='${pageContext.request.contextPath}/app/board/CommunityWrite.jsp'">글쓰기</button>
                            <%
                            } 
                            %>
                        </div>

                        <table>
                            <caption style="text-align:left; margin-bottom:3%;">

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
									for(int i = al.size()-1;i >= 0;i--){
								%>
								<tr>
									<td><%=al.get(i).getArticle_seq()%></td> <!-- 글 번호 -->
									<td><a href="CommunityView.jsp?num=<%=al.get(i).getArticle_seq()%>"><%=al.get(i).getArticle_title() %></a></td> 	<!-- 게시물 -->
									<td><%=al.get(i).getUser_id() %></td>	<!-- 작성자 -->
									<td><%=al.get(i).getArticle_date() %></td>	<!-- 작성날짜 -->
									<td><%=al.get(i).getArticle_cnt() %></td>	<!-- 조회수 -->
									<!-- 좋아요 ajax -->
									<form id="like_form">
									
															
									<!--  <td> <input type="button" value="♥" onclick="goodCheck()"/> ${vo.good}</td>-->
							
									</form>


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
<script>
function goodCheck() {
    //var ans = confirm("별점을 주시겠습니가?");
    //if(!ans) {
    //    return false;
    //}
    var query = {idx : ${vo.idx}}
    
    $.ajax({
        url : "${contextPath}/bGood.bo",
        type: "get",
        data: query,
        success:function(data) {
            //alert("별점이 추가 되었습니다.");
            location.reload();
        }
    });
}


</script>
</html>