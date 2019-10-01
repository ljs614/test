<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="triptaxi.user.model.vo.User" %>
<%
	User loginUser=(User)session.getAttribute("loginUser");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	 if(cookies!=null){ 
		for(Cookie c:cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
			}
		}
	 } 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="<%=request.getContextPath() %>/css/headerfooter.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link href="<%=request.getContextPath() %>/css/jquerybxslider.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/aos.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
    <link href="<%=request.getContextPath() %>/fontAwesome/css/all.css" rel="stylesheet">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<%=request.getContextPath() %>/js/parallax.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/aos.js"></script>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favi.png">
    <title>Trip Taxi</title>

    <script>
  		
   		$('.parallax-window').parallax({imageSrc:'../123.jpg'});

        function bot_exit(){
            var exit=document.getElementById("bot_con");
            exit.style.display="none";
        };
        
        
        
        $(function(){
            $("nav").hover(function(){
                $("nav .sub_menu").stop().slideDown("fast");
                $("nav").css("backgroundColor","white");
                $("nav").css("borderBottom","1px solid lightgray");
                $(".main_menu>a").css("color","black");
                $(".sub_menu1>ul>li>a").css("color","black");
            }, function(){
                if($(window).scrollTop()){
                    $("nav .sub_menu").stop().slideUp("fast");
                    $("nav").css("backgroundColor","white");
                    $("nav").css("borderBottom","");
                    $(".main_menu>a").css("color","black");
                }
               	else{
                    $("nav .sub_menu").stop().slideUp("fast");
                    $("nav").css("backgroundColor","");
                    $("nav").css("borderBottom","");
                    $(".main_menu>a").css("color","black");
                }
            })
        });
        
        $(document).ready(function(){ 
            $(window).scroll(function(){ 
                var scroll = $(window).scrollTop(); 
                if(scroll>1){ 
                    $("nav").css("backgroundColor","white"); 
                    $(".main_menu>a").css("color","black");
                    $("nav").hover(function(){
                    	$(".main_menu>a").css("color","black");
                    }, function(){
                    	$(".main_menu>a").css("color","black");
                    });
                } 
                else{
                    $("nav").css("backgroundColor",""); 
                    $(".main_menu>a").css("color","black");
                    $("nav").hover(function(){
                    	$(".main_menu>a").css("color","black");
                    }, function(){
                    	$(".main_menu>a").css("color","black");
                    });
                } 
            }) 
        });

        
      
       $(function(){
	        $(".con1_hover1").on("mouseenter",function(){
	        	$(".top_con_span").first().css("color","#49506a").css("fontSize","25px");
	 			$(".top_con_p").first().css("color","#49506a"); 
	 			$(".top_con_i1").first().css("color","#a2c5f7");
        		$(".top_img0").css("display","none");
        		$(".top_img1").css("display","block");
	        });
	        $(".con1_hover1").on("mouseleave",function(){
	 			$(".top_con_span").first().css("color","white").css("fontSize","25px");
	 			$(".top_con_p").first().css("color","white"); 
	 			$(".top_con_i1").first().css("color","white");
        		$(".top_img1").css("display","none");
        		$(".top_img0").css("display","block");
	        });
        });
       
       $(function(){
	        $(".con1_hover2").on("mouseenter",function(){
	        	$(".top_con_span").eq(1).css("color","#49506a").css("fontSize","25px");
	 			$(".top_con_p").eq(1).css("color","#49506a"); 
	 			$(".top_con_i1").eq(1).css("color","#a2c5f7");
       		$(".top_img0").css("display","none");
       		$(".top_img2").css("display","block");
	        });
	        $(".con1_hover2").on("mouseleave",function(){
	 			$(".top_con_span").eq(1).css("color","white").css("fontSize","25px");
	 			$(".top_con_p").eq(1).css("color","white"); 
	 			$(".top_con_i1").eq(1).css("color","white");
       		$(".top_img2").css("display","none");
       		$(".top_img0").css("display","block");
	        });
       });
       
       $(function(){
	        $(".con1_hover3").on("mouseenter",function(){
	        	$(".top_con_span").last().css("color","#49506a").css("fontSize","25px");
	 			$(".top_con_p").last().css("color","#49506a"); 
	 			$(".top_con_i1").last().css("color","#a2c5f7");
       		$(".top_img0").css("display","none");
       		$(".top_img3").css("display","block");
	        });
	        $(".con1_hover3").on("mouseleave",function(){
	 			$(".top_con_span").last().css("color","white").css("fontSize","25px");
	 			$(".top_con_p").last().css("color","white"); 
	 			$(".top_con_i1").last().css("color","white");
       		$(".top_img3").css("display","none");
       		$(".top_img0").css("display","block");
	        });
       });
        
        $(function(){
        	$(".con1_1").hover(function(){
        		$(".material-icons_con1").first().css("color","#66a1f4");
        	},function(){
        		$(".material-icons_con1").first().css("color","lightslategray");
        	});
        });
        
        $(function(){
        	$(".con1_2").hover(function(){
        		$(".material-icons_con1").eq(1).css("color","#66a1f4");
        	},function(){
        		$(".material-icons_con1").eq(1).css("color","lightslategray");
        	});
        });
        
        $(function(){
        	$(".con1_3").hover(function(){
        		$(".material-icons_con1").last().css("color","#66a1f4");
        	},function(){
        		$(".material-icons_con1").last().css("color","lightslategray");
        	});
        });
        function fn_login(){
            $("#logi").css("display","inline-block");
            $("#userId").focus();         
        }
        function fn_login_exit(){
            $("#logi").hide();
        }
        $(function(){
	        $(".mypagenull").on("click",function(){
	        	fn_login();
	        });
        });
        
    </script>

 
