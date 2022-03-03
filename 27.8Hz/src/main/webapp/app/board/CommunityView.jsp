<%@page import="com.model.CommentVO"%>
<%@page import="java.util.ArrayList"%>
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
       //게시물 번호 쿼리스트링으로 넘겨 받고 게시물 번호에 해당하는 제목, 내용, 아이디 가져옴
       int num = Integer.parseInt(request.getParameter("num"));
       
       System.out.println("\nnum값 :"+num);
       
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = dao.getOne(num);
		
		ArrayList<CommentVO> al = dao.getReply(num);
		System.out.println(al.size());
		
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
                                <li><input type="button" value="글쓰기" class="primary"/></li>
                                <li><input type="button" value="목록" class="primary"/></li>
                                    <li><input type="button" value="수정" onclick="location.href='/board/BoardModify.bo?boardNum=${board.getBoardNum()}'"/></li>
                                    <li><input type="button" value="삭제" onclick="location.href='/board/BoardDeleteOk.bo?boardNum=${board.getBoardNum()}'"/></li>
                                
                            </ul>
                        </div>
                        <header class="major">
                        
                            <h2 style="text-align:left;"><%=vo.getArticle_title() %> </h2>
                            <p style="text-align:left; margin-bottom:1%">작성자 :<%=vo.getUser_id() %> </p>
                        </header>
                        <hr style="margin-top:0;">
                            <div><%=vo.getArticle_content() %></div>
                        <hr/>
                        <h3></h3>
                    </section>
                    <section class="main accent2" style="padding:3%">
                        <header class="major" style="text-align:left;">
                            <h2>댓글</h2>
                            <p>여러분의 소중한 댓글을 작성해주세요.</p>
                        </header>
                        <form method="post" action="#" class="combined" style="width:auto;">
                            <textarea name="content" id="content" placeholder="비속어를 사용하지 말아주세요." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                            <input id="register" type="button" class="primary" value="등록" onclick="comment()"/>
                        </form>
                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
                        	<ul class="list-group list-group-flush" id="reply">
				
								<%for(int i = al.size()-1;i >= 0;i--){%>
								<li class="list-group-item"><span><%=al.get(i).getComment_con() %> / <%=al.get(i).getUser_id() %></span></li>
								<%} %>
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
    
    function comment(){
		let ta = document.querySelector("textarea"); //댓글 작성창
		let replyDiv = document.querySelector("#reply"); //댓글 출력창
		
		//JSON({키 : 실제값}) 형식 데이터 만들기
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //요청방식 , 요청경로
        xhr.open('post', '../../CommentCon')
        
        //전송데이터의 형식
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        
        //요청 & 전송할 데이터
        xhr.send(JSON.stringify(data))
        
        xhr.onreadystatechange = function(){
           if(xhr.readyState===XMLHttpRequest.DONE){  //요청성공
              if(xhr.status===200){ //응답성공
                 console.log("응답성공")
                 console.log(xhr.responseText) //응답데이터 확인 (responseXML)
                 if(xhr.responseText === "success"){
                    //location.href = "board_list.jsp"
                    
                    let li = document.creatElement('li')
                    li.className = 'list-group-item' //li태그에 클래스 추가
                    let span = document.createElement('span')
                    span.innerText = ta.value + '/ <%=vo2.getUser_id()%>'
                    
                    li.appendChild(span) //li태그 자식요소로 span 태그 추가
                    
                    replyDiv.insertBefore(li, replyDiv.firstChild ) //replyDiv 첫 번째 자식으로 추가
                    
                    ta.value=''
                    
                 }else{
                    //check_p.innerText = '아이디/비밀번호를 확인해주세요'
                 }
              }else{
                 console.log("응답실패")
              }
           }else{  //요청실패
              console.log("요청실패")
           }
        }
	}
    
    </script>
</html>