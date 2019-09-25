<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
    <script src="https://kit.fontawesome.com/dcff5cba12.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<%=request.getContextPath() %>/js/parallax.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/aos.js"></script>
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
                $("nav").css("backgroundColor","#49506a");
                $("nav").css("borderBottom","1px solid #404559");
                $(".main_menu>a").css("color","#a6abbe");
                $(".sub_menu1>ul>li>a").css("color","#a6abbe");
            }, function(){
                if($(window).scrollTop()){
                    $("nav .sub_menu").stop().slideUp("fast");
                    $("nav").css("backgroundColor","#49506a");
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
                    $("nav").css("backgroundColor","#49506a"); 
                    $(".main_menu>a").css("color","#a6abbe");
                    $("nav").hover(function(){
                    	$(".main_menu>a").css("color","#a6abbe");
                    }, function(){
                    	$(".main_menu>a").css("color","#a6abbe");
                    });
                } 
                else{
                    $("nav").css("backgroundColor",""); 
                    $(".main_menu>a").css("color","black");
                    $("nav").hover(function(){
                    	$(".main_menu>a").css("color","#a6abbe");
                    }, function(){
                    	$(".main_menu>a").css("color","black");
                    });
                } 
            }) 
        });

        
      
       $(function(){
	        $(".con1_hover1").on("mouseenter",function(){
	        	$(".top_con_span").first().css("color","black").css("fontSize","25px");
	 			$(".top_con_p").first().css("color","black"); 
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
	        	$(".top_con_span").eq(1).css("color","black").css("fontSize","25px");
	 			$(".top_con_p").eq(1).css("color","black"); 
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
	        	$(".top_con_span").last().css("color","black").css("fontSize","25px");
	 			$(".top_con_p").last().css("color","black"); 
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
        
        
    </script>

 
</head>

<body marginwidth="0" marginheight="0" leftmargin="0" topmargin="0">
    <header>
        <nav>
            <div class="menu_css">
                <div class="top_menu">                
                    <ul>
                        <li class="main_menu"><a href="">여행지</a>
                        </li>
                        <li class="main_menu"><a href="">여행일정 계획</a>
                            
                        </li>
                        <li class="main_menu"><a href="">커뮤니티</a>
                            
                        </li>
                        <li class="main_menu"><a href="">여행 준비</a></li>
                    </ul>
                </div>
                <div class="top_btn">
                    <button id="btn_login" name="btn_login" class="" onclick="">로그인</button>
                    <button id="btn_join" name="btn_join" class="" onclick="">회원가입</button>
                </div>
                <!-- <div class="top_btn1">
                	<a href="#" class="top_login" title="마이페이지">
	                	<i class="material-icons login_i">
							person_pin
						</i>
					</a>
					<a href="#" class="top_login" title="메세지함">
						<i class="material-icons login_i">
							notifications_active
						</i>
						<i class="material-icons top_i">
							notifications_off
						</i>
					</a>
					<a href="#" class="top_login" title="로그아웃">
						<i class="material-icons login_i">
							emoji_people
						</i>
                	</a>
                </div> -->
            </div>

            <div class="sub_menu">
                <div class="sub_menu1">
                    <ul class="sub_menu1_1">
                        <li class="hvr-float-shadow"><a href="">해외 여행지</a></li>
                    </ul>
                    <ul class="sub_menu1_2">
                        <li class="hvr-float-shadow"><a href="">내 일정 만들기</a></li>
                        <li class="hvr-float-shadow"><a href="">내 일정 보기</a></li>
                        <li class="hvr-float-shadow"><a href="">다른사람 일정보기</a></li>
                    </ul>
                    <ul class="sub_menu1_3">
                        <li class="hvr-float-shadow"><a href="">Q&A 게시판</a></li>
                        <li class="hvr-float-shadow"><a href="">후기 게시판</a></li>
                        <li class="hvr-float-shadow"><a href="">동행 게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>