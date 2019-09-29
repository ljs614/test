<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>
<%
    String userId="null";
    if(loginUser!=null){
        userId=loginUser.getUserId();
    }
    String cityImg=(String)request.getAttribute("cityImg");
    String type=request.getAttribute("type")==null?"ed_plan":(String)request.getAttribute("type");
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
         var userId="<%=userId%>";
        var planner_html;
        var h;
        var plannerType='<%=type%>';
        $(window).ready(function(){
            $(".my-content").css("opacity",0);
            $("#mypage-content-clipboard").css("opacity",1);
            fn_planner(plannerType);
            $($("#mypage-nav>li")[0]).addClass('mn_clicked');
        });

        //마이페이지 내비 클릭 이벤트
        $(function(){
            $("#mypage-nav>li").click(function(){
                $($(this).siblings()).removeClass('mn_clicked');
                $(this).addClass('mn_clicked');
                $("#mypage-content").html("");
                switch($(this).html()){
                    case '여행일정':fn_planner("ed_plan");break;
                    case '클립보드':fn_clipboard();break;
                    case '리뷰':break;
                    default :break;
                }
            });
        });

       
        function fn_planner(plannerType){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/planner",
                data:{"userId":userId, "plannerType":plannerType},
                success:function(data){
                    var plannerList=JSON.parse(data);
                    fn_plannerChange(plannerList)
                    $("#mypage-content").html(planner_html);
                    $("#mypage").css("height",h*220+700+"px");
                    $("#"+plannerType   ).addClass("pn_clicked");
                     //일정 내비 클릭이벤트
                    $(function(){
                        $("#planList_nav>li").click(function(){
                            $(this).addClass("pn_clicked");
                            $($(this).siblings()).removeClass("pn_clicked");
                            fn_planner($(this).attr("id"));
                        });
                        $(".planList_div").click(function(){
                            location.href="<%=request.getContextPath()%>/planner/plannerView?plannerId="+plannerList['plannerList'][$(this).index()-1]['plannerId'];
                        });
                    });
                }
            });
        }
        function fn_plannerChange(plannerList){
            planner_html="<div id='mypage-content-planner'>";
            planner_html+="<div id='planList_nav'>";
            planner_html+="<li id='ed_plan'>완성된 일정</li><span>|</span>";
            planner_html+="<li id='ing_plan'>계획중인 일정</li><span>|</span>";
            planner_html+="<li id='like_plan'>좋아요 일정</li>";
            planner_html+="</div>";
            for(var i=0; i<plannerList['plannerList'].length; i++){
                var planner=plannerList['plannerList'][i];
                planner_html+="<div class='planList_div'><div class='planList_thumbnail'>";
                planner_html+="<img src='<%=request.getContextPath()%>"+planner['plannerCoverimg']+"'width='268px' height='180px'/></div>";
                planner_html+="<div class='planList_content'>";
                planner_html+="<div class='plan_title'>"+planner['plannerName']+"</div>";
                var p_date=planner['plannerDate'].split(' ');
                planner_html+="<div class='plan_date'>"+p_date[2]+"-"+p_date[0].split('월')[0]+"-"+p_date[1].split(',')[0]+"</div>";
                planner_html+="<div class='plan_totalDay'>"+plannerList['plannerList'].length+" DAY</div>";
                planner_html+="<div class='plan_city'>"+plannerList['cities'][i]+"</div>";
                var plan_theme=planner['plannerTheme']==null?"계획중":planner['plannerTheme'];
                planner_html+="<div class='plan_theme'>"+plan_theme+"</div>";
                planner_html+="<div class='plan_users'>"+planner['plannerWriter'];
                var userList=plannerList['userList'][i];
                for(var j=0; j<userList.length; j++){
                    planner_html+=", ";
                    planner_html+=userList[j];
                    
                    
                }
                planner_html+="</div>";
                planner_html+="<div class='plan_like'>10</div>";
                planner_html+="</div></div>";
            }
            planner_html+="</div>";
            h=Math.ceil(plannerList['plannerList'].length/3);
        }






        function fn_clipboard(){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/clipboard",
                data:{"userId":userId},
                success:function(data){
                    var clip_list=JSON.parse(data);
                    const cityList=new Set([]);
                    for(var i=0; i<clip_list.length; i++){
                        cityList.add(clip_list[i]['city']);
                    }
                    var it=cityList.values();
                    for(var i=0; i<cityList.size; i++){
                        console.log(it.next().value);
                    }
                //     var clipboard_html="<div id='mypage-content-planner'>";
                //     clipboard_html+="<div id='planList_nav'>";
                //     for(var i=0; i<clipboard_list.length; i++){
                //         clipboard_html+="<li>완성된 일정</li>";
                //         if(i<clipboard_list.length-1){
                //             clipboard_html+="<span>|</span>";
                //         }
                //     }
                //     clipboard_html+="</div>";
                }
            });
        }
        
         
        $("#mypage-cover").css({"background-image":"url('<%=request.getContextPath()%>/images/<%=cityImg%>'","background-size":"100% 100%"});
        
    </script>
<%@ include file="/views/common/footer.jsp"%>