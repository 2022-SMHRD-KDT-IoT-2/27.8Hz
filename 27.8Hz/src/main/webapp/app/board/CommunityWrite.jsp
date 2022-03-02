<%@page import="com.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../assets_board/css/main_board.css" />
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
		UserVO vo = (UserVO)session.getAttribute("loginVO"); //세션가져옴
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
                        <a href="#" class="image main"><img src="${pageContext.request.contextPath}/images/boardView.png" alt="" /></a>
                        <div class="col-12">
                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/app/board/CommunityList.jsp'"/></li>
                            </ul>
                        </div>
                        
                         <!--  enctype="multipart/form-data" -->
                         <!-- 모든 문자를 인코딩하지 않음을 명시함. 이 방식은 <form> 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용함. -->
                         
                         
                        <form action="../../boardWriteCon" id='writeForm' name="writeForm" method="post" enctype="application/x-www-form-urlencoded">
                            <header class="major">
                                <p>
                                    <input id="boardTitle" name="boardTitle" type="text" placeholder="제목 입력">
                                </p>
                                <p style="text-align:left; margin-bottom:1%; margin-top:-1.75em;">작성자 :  <%=vo.getUser_id() %></p>
 								
 								<!-- 히든값으로 아이디 전달 -->
 								<input type="hidden" name="userID" value="<%=vo.getUser_id() %>">    
 								                        
                            </header>
                            <hr style="margin-top:0;">
                            
                            <div style="margin-top:3%;">
                                <textarea id="boardContent" name="boardContent" placeholder="내용 작성" style="resize:none;" rows="20"></textarea>
                            </div>

                            <ul class="actions" style="display:flex; justify-content:center; margin-top:3%;">
                                <li><input type="button" value="글쓰기" class="primary" onclick="send()"/></li>
                                <li><input type="button" value="취소" onclick="history.back()"/></li>
                            </ul>
                        </form>
                        
                    </section>
                </div>
            </div>
        </div>
    </body>
    <script src="../../assets_board/js/jquery.min.js"></script>
    <script src="../../assets_board/js/browser.min.js"></script>
    <script src="../../assets_board/js/breakpoints.min.js"></script>
    <script src="../../assets_board/js/util.js"></script>
    <script src="../../assets_board/js/main.js"></script>
    
    <script>
        function send(){
        	
            if(document.getElementById("boardTitle").value == ""){
                alert("제목을 작성해주세요.");
                return;
            }
            
            else if(document.getElementById("boardContent").value == ""){
                alert("내용을 작성해주세요.");
                return;
            }
            
            
            else{
            document.getElementById('writeForm').submit();
            }
        }
    </script>
</html>