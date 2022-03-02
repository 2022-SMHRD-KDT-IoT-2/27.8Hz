<%@page import="com.model.CommunityVO"%>
<%@page import="com.dao.CommunityDAO"%>
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
        
        p.content{
            width:63%;
        }
        
        p.writer{
            width:20%;
            font-weight:bold;
        }
    </style>
    </head>
    <body class="is-preload">
    
    
       <%
       //�Խù� ��ȣ ������Ʈ������ �Ѱ� �ް� �Խù� ��ȣ�� �ش��ϴ� ����, ����, ���̵� ������
       int num = Integer.parseInt(request.getParameter("num"));
       
       System.out.println("\nnum�� :"+num);
       
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = dao.getOne(num);
		
		
		UserVO vo2 = (UserVO)session.getAttribute("loginVO");
		
		if(!vo.getUser_id().equals(vo2.getUser_id())){
			dao.updateViews(num);
		}
		
		
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
                        <a href="#" class="image main"><img src="/images/boardView.png" alt="" /></a>
                        <div class="col-12">
                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                <li><input type="button" value="�۾���" class="primary"/></li>
                                <li><input type="button" value="���" class="primary"/></li>
                                    <li><input type="button" value="����" onclick="location.href='/board/BoardModify.bo?boardNum=${board.getBoardNum()}'"/></li>
                                    <li><input type="button" value="����" onclick="location.href='/board/BoardDeleteOk.bo?boardNum=${board.getBoardNum()}'"/></li>
                                
                            </ul>
                        </div>
                        <header class="major">
                        
                            <h2 style="text-align:left;"><%=vo.getArticle_title() %> </h2>
                            <p style="text-align:left; margin-bottom:1%">�ۼ��� :<%=vo.getUser_id() %> </p>
                        </header>
                        <hr style="margin-top:0;">
                            <div><%=vo.getArticle_content() %></div>
                        <hr/>
                        <h3></h3>
                    </section>
                    <section class="main accent2" style="padding:3%">
                        <header class="major" style="text-align:left;">
                            <h2>���</h2>
                            <p>�������� ������ ����� �ۼ����ּ���.</p>
                        </header>
                        <form method="post" action="#" class="combined" style="width:auto;">
                            <textarea name="content" id="content" placeholder="��Ӿ ������� �����ּ���." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                            <input id="register" type="button" class="primary" value="���" onclick="comment()"/>
                        </form>
                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
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
</html>