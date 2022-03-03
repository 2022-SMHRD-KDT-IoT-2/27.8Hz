<%@page import="com.model.CommunityVO"%>
<%@page import="com.dao.CommunityDAO"%>
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
    		int num = Integer.parseInt(request.getParameter("num"));
    		System.out.println("\n����num�� : " + num);
    		CommunityDAO dao = new CommunityDAO();
    		CommunityVO vo = dao.getOne(num);
    		
    		
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
                                <li><input type="button" value="���" class="primary" onclick="location.href='${pageContext.request.contextPath}/app/board/CommunityList.jsp'"/></li>
                            </ul>
                        </div>
                        
                         <!--  enctype="multipart/form-data" -->
                         <!-- ��� ���ڸ� ���ڵ����� ������ �����. �� ����� <form> ��Ұ� �����̳� �̹����� ������ ������ �� �ַ� �����. -->
                         
                        <form action="${pageContext.request.contextPath}/CommunityModifyCon?num=<%=num%>" name="writeForm" method="post" enctype="application/x-www-form-urlencoded">
                            <header class="major">
                            
                                <p> <!--  ������ ���� -->
                                    <input id="boardTitle" name="boardTitle" type="text" value="<%=vo.getArticle_title()%>">
                                </p>
                                <p style="text-align:left; margin-bottom:1%; margin-top:-1.75em;">�ۼ��� : <%=vo.getUser_id()%></p>
                            </header>
                            <hr style="margin-top:0;">
                            
                            <!-- ���簪���� ���̵� ���� -->
 							<input type="hidden" name="userID" value="<%=vo.getUser_id()%>">
 					
 								    
                            <div style="margin-top:3%;">
                            
                            		<!--  �������� -->
                                <textarea name="boardContent" style="resize:none;" rows="20"><%=vo.getArticle_content()%></textarea>
                            </div>

                            <ul class="actions" style="display:flex; justify-content:center; margin-top:3%;">
                                <li><input type="button" value="�����ϱ�" class="primary" onclick="send()"/></li>
                                <li><input type="button" value="���" onclick="history.back()"/></li>
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
            if(!$("input#boardTitle").val()){
                alert("������ ������ �ۼ����ּ���.");
                return;
            }
            
            if(!$("textarea[name='boardContent']").val()){
                alert("������ ������ �ۼ����ּ���.");
                return;
            }
            
            document.writeForm.submit();
        }
    </script>
</html>