</head>

<body marginwidth="0" marginheight="0" leftmargin="0" topmargin="0">
    <header>
        <nav>
            <div class="menu_css">
                <div class="top_menu">                
                    <ul>
                        <li class="main_menu">
                        	<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/images/logo.png" height="40px" width="130px" /></a>
                        </li>
                        <li class="main_menu">
                        	여행지  
                        </li>
                        <li class="main_menu">
                        	여행일정 계획
                        </li>
                        <li class="main_menu">
                       		커뮤니티
                        </li>
                    </ul>
                </div>
                <% if(loginUser==null){ %>
                <div class="top_btn">
                    <button id="btn_login" name="btn_login" onclick="fn_login();">로그인</button>
                    <button id="btn_join" name="btn_join" onclick="location.href='<%=request.getContextPath() %>/UserEnroll'">회원가입</button>
                </div>
                <%} else{%>
                <div class="top_btn1">
                	<a href="<%=request.getContextPath() %>/user/mypage" class="top_login" title="마이페이지">
	                	<i class="material-icons login_i">
							person_pin
						</i>
					</a>
					<a href="#" class="top_login" title="메세지함">
						<i class="material-icons login_i">
							notifications_active
						</i>
						<!-- <i class="material-icons top_i">
							notifications_off
						</i> -->
					</a>
					<a href="<%=request.getContextPath() %>/logout" id="btn_logout" name="btn_logout" class="top_login" title="로그아웃">
						<i class="material-icons login_i">
							emoji_people
						</i>
                	</a>
                </div>
                <%} %>
            </div>

            <div class="sub_menu">
                <div class="sub_menu1">
                    <ul class="sub_menu1_1">
                        <li class="hvr-float-shadow"><a href="<%=request.getContextPath() %>/citySelect">해외 여행지</a></li>
                    </ul>
                    <ul class="sub_menu1_2">
                    	<%if(loginUser!=null){ %>
                        <li class="hvr-float-shadow"><a href="<%=request.getContextPath()%>/makePlan1">내 일정 만들기</a></li>
                        <%} else{%>
                         <li class="hvr-float-shadow mypagea mypagenull"><a class="mypagea">내 일정 만들기</a></li>
                        <%} %>
                         
                        <%if(loginUser!=null){ %>
                        <li class="hvr-float-shadow"><a href="<%=request.getContextPath()%>/user/mypage">내 일정 보기</a></li>
                        <%}else{ %>
                         <li class="hvr-float-shadow mypagea mypagenull"><a class="mypagea">내 일정 보기</a></li>
                        <%} %>
                        <li class="hvr-float-shadow"><a href="<%=request.getContextPath()%>/planMain">다른여행자 일정보기</a></li>
                    </ul>
                    <ul class="sub_menu1_3">
                        <li class="hvr-float-shadow"><a href="<%=request.getContextPath() %>/board/boardList">Q&A 게시판</a></li>
                        <li class="hvr-float-shadow"><a href="">후기 게시판</a></li>
                        <li class="hvr-float-shadow"><a href="">동행 게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div id="logi">
            <div class="login_1">
               
                <form action="<%=request.getContextPath()%>/login" method="post" onsubmit="validate();">
                <div class="login">
                    <div class="login_h2">
                        <h2>회원 로그인</h2>
                    </div>
                    <div id="login-container">
                        <div class="login_2">
                            <input type="text" name="userId" id="userId" value="<%=saveId !=null?saveId:""%>" placeholder="아이디"> <br/>
                            <input type="password" id="password" name="password" placeholder="비밀번호"/><br>
                            <label><input type="checkbox" name="saveId" id="saveId" <%=saveId != null ? "checked" : ""%> />아이디 저장</label>
                            <div class="wrap">
                                <button class="button1">로그인</button>
                            </div>
                        </div>
                        <div>
                            <div class="wrap1">
                                <button class="button1">
                                    <i class="fab fa-google"></i>네이버
                                </button>
                            </div>
                            <div class="wrap1">
                                <button class="button1">
                                    <i class="fab fa-google"></i>페이스북
                                </button>
                            </div>
            
                        </div>
                        <div>
                            <div class="wrap1">
                                <button class="button1">
                                    <i class="fab fa-google"></i>구글
                                </button>
                            </div>
                            <span class="search"><a href="">회원가입</a></span> <span class="search"><a
                                href="">아이디/비밀번호 찾기</a></span>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="location" name="location"/>
                <input type="hidden" id="parameter" name="parameter"/>
                </form>
                <button id="login_exit" onclick="fn_login_exit();">X</button>
            </div>
        
        </div>
        <script>
            $("#location").val(window.location.pathname);
            $("#parameter").val(window.location.href.split('?')[1]);
        </script>
