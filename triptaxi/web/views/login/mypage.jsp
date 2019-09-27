<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>
<%
    String userId="null";
    if(loginUser!=null){
        userId=loginUser.getUserId();
    }
    String cityImg=(String)request.getAttribute("cityImg");
%>

<link href="<%=request.getContextPath() %>/css/mypage.css" rel="stylesheet">
	<section id=mypage>
        <div id="mypage-cover">

        </div>
		<div id="mypage-container">
            <div id="mypage-nav">
                <li>여행일정</li>
                <li>클립보드</li>
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
            fn_planner();
            $($("#mypage-nav>li")[0]).addClass('mn_clicked');
        });

        //마이페이지 내비 클릭 이벤트
        $(function(){
            $("#mypage-nav>li").click(function(){
                $($(this).siblings()).removeClass('mn_clicked');
                $(this).addClass('mn_clicked');
                $("#mypage-content").html("");
                switch($(this).html()){
                    case '여행일정':fn_planner();break;
                    case '클립보드':fn_clipboard();break;
                    case '리뷰':break;
                    default :break;
                }
            });
        });

        var userId="<%=userId%>";

        function fn_planner(){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/planner",
                data:{"userId":userId},
                success:function(data){
                    var plannerList=JSON.parse(data);
                    var planner_html="<div id='mypage-content-planner'>";
                    planner_html+="<div id='planList_nav'>";
                    planner_html+="<li class='pn_clicked'>완성된 일정</li><span>|</span>";
                    planner_html+="<li>계획중인 일정</li><span>|</span>";
                    planner_html+="<li>좋아요 일정</li>";
                    planner_html+="</div>";
                    for(var i=0; i<plannerList.length; i++){
                        planner_html+="<div class='planList_div'><div class='planList_thumbnail'>";
                        planner_html+="<img src='<%=request.getContextPath()%>"+plannerList[i]['plannerCoverimg']+"'width='268px' height='180px'/></div>";
                        planner_html+="<div class='planList_content'>";
                        planner_html+="<div class='plan_title'>"+plannerList[i]['plannerName']+"</div>";
                        var p_date=plannerList[i]['plannerDate'].split(' ');
                        planner_html+="<div class='plan_date'>"+p_date[2]+"-"+p_date[0].split('월')[0]+"-"+p_date[1].split(',')[0]+"</div>";
                        planner_html+="<div class='plan_totalDay'>"+plannerList.length+" DAY</div>";
                        planner_html+="<div class='plan_city'>도시</div>";
                        planner_html+="<div class='plan_theme'>"+plannerList[i]['plannerTheme']+"</div>";
                        planner_html+="<div class='plan_users'>누구, 누구, 누구</div>";
                        planner_html+="<div class='plan_like'>10</div>";
                        planner_html+="</div></div>";
                    }
                    planner_html+="</div>";
                    var h=Math.ceil(plannerList.length/3);
                    $("#mypage-content").append(planner_html);
                    $("#mypage").css("height",h*220+700+"px");
                     //일정 내비 클릭이벤트
                    $(function(){
                        $("#planList_nav>li").click(function(){
                            $(this).addClass("pn_clicked");
                            $($(this).siblings()).removeClass("pn_clicked");
                        });
                        $(".planList_div").click(function(){
                            location.href="<%=request.getContextPath()%>/planner/plannerView?plannerId="+plannerList[$(this).index()-1]['plannerId'];
                        });
                    });
                }
            });
        }
       






        function fn_clipboard(){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/clipboard",
                data:{"userId":userId},
                success:function(data){
                    // console.log(data);
                }
            });
        }
        
         
        $("#mypage-cover").css({"background-image":"url('<%=request.getContextPath()%>/images/<%=cityImg%>'","background-size":"100% 100%"});
        
    </script>
<%@ include file="/views/common/footer.jsp"%>