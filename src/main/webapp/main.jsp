<%@page import="com.dao.UserDAO"%>
<%@page import="com.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="robots" content="noindex, nofollow">
        
        <title>27.8Hz</title><link rel="preload" as="style" href="https://fonts.googleapis.com/css?family=Source%20Sans%20Pro%3A400%2C900%2C700%2C300%2C300italic%7CLato%3A300%2C400%2C700%2C900%7CPoppins%3A300%2C400%2C500%2C600%2C700&amp;display=swap"><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source%20Sans%20Pro%3A400%2C900%2C700%2C300%2C300italic%7CLato%3A300%2C400%2C700%2C900%7CPoppins%3A300%2C400%2C500%2C600%2C700&amp;display=swap" media="all" onload="this.media='all'"><noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source%20Sans%20Pro%3A400%2C900%2C700%2C300%2C300italic%7CLato%3A300%2C400%2C700%2C900%7CPoppins%3A300%2C400%2C500%2C600%2C700&#038;display=swap" /></noscript>
        <meta name="robots" content="noindex, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1">
         <meta property="og:locale" content="en_US">
        <meta property="og:type" content="website">
        <meta property="og:title" content="Front Page - Illdy Theme Demo">
        <meta property="og:url" content="https://demo.colorlib.com/illdy/">
        <meta property="og:site_name" content="Illdy Theme Demo">
        <meta property="article:author" content="http://facebook.com/silkalns">
        <meta property="article:modified_time" content="2020-10-23T11:11:58+00:00">
        <meta name="twitter:card" content="summary">
        <meta name="twitter:creator" content="@https://twitter.com/ASilkalns">
        <script defer="" src="/cdn-cgi/zaraz/s.js?z=JTdCJTIyZXhlY3V0ZWQlMjIlM0ElNUIlNUQlMkMlMjJ0cmFja3MlMjIlM0ElNUIlNUQlMkMlMjJ0JTIyJTNBJTIyRnJvbnQlMjBQYWdlJTIwLSUyMElsbGR5JTIwVGhlbWUlMjBEZW1vJTIyJTJDJTIydyUyMiUzQTE3OTIlMkMlMjJoJTIyJTNBMTEyMCUyQyUyMmolMjIlM0ExMDE2JTJDJTIyZSUyMiUzQTE3OTIlMkMlMjJsJTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZkZW1vLmNvbG9ybGliLmNvbSUyRmlsbGR5JTJGJTIyJTJDJTIyciUyMiUzQSUyMiUyMiUyQyUyMmslMjIlM0EzMCUyQyUyMm4lMjIlM0ElMjJVVEYtOCUyMiUyQyUyMm8lMjIlM0EtNTQwJTdE"></script><script type="application/ld+json" class="yoast-schema-graph">{"@context":"https://schema.org","@graph":[{"@type":"WebSite","@id":"https://demo.colorlib.com/illdy/#website","url":"https://demo.colorlib.com/illdy/","name":"Illdy Theme Demo","description":"Just another colorlib.com site","potentialAction":[{"@type":"SearchAction","target":"https://demo.colorlib.com/illdy/?s={search_term_string}","query-input":"required name=search_term_string"}],"inLanguage":"en-US"},{"@type":"WebPage","@id":"https://demo.colorlib.com/illdy/#webpage","url":"https://demo.colorlib.com/illdy/","name":"Front Page - Illdy Theme Demo","isPartOf":{"@id":"https://demo.colorlib.com/illdy/#website"},"datePublished":"2016-09-07T10:07:33+00:00","dateModified":"2020-10-23T11:11:58+00:00","inLanguage":"en-US","potentialAction":[{"@type":"ReadAction","target":["https://demo.colorlib.com/illdy/"]}]}]}</script>
        <script src="https://kit.fontawesome.com/70d105e515.js" crossorigin="anonymous"></script>
        <link rel="dns-prefetch" href="//fonts.googleapis.com">
        <link href="https://fonts.gstatic.com" crossorigin="" rel="preconnect">
        <link rel="alternate" type="application/rss+xml" title="Illdy Theme Demo » Feed" href="https://demo.colorlib.com/illdy/feed/">
        <link rel="alternate" type="application/rss+xml" title="Illdy Theme Demo » Comments Feed" href="https://demo.colorlib.com/illdy/comments/feed/">
        <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 0.07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
        </style>
        <link rel="stylesheet" id="wp-block-library-css" href="https://demo.colorlib.com/illdy/wp-includes/css/dist/block-library/style.min.css?ver=5.9.1" type="text/css" media="all">
       
        </style>

        <!--컨텐츠-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
        <!--컨텐츠-->

        <link rel="stylesheet" id="contact-form-7-css" href="assets/css/" type="text/css" media="all">
        <link rel="stylesheet" id="prisna-social-counter-css" href="https://demo.colorlib.com/illdy/wp-content/plugins/social-counter/styles/prisna-social-counter.css?ver=5.9.1" type="text/css" media="all">
        <link rel="stylesheet" id="icomoon-css" href="https://demo.colorlib.com/illdy/wp-content/plugins/kiwi-social-share/assets/vendors/icomoon/style.css?ver=2.1.4" type="text/css" media="all">
        <!-- <link rel="stylesheet" id="illdy-pace-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/pace.min.css?ver=5.9.1" type="text/css" media="all"> -->
        <link rel="stylesheet" id="bootstrap-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/bootstrap.min.css?ver=3.3.6" type="text/css" media="all">
        <link rel="stylesheet" id="bootstrap-theme-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/bootstrap-theme.min.css?ver=3.3.6" type="text/css" media="all">
        <link rel="stylesheet" id="font-awesome-css" href="https://demo.colorlib.com/illdy/wp-content/plugins/elementor/assets/lib/font-awesome/css/font-awesome.min.css?ver=4.7.0" type="text/css" media="all">
        <link rel="stylesheet" id="owl-carousel-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/owl-carousel.min.css?ver=2.0.0" type="text/css" media="all">
        <link rel="stylesheet" id="illdy-main-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/main.css?ver=5.9.1" type="text/css" media="all">
        <link rel="stylesheet" id="illdy-custom-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/css/custom.css?ver=5.9.1" type="text/css" media="all">
        <link rel="stylesheet" id="illdy-style-css" href="https://demo.colorlib.com/illdy/wp-content/themes/illdy/style.css?ver=1.0.16" type="text/css" media="all">
        <script type="text/javascript" src="https://demo.colorlib.com/illdy/wp-includes/js/jquery/jquery.min.js?ver=3.6.0" id="jquery-core-js"></script>
        <script type="text/javascript" src="https://demo.colorlib.com/illdy/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.3.2" id="jquery-migrate-js"></script>
        <script type="text/javascript" id="illdy-pace-js-extra">
        /* <![CDATA[ */
        var paceOptions = {"restartOnRequestAfter":"0","restartOnPushState":"0"};
        /* ]]> */
        </script>
        <script type="text/javascript" src="https://demo.colorlib.com/illdy/wp-content/themes/illdy/layout/js/pace/pace.min.js?ver=5.9.1" id="illdy-pace-js"></script>
        <link rel="https://api.w.org/" href="https://demo.colorlib.com/illdy/wp-json/"><link rel="alternate" type="application/json" href="https://demo.colorlib.com/illdy/wp-json/wp/v2/pages/126"><link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.colorlib.com/illdy/xmlrpc.php?rsd">
        <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://demo.colorlib.com/illdy/wp-includes/wlwmanifest.xml">
        <meta name="generator" content="WordPress 5.9.1">
        <link rel="shortlink" href="https://demo.colorlib.com/illdy/">
        <link rel="alternate" type="application/json+oembed" href="https://demo.colorlib.com/illdy/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.colorlib.com%2Filldy%2F">
        <link rel="alternate" type="text/xml+oembed" href="https://demo.colorlib.com/illdy/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.colorlib.com%2Filldy%2F&amp;format=xml">
        <style type="text/css">.pace .pace-progress {background-color: #f1d204; color: #f1d204;}.pace .pace-activity {box-shadow: inset 0 0 0 2px #f1d204, inset 0 0 0 7px #ffffff;}.pace-overlay {background-color: #ffffff;}</style><style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
        <script nonce="ee89bcf4-6f40-48ab-b761-c1f7e36c005e">(function(w,d){!function(a,e,t,r,z){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zarazData.tracks=[],a.zaraz={deferred:[]};var s=e.getElementsByTagName("title")[0];s&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.dataLayer=a.dataLayer||[],a.zaraz.track=(e,t)=>{for(key in a.zarazData.tracks.push(e),t)a.zarazData["z_"+key]=t[key]},a.zaraz._preSet=[],a.zaraz.set=(e,t,r)=>{a.zarazData["z_"+e]=t,a.zaraz._preSet.push([e,t,r])},a.dataLayer.push({"zaraz.start":(new Date).getTime()}),a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r);z.defer=!0,z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script></head>
		<style>
		.section-description {
			text-align: left;
			margin-left: 100px;
			margin-top: 2px;
			max-width: 517.2px;
		}		
		</style>
<body>
	
	<%
		UserVO vo = (UserVO)session.getAttribute("loginVO"); //세션가져옴

		UserVO uvo = null;
		if (vo!=null) {
		UserDAO udao = new UserDAO();
		uvo = udao.getOneList(vo.getUser_id());
		}
	%>
	
    <header id="header" class="header-front-page"
        style="background-image: url(images/bg2.png);background-attachment: fixed;">


       
        
        <div class="top-header">       
            <div class="container">
                <div class="row">
                    <div class="col-sm-2 col-xs-10">
                        <a href="main.jsp" title="Illdy Theme Demo">
                            <img class="header-logo-img"
                                src="images/logo.png"
                                width="">
                        </a>
                    </div>
                    <div class="col-sm-10 col-xs-2">
                        <nav class="header-navigation">
                            <ul id="menu-illdy-main" class="clearfix">
                                <li id="menu-item-16"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-16">
                                    <a href="WithU.jsp" aria-current="page">WITH U</a>
                                </li>
                                <li id="menu-item-17"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-17">
                                    <a href="HealthDataCon" aria-current="page">Check</a>
                                </li>
                                <li id="menu-item-18"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-18">
                                    <a href="./278board/NewsList.jsp" aria-current="page">Healthy</a>
                                </li>
                                <li id="menu-item-19"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-19">
                                    <a href="./278board/CommunityList.jsp" aria-current="page">Community</a>
                                </li>
                                <li id="menu-item-20"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20">
                                    <a href="./278board/CenterList.jsp" aria-current="page">Services</a>
                                </li>
                                <!--  
                                <li id="menu-item-20"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20">
                                    <a href="Login/login.html" aria-current="page" style="color: #f8ab24;">Log In</a>
                                </li>
                                -->
                                <!-- 
                                <li id="menu-item-20"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20">
                                    <a href="SignUP/signup.html" aria-current="page" style="color: #f8ab24;">Sign Up</a>
                                </li>
								 -->
								
								<%
									if(vo==null){ 
										
										out.print("<li id='menu-item-20'" + //로그인
					                            "class='menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20'>" +
			                                    "<a href='./Login/Login.jsp' aria-current='page' style='color: #f8ab24;'>Log In</a></li>");
											
	                                out.print("<li id='menu-item-20'" + //회원가입 
			                            "class='menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20'>" +
	                                    "<a href='SignUP/signUp.jsp' aria-current='page' style='color: #f8ab24;'>Sign Up</a></li>");
									
									}else{
										System.out.println("(세션)아이디: " + vo.getUser_id() );	// 값 넘어오는지 확인용 삭제 해도 됌
										System.out.println("(세션)비밀번호: " +vo.getUser_pw() ); //값 넘어오는지 확인용 삭제 해도 됌
										
										if(uvo.getAdmin_yn().equals("Y")){
											out.print("<li id='menu-item-20'" + //관리자 일때 회원 정보 수정 
						                            "class='menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20'>" +
				                                    "<a href='./278board/AdminPage.jsp' aria-current='page' style='color: #f8ab24;'>AllUser</a></li>");
										}
										out.print("<li id='menu-item-20'" + //회원 정보 수정 
					                            "class='menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20'>" +
			                                    "<a href='editCheck.jsp' aria-current='page' style='color: #f8ab24;'>Edit profile</a></li>");
										
										out.print("<li id='menu-item-20'" +// 로그 아웃
					                            "class='menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-20'>" +
			                                    "<a href='LogoutCon' aria-current='page' style='color: #f8ab24;'>Log Out</a></li>");
									}
								%>
                        </nav>                        
                        
                    </div>

                    
                </div>
            </div>

            
        </div>
        <div class="bottom-header front-page">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12"></div>
                        <h1 style="text-align: center;">NOT Drowzy<span class="span-dot" style="color: #f8ab24">,</span><br>NEVER Sleep</h1>
                    </div>
                    <div class="col-sm-8 col-sm-offset-2" >
                        <h3 class="section-description" style="text-align: left; margin-left: 100px; margin-top: 2px"> 운전자들은 모두 도로 위에서 고독합니다. 도로 위의 오랜 친구인 라디오 주파수를 따 온 저희 28.8Hz는 당신이 운전대를 잡고 있는 모든 순간 함께하고 싶다는 바람을 가지고 세상 밖으로 나왔습니다.
                        이제 'WITH U'가 당신과 동행할게요.
                        </h3>
                        
                    </div>

                    
                </div>
                    <a href="https://colorlib.com/wp/themes/illdy/" title="Learn more"
                                class="header-button-one" style="align-items:left">더 알아보기
                    </a>
            </div>
        </div>
    </header>

    <div id="page-wrapper">


        <!-- Two -->
            <section id="two" class="wrapper alt style2">
                <section class="spotlight">
                    <div class="image"><img src="images/sub01.jpg" alt="" /></div><div class="content">
                        <h1 style="color: #ffffff;">MY CHECK</h1>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                    </div>
                </section>
                <section class="spotlight">
                    <div class="image"><img src="images/sub02.jpg" alt="" /></div><div class="content">
                        <h1 style="color:#ffffff; text-align: right;">HEALTH NEWS</h1>
                        <p style="text-align: right;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                    </div>
                </section>
                <section class="spotlight">
                    <div class="image"><img src="images/sub03.jpg" alt="" /></div><div class="content">
                        <h1 style="color:#ffffff;">COMMUNITY</h1>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </section>

                <section class="spotlight">
                    <div class="image"><img src="images/sub04.jpg" alt="" /></div><div class="content">
                        <h1 style="color:#ffffff; text-align: right;">SERVICE</h1>
                        <p style="text-align: right;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </section>
            </section>

        

        <!-- Footer -->
            <footer id="footer">
                <ul class="icons">
                    <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
                    <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
                </ul>
                <ul class="copyright">
                    <li>&copy; 27.8Hz</li><li>Design: <a href="main.jsp">27.8Hz</a></li>
                </ul>
            </footer>

    </div>

<!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
    	document.onscroll = evt =>  {
    		Array.from(document.getElementsByClassName('spotlight')).forEach(item => {
    			if(window.innerHeight + window.pageYOffset > item.offsetTop ){
    				item.classList.add("fade-in");
    			}    				
    		}) 		
    	}

    </script>

</body>

</html>