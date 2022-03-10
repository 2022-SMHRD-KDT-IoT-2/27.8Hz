<%@page import="com.model.UserVO"%>
<%@page import="com.model.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.CommunityVO"%>
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
    <title>게시글 보기</title>
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
       //게시물 번호 쿼리스트링으로 넘겨 받고 게시물 번호에 해당하는 제목, 내용, 아이디 가져옴
       int num = Integer.parseInt(request.getParameter("num"));
       
       System.out.println("\nnum값 :"+num);
       
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = dao.getOne(num);
		
		ArrayList<CommentVO> al = dao.getReply(num);
		System.out.println(al.size());
		
		UserVO vo2 = (UserVO)session.getAttribute("loginVO");
		
	if(vo2==null || !vo.getUser_id().equals(vo2.getUser_id())){
		dao.updateViews(num);
	}
	%>
	

  <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="CommunityList.jsp" class="logo"><strong>Community</strong></a>
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
                                        
                                        <div class="col-12">
                                            <ul class="actions" style="display:flex; justify-content:flex-end;">
                                                
                                                <%if(vo2!=null){ %>
                                               <%if(vo.getUser_id().equals(vo2.getUser_id()) ){ %>
                                               <li><input type="button" value="수정" onclick="location.href='CommunityModify.jsp?num=<%=num%>'"/></li>
                                               <li><input type="button" value="삭제" onclick="location.href='../CommunityDelete?num=<%=num%>'"/></li>   
                                               <%} }%>
                                               <li><input type="button" value="목록" class="primary" onclick="location.href='${pageContext.request.contextPath}/278board/CommunityList.jsp'"/></li> 
                                                
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
                                    <section class="main_accent2">
                                        <header class="major" style="text-align:left;">
                                            <h2 style=""></h2>
                                            <p>여러분의 소중한 댓글을 작성해주세요.</p>
                                        </header>
                                        
                                        
                                        <%if(vo2!=null){ %>
                                        <%if(vo.getUser_id().equals(vo2.getUser_id()) ||!vo.getUser_id().equals(vo2.getUser_id())) { %>
                                        <form method="post" action="#" class="combined" style="width:auto;">
                                            <textarea name="content" id="content" placeholder="인터넷은 우리가 함께 만들어나가는 소중한 공간입니다. 댓글 작성시 타인에 대한 배려와 책임을 담아주세요." class="invert" rows="5" style="border-radius:0; resize:none;"></textarea>
                                            <input id="register" type="button" class="primary" value="등록" onclick="comment()"style="margin-top:6px; border-radius: 0.375em;"/>
                                        </form>
                                        <%} 
                                        }%>
                                        
                                        
                                        <form id="replies" class="combined" style="flex-direction:column; margin:0; display:contents;">
                                        
                                        	<%for(int i = 0;i < al.size();i++){%>
                                        	
                                        	<!--  이메일  															작성날짜 -->
											<%=al.get(i).getUser_id()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=al.get(i).getComment_date()%>
											
											<!-- 								내용 -->
											<br><span id="replyComment"><%=al.get(i).getComment_con()%>&nbsp</span>
											
											<%if(vo2!=null){ %>
											
											<%if(al.get(i).getUser_id().equals(vo2.getUser_id())){ %>
											
											
											<input type="hidden" name="Comment_Seq" value="<%=al.get(i).getComment_seq()%>"/>
											<input type="button" id="DeleteButton"  style="float: right" value="삭제" onclick="CommentDelete('<%=al.get(i).getComment_date()%>', '<%=al.get(i).getUser_id()%>')"/><br>
											
											<%}%><%}%><hr><% }%>
											</div>
                                        </form>
                                        
                                        
                                    </section>

								</div>
							</div>
						</div>
					</div>
				</section>

                <!-- Section -->


            </div>
        </div>
	

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
    function comment(){
		let ta = document.querySelector("textarea"); //댓글 작성창
		let replyDiv = document.querySelector("#reply"); //댓글 출력창
		
		//JSON({키 : 실제값}) 형식 데이터 만들기
        let data = {'boardnum':<%=num%> , 'reply':ta.value}
        
        let xhr = new XMLHttpRequest()
        
        //요청방식 , 요청경로
        xhr.open('post', '../CommentCon')
        
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
                    location.reload();
                 }else{
                	 alert("댓글 작성에 실패하였습니다.");
 					location.reload();
                 }
              }else{
                 console.log("응답실패")
              }
           }else{  //요청실패
              console.log("요청실패")
           }
        }
	}
    
    
    
    
    
    function CommentDelete(date, ID) {
    	let data = {'date': date, 'ID': ID};
    	let xhr = new XMLHttpRequest();
    	
    	//요청방식, 요청경로
    	xhr.open('post', '../CommentDeleteCon');
    	//전송 데이터의 형식
    	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    	//요청 & 전송할 데이터
    	xhr.send(JSON.stringify(data));
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState===XMLHttpRequest.DONE) { //요청 성공
    			if(xhr.status===200) { //응답 성공
    				console.log("응답 성공")
    				console.log(xhr.responseText) //응답데이터 확인 (XML로 보내는 경우에는 responseXML)
    				if(xhr.responseText == "success") {
    					location.reload();
    				}else {					
    					location.reload();
    				}
    			}else {
    				console.log("응답 실패")
    			}
    		}else {
    			console.log("요청 실패") //요청 실패
    		}
    	}
    }
    </script>

</body>
 
	


</html>