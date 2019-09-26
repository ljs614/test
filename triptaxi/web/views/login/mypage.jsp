<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>
<%
    String userId="null";
    if(loginUser!=null){
        userId=loginUser.getUserId();
    }
%>

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
                switch($(this).html()){
                    case '클립보드':fn_clipboard();break;
                    case '여행일정':break;
                    case '리뷰':break;
                    default :break;
                }
            });
        });

        var userId="<%=userId%>";
        function fn_clipboard(){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/clipboard",
                dataType:"text",
                data:{"userId":userId},
                success:function(data){
                    console.log(data);
                }
            });
        }
        
        
        
        
    </script>
<%@ include file="/views/common/footer.jsp"%>