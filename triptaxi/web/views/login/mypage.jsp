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
	<section>
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
        });
        $(function(){
            $("#mypage-nav>li").click(function(){
                $($(this).siblings()).css({"background-color":"#49506a","color":"white","font-weight":"100"});
                $(this).css({"background-color":"white","color":"#49506a","font-weight":"700"});
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
                    for(var i=0; i<plannerList.length; i++){
                        planner_html+="<div class='planList_div'><div class='planList_thumbnail'>";
                        planner_html+="<img src='<%=request.getContextPath()%>"+plannerList[i]['plannerCoverimg']+"'width='268px' height='180px'/></div>";
                        planner_html+="<div class='planList_content'>";
                        planner_html+="<div class='plan_title'>"+plannerList[i]['plannerName']+"</div>";
                        console.log(plannerList[i]['plannerDate']);
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
                    $("#mypage-content").append(planner_html);
                }
            });
        }
        // <div class='planView_Div'>
		// 			<div class='planView_Thumbnail'>
		// 				<img src="https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
		// 					alt="" width="268px" height="180px">
		// 			</div>
		// 			<div class="planView_Content">
		// 				<div class='pvc_title'>일정 제목</div>
		// 				<div class='pvc_date'>2019-01-01</div>
		// 				<div class='pvc_totalDay'>10 DAY</div>
		// 				<div class="pvc_city">도시</div>
		// 				<div class='pvc_theme'>가족여행</div>
		// 				<div class='pvc_users'>
		// 					<i class="fas fa-user"></i> 누구,누구,누구
		// 				</div>
		// 				<div class='pvc_Popularity'>
		// 					<i class="fas fa-eye"></i> 100 <i class="fas fa-heart"></i> 20
		// 				</div>

		// 			</div>
		// 		</div>







        function fn_clipboard(){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/clipboard",
                data:{"userId":userId},
                success:function(data){
                    console.log(data);
                }
            });
        }
        
         
        $("#mypage-cover").css("background-image","url('<%=request.getContextPath()%>/images/<%=cityImg%>'");
        
    </script>
<%@ include file="/views/common/footer.jsp"%>