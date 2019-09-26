<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>

<link href="<%=request.getContextPath() %>/css/mypage.css" rel="stylesheet">
	<section>
		<div id="mypage-container">
            <div id="mypage-nav">
                <li>클립보드</li>
                <li>여행일정</li>
                <li>리뷰</li>
                <li>Q&A</li>
            </div>
            <div id="mypage-content">
                <div id="mypage-content-clipboard" class='my-content'>클립보드</div>
                <div id="mypage-content-planner" class='my-content'>ㅇㄹ정</div>
                <div id="mypage-content-review" class='my-content'>리뷰</div>
                <div id="mypage-content-qna" class='my-content'>큐앤에이</div>
            </div>
			
		</div>
	</section>

    <script>
        $(window).ready(function(){
            $(".my-content").css("opacity",0);
            $("#mypage-content-clipboard").css("opacity",1);
        });
        $(function(){
            $("#mypage-nav>li").click(function(){
                $($(this).siblings()).css({"background-color":"#49506a","color":"white","font-weight":"100"});
                $(this).css({"background-color":"white","color":"#49506a","font-weight":"700"});
                $(".my-content").hide();
                switch($(this).html()){
                    case '클립보드':$("#mypage-content-clipboard").show();break;
                    case '여행일정':$("#mypage-content-planner").show();break;
                    case '리뷰':$("#mypage-content-review").show();break;
                    default :$("#mypage-content-qna").show();break;
                }
            });
        });
    </script>
<%@ include file="/views/common/footer.jsp"%>