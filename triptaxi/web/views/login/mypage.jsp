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
    String[] birthday=loginUser.getBirthday().split("-");
%>

<link href="<%=request.getContextPath() %>/css/mypage.css" rel="stylesheet">
	<section id=mypage>
        <div id="mypage-cover">

        </div>
		<div id="mypage-container">
            <div id="mypage-nav">
                <li>여행일정</li>
                <li>클립보드</li>
                <li>내정보</li>
            </div>
            <div id="mypage-content">
    
            </div>
			
		</div>
	</section>

    <script>
        var userId="<%=userId%>";
        var planner_html;
        var ph;
        var ch;
        var plannerType='<%=type%>';
        var cPage=1;
        $(window).ready(function(){
            $(".my-content").css("opacity",0);
            $("#mypage-content-clipboard").css("opacity",1);
            fn_planner(plannerType, cPage);
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
                    case '내정보': fn_mypage_info();break;
                    default :break;
                }
            });
        });

       
        function fn_planner(plannerType, cPage){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/planner",
                data:{"userId":userId, "plannerType":plannerType, "cPage":cPage},
                success:function(data){
                    var plannerList=JSON.parse(data);
                    fn_plannerChange(plannerList);
                    $("#mypage-content").html(planner_html);
                    $("#mypage").css("height",ph*220+700+"px");
                    $("#mypage-content-planner").css("height",ph*220+150+"px")
                    $("#"+plannerType).addClass("pn_clicked");
                    //일정 내비 클릭이벤트
                    $(function(){
                        $("#planList_nav>li").click(function(){
                            $(this).addClass("pn_clicked");
                            $($(this).siblings()).removeClass("pn_clicked");
                            fn_planner($(this).attr("id"), 1);
                        });
                        $(".planList_div").click(function(){
                            location.href="<%=request.getContextPath()%>/planner/plannerView?plannerId="+plannerList['plannerList'][$(this).index()-1]['plannerId'];
                        });
                        $("#pageBar>li").hover(function(){
                            $(this).addClass("hoverLi");
                            $(this).children('a').addClass("hoverA");
                        },function(){
                            $(this).removeClass("hoverLi");
                            $(this).children('a').removeClass("hoverA");
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
                planner_html+="<div class='plan_totalDay'> "+plannerList['dayList'][i]+" DAY</div>";
                planner_html+="<div class='plan_city'>"+plannerList['cities'][i]+"</div>";
                var plan_theme=planner['plannerTheme']==null?"계획중":planner['plannerTheme'];
                planner_html+="<div class='plan_theme'><span>"+plan_theme+"</span></div>";
                planner_html+="<div class='plan_users'><i class='fas fa-user'></i>"+planner['plannerWriter'];
                var userList=plannerList['userList'][i];
                if(userList.length>0){
                    planner_html+=" 외 "+userList.length+"명";
                }
                planner_html+="</div>";
                planner_html+="<div class='plan_popularity'><i class='fas fa-eye'></i> "+planner['plannerCount']+"<i class='fas fa-heart'></i> "+planner['plannerLike']+"</div>";
                planner_html+="</div></div>";
            }
            planner_html+="</div>";
            if(plannerList['plannerList'].length>0){
                planner_html+=plannerList['pageBar'];
            }else{
                var add = "<li class='dataNullalert' style='border:none'><div class='dataNullalertIcon'><i class='fas fa-exclamation-triangle'></i></div>";
                add += "<div class='dataNullalertContent'>해당하는 데이터가<br>없습니다.</div></li>";
                planner_html+=add;
            }
            ph=Math.ceil(plannerList['plannerList'].length/3);
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
                    var clipboard_html="<div id='mypage-content-planner'>";
                    clipboard_html+="<div id='clipList_nav'>";
                    var j=0; 
                    var city;
                    var clip_content_html="<div class='clipList'>";
                    for(var i=0; i<cityList.size; i++){
                        city=it.next().value;
                        clipboard_html+="<li>"+city+"</li>";
                        clip_content_html+="<div class='clipList-container'>";
                        for(;j<clip_list.length;j++){
                            if(clip_list[j]['city']!=city){
                                clip_content_html+="</div>";
                                break;
                            }
                            clip_content_html+='<div class="clipList_div" onclick="fn_cliptour_go('+"'"+clip_list[j]['tourId']+"'"+');"><div class="clipList_thumbnail">';
                            clip_content_html+="<img src='<%=request.getContextPath()%>/images/"+clip_list[j]['city']+"/"+clip_list[j]['tourName']+"/"+clip_list[j]['imageUrl'].split(",")[0]+"'width='268px' height='180px'/></div>";
                            clip_content_html+="<div class='clipList_content'>";
                            clip_content_html+="<div class='clip_name'>"+clip_list[j]['tourName']+"</div>";
                            clip_content_html+="<div class='clip_clipcount'><i class='fas fa-paperclip'></i><span> " + clip_list[j]['clipCount'] +" </span></div>";
                            clip_content_html+="<div class='clip_reviewscore'><i class='fas fa-star'></i><span> "+clip_list[j]["reviewScore"]+"</span></div>";
                            clip_content_html+="<div class='clip_category'>"+clip_list[j]["category"]+"</div>";
                            clip_content_html+="</div></div>";
                        }
                    }
                    clip_content_html+="</div>";
                    clipboard_html+="</div>";
                    clipboard_html+=clip_content_html;
                    clipboard_html+="</div>";
                    if(cityList.size==0){
                        var add = "<li class='dataNullalert1' style='border:none'><div class='dataNullalertIcon1'><i class='fas fa-exclamation-triangle'></i></div>";
                        add += "<div class='dataNullalertContent1'>해당하는 데이터가<br>없습니다.</div></li>";
                        clipboard_html+=add;
                    }
                    $("#mypage-content").html(clipboard_html);
                    $("#mypage").css("height",$(".clipList-container").height()+700+"px");
                    $($(".clipList-container")[0]).siblings().hide();
                    $($("#clipList_nav>li")[0]).addClass('pn_clicked');
                    $(function(){
                        $("#clipList_nav>li").click(function(){
                            $($(".clipList-container")[$(this).index()]).siblings().hide();
                            $($(".clipList-container")[$(this).index()]).show();
                            $(this).addClass("pn_clicked");
                            $($(this).siblings()).removeClass("pn_clicked");
                        });
                    });
                    
                }
            });
        }
        //클립보드 투어 클릭
        function fn_cliptour_go(tourId){
            open("<%=request.getContextPath()%>/attraction/select?attId="+tourId);
        }

        function fn_mypage_info(){
            var myInfo_html="<div id='wrap'> <form name='updateuser' method='post'>";
            myInfo_html+='<table class="userid_1"><tr><td >아이디</td><td>';
            myInfo_html+='<input type="text" name="userId" id="view_userId" maxlength="50" placeholder="아이디입력" value="<%=loginUser.getUserId() %>"   readonly>';
            myInfo_html+='</td></tr>';
            myInfo_html+='<tr><td>이름</td><td>';
            myInfo_html+='<input type="text" name="userName" id="userName" maxlength="50" value="<%=loginUser.getUserName() %>" readonly>';
            myInfo_html+='</td></tr>';
            myInfo_html+='<tr><td>성별</td>';
            
            if("<%=loginUser.getGender()%>"=='M'){
                myInfo_html+='<td><input type="radio" name="gender" value="M" checked />남';
                myInfo_html+='<input type="radio" name="gender" value="F">여</td>';
            }else{
                myInfo_html+='<td><input type="radio" name="gender" value="M" />남';
                myInfo_html+='<input type="radio" name="gender" value="F" checked />여</td></tr>';
            }
            var email='<%=loginUser.getEmail()%>'.split('@');
            myInfo_html+=' <tr><td>생년월일</td>';
            myInfo_html+='<td><input type="text" name="birthyear" maxlength="4" placeholder="년(4자)" size="7" value="<%=birthday[0]%>" readonly>';
            myInfo_html+='<input type="text" name="birthmonth" maxlength="2" placeholder="월" size="4"  value="<%=birthday[1]%>" readonly>';
            myInfo_html+='<input type="text" name="birthday" maxlength="2" placeholder="일" size="4" value="<%=birthday[2]%>" readonly></td></tr>';
            myInfo_html+='<tr><td>이메일</td><td>';
            myInfo_html+='<input type="text" name="user_email" id="user_email" maxlength="50" value="'+email[0]+'" autofocus>@';
            myInfo_html+='<select id="email1" name="email1"><option>naver.com</option><option>daum.net</option><option>gmail.com</option><option>nate.com</option><option>kh.com</option></select></td></tr>';
            myInfo_html+='<tr><td>휴대전화</td><td>';
            myInfo_html+='<input type="text" name="phone" id="phone" placeholder="(-없이)" value="<%=loginUser.getPhone() %>" />';
            myInfo_html+='</td></tr>';
            myInfo_html+='</table><br><div id="frmButton"><input class="btn1" type="button" onclick="user_updatePassword();" value="비밀번호변경" /><input class="btn1" type="button" onclick="user_updateUser();" value="정보수정" name="updateuser" /><input class="btn1" type="button" onclick="user_deleteMember();" value="탈퇴" /></form></div></div>';
            $("#mypage-content").html(myInfo_html);
            $("#mypage").css("height","1000px");
            $("#email1").val(email[1]);
            
            
        }
         
        $("#mypage-cover").css({"background-image":"url('<%=request.getContextPath()%>/images/<%=cityImg%>'","background-size":"100% 100%"});
        function userupdate_validate(){
			//정규표현식 이용해서 제한사항작성
			return true;
		}
		function user_updateUser(){
			//수정된정보를 서블릿에 전송
			updateuser.action="<%=request.getContextPath()%>/user/userupdate?user_id=<%=loginUser.getUserId()%>";
			updateuser.submit();//데이터전송!
		}
			function user_deleteMember(){
				if(confirm("정말로 삭제하시겠습니까?")){
					updateuser.action="<%=request.getContextPath()%>/user/userdelete?user_id=<%=loginUser.getUserId()%>";
					updateuser.submit();
				}
			}

    </script>
<%@ include file="/views/common/footer.jsp"%>