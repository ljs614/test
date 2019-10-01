<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, triptaxi.planner.model.vo.Planner"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Planner planner=(Planner)request.getAttribute("planner");
	String coverImg=planner.getPlannerCoverimg();
	String userId="null";
	if(loginUser!=null){
		userId=loginUser.getUserId();
	}
	List userList=(List)request.getAttribute("userList");
	String userName=(String)request.getAttribute("userName");
	String users="";
%>

	<link href="<%=request.getContextPath() %>/css/planView.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/fontAwesome/css/all.css" rel="stylesheet">
	<section id="header-container">
		<div id="cover-container">
			<div id="cover-content">
				<label id="cover-change" for="cover-img">커버 바꾸기</label> 
				<input type='file' name='coverImg' id="cover-img">

				<!-- <div id="cover-change" onclick="fn_coverChange();">커버 바꾸기</div> -->
				<div id="like_btn" class="like" onclick="like_click();"></div>
				<div id="planner-info">
					<div id="planner-writer">
						<div id="planner-writer-profile">
								<i class="fas fa-user-circle"></i>
						</div>
						<div id="planner-writer-name">
							<%=userName%>
						</div>
					</div>
					<div id="planner-member">
						<div id="planner-member-invite">
							<%if(userId.equals(planner.getPlannerWriter())){%>
								<i class="fas fa-user-plus" title='초대하기'></i>
							<%}else{%>
								<div style='width:30px; height:30px'></div>
							<%}%>
								
						</div>
						<div id="planner-member-list">
							<%if(userList.size()>0){%>
								<i class="fas fa-users" id="users"></i>
								<%for(int i=0; i<userList.size(); i++){
									users+=userList.get(i);
									if(i<userList.size()-1){
										users+=",";
									}
								}
							}%>
						</div>
					</div>
					<div id="planner-name">	
						<div id="planTitle">
							<div id="title">
								<%=planner.getPlannerName()%>
							</div>
							<i class="far fa-edit"></i>
						</div>
						<div id="editTitle">
							<input type="text" id='editT' name="editT" maxlength="15" onkeyup="fn_lengthCheck(this);">
							<input type="button" id='editBT' value="수정" onclick="fn_titleChange()">
							<div id='titleCnt'>0/15</div>
						</div> 
					</div>


					<div id="planner-etc">
						<div id="planner-etc-date">
							
						</div>
						<div id="planner-etc-theme">
							<%if(planner.getPlannerTheme()==null){%>
								계획중
							<%}else{%>
								<%=planner.getPlannerTheme()%>
							<%}%>
						</div>
					</div>
					<div id='planner_popularity'><i class='fas fa-eye'></i> <%=planner.getPlannerCount()%><i class='fas fa-heart'></i><%=planner.getPlannerLike()%></div>
				</div>
			</div>
		</div>
		<div id="planView-nav">
				<div id="navBar">
				<ul>
					<li><a class="navs">개요</a></li>
					<li><a class="navs">일정표</a></li>
					<li><a class="navs">지도</a></li>
				</ul>
				<input type="button" id="modify_btn" value="수정하기"/>
				<input type="button" id="copy_btn" value="복사하기"/>
			</div>
		</div>
	</section>


	<section id="planView-main">
	</section>
	<div id="bot-container" style="width:100%; height:300px; border:1px solid navy;">
			
	</div>
	<div id="invite-modal">
		<div id="invite-modal-container">
			<div id="invite-modal-title"><div>&nbsp;친구초대<p>X</p></div></div>
			<div id="invite-modal-content">
				<input type="email" name="invite_email" id="invite_email" placeholder="이메일 주소 입력"/>
				<button onclick="fn_invite_member();">초대</button>
				<p>* 5분 이상 메일을 수신하지 못할 경우, 스팸 메일함 확인을 요청하시기 바랍니다.</p>
				<div id="sending_mail">
					<img src="../views/planner/img/sendingMail.gif" width="100px;">
					<p>전송중</p>
				</div>
			</div>
		</div>
	</div>
	<script>
		console.log("<%=userList%>");
		var planList=${jlist};
		//커버 이미지
		var coverImg="<%=coverImg%>";
		$("#cover-container").css("background-image","url('../"+coverImg+"')");

		var html="";

		//커버 일정 날짜 생성
		var date_=new Date('<%=planner.getPlannerDate()%>');
		var dayLong=planList.length;
		html+=date_.getFullYear()+"."+(date_.getMonth()+1)+"."+date_.getDate()+"~";
		date_.setDate(date_.getDate()+dayLong-1);
		html+=date_.getFullYear()+"."+(date_.getMonth()+1)+"."+date_.getDate()+"("+dayLong+"일)";
		$("#planner-etc-date").html(html);
		//개요 테이블 생성
		var outline_html='<div id="planView-outline" class="planView-main-container">';
		outline_html+='<div id="side-navi"></div>';
		outline_html+='<div id="planner-containerNmap"><div id="planner-container"><div id="planner-outline">';
		for(var i=0; i<planList.length; i++){
			outline_html+="<div id='planner-day"+(i+1)+"' class='day-planner'>";
			outline_html+="<table class='day-table'>";
			outline_html+="<tr>";
			outline_html+="<td class='day-day' rowspan='2' colspan='2'>DAY"+(i+1)+"</td>";
			outline_html+="<td class='day-date' colspan='5'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			outline_html+="&nbsp;&nbsp;"+date_.getFullYear()+"년 "+(date_.getMonth()+1)+"월 "+date_.getDate()+"일 ("+returnDay(date_.getDay())+")</td>";
			outline_html+="</tr>";
			outline_html+="<tr>";
			if(typeof(planList[i])=="string"){
				outline_html+="<td class='day-city' colspan='5'>&nbsp;"+planList[i]+"</td>";
				outline_html+="</tr>";
			}else{
				outline_html+="<td class='day-city' colspan='5'>&nbsp;"+planList[i][0]["city"]+"</td>";
				outline_html+="</tr>";
				for(var j=0; j<planList[i].length; j++){
					outline_html+="<tr>";
					outline_html+="<td class='day-num' rowspan='3' colspan='2'>"+(j+1)+"</td>";
					outline_html+="<td class='day-tourImg' rowspan='3'>";
					outline_html+="<img src='<%=request.getContextPath()%>/images/"+planList[i][j]["city"]+"/"+planList[i][j]["tourName"]+"/"+planList[i][j]["tourName"]+"1.jpg' width='100px' height='100px' /></td>";
					outline_html+="<td class='day-tourName' colspan='3'>&nbsp;<span>"+planList[i][j]['tourName']+"</span></td>";
					outline_html+="<td class='day-tour-zoom'><i class='fas fa-info-circle'></i><i class='fas fa-map-marker-alt'></i></td>";
					outline_html+="</tr>";
					outline_html+="<tr>";
					outline_html+="<td class='day-tourType' colspan='2'>&nbsp;&nbsp;<span>"+planList[i][j]['category']+"</span></td>";
					outline_html+="<td class='day-tourScore'><i class='fas fa-paperclip'></i><span> " + planList[i][j]['clipCount'] +" </span><i class='fas fa-star'></i><span> "+planList[i][j]["reviewScore"]+"</span></td>";//수정하기
					outline_html+="<td></td>"
					outline_html+="</tr>";
					outline_html+="<tr>";
					outline_html+="<td colspan='3'></td>";
					outline_html+="</tr>";
					if(j!=planList[i].length-1){
						outline_html+="<tr>";
						outline_html+="<td class='day-tourDistance1'></td>";
						outline_html+="<td class='day-tourDistance2'>&nbsp;"+returnDistance(i, j)+"km</td>";
						outline_html+="</tr>";
					}
				}
			}
			outline_html+="</table>";
			outline_html+="</div>";
		}
		outline_html+="</div></div>";
		outline_html+='<div id="right-side"><div id="side-map"></div></div></div></div>';
		$("#planView-main").append(outline_html);

		//일정표 테이블 생성
		var schedul_html='<div id="planView-schedule" class="planView-main-container">';
		schedul_html+="<table id='planner-schedule-tbl'>";
		schedul_html+="<tr><th>날짜</th><th>도시</th><th>일정</th></tr>";
		for(var i=0; i<planList.length; i++){
			schedul_html+="<tr>";
					schedul_html+="<td class='schedule-day'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			schedul_html+=(date_.getMonth()+1)+"월 "+date_.getDate()+"일 ("+returnDay(date_.getDay())+")";
			schedul_html+="<p class='p-day'>DAY"+(i+1)+"</p></td>";
			schedul_html+="<td class='schedule-city'>ㆍ"+planList[i][0]['city']+"</td>";
			schedul_html+="<td class='schedule-att'>";
			for(var j=0; j<planList[i].length; j++){
				schedul_html+="<p>&nbsp;&nbsp;"+(j+1)+".&nbsp;"+planList[i][j]['tourName']+"</p>";
			}
			schedul_html+="</td></tr>";
		}
		schedul_html+="</table></div>";
		$("#planView-main").append(schedul_html);
		$("#planView-schedule").hide();

		//사이드내비 생성
		html='<input type="button" class="side-navi-btn" onclick="top_go();" value="▲"/>';
		html+="<div id='city-navi'>";
		for(var i=0; i<planList.length; i++){
			html+="<input type='button' class='side-navi-btn' onclick='day_go("+(i+1)+");' value='"+planList[i][0]["city"]+"' />";
		}
		html+="</div>";
		html+='<input type="button" class="side-navi-btn" onclick="bottom_go();" value="▼"/>';
		$("#side-navi").html(html);

		
		//메인맵 내비 생성
		var mmn_html='<div id="main-map">';
		mmn_html+='<div id="main-map-map"></div>';
		mmn_html+='<div id="main-map-navi">';
		mmn_html+='<div id="exit-main"><button id="exit-mainMap" onclick="exit_mainMap();">전체 지도 닫기 X</button></div>';
		for(var i=0; i<planList.length; i++){
			mmn_html+="<div class='mmn-div'>";
			mmn_html+="<input type='hidden' value='"+(i+1)+"' />";
			mmn_html+="<table class='mmn-tbl'>";
			mmn_html+="<tr>";
			mmn_html+="<td class='mmn-day' rowspan='2' colspan='2'>DAY"+(i+1)+"</td>";
			mmn_html+="<td class='mmn-date' colspan='3'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			mmn_html+="<p>"+date_.getFullYear()+"."+(date_.getMonth()+"."+date_.getDate()+1)+"("+returnDay(date_.getDay())+")</p>";
			mmn_html+="<p class='mmn-date-city'>"+planList[i][0]["city"]+"</p></td>";
			mmn_html+="</td>";
			mmn_html+="</table>";
			mmn_html+="</div>";
		}
		mmn_html+="</div></div>";
		$("#planView-main").append(mmn_html);
		$("#main-map").hide();

				
		//초기화
		var cDay=1;
		var map;
		var attrLat_marker;
		var attrLng_marker;
		var markers=[];
		var flightPath;
		var path;
		var markerLat;
		var markerLng;
		

		$(window).ready(function(){
			$(".navs").css("font-weight","");
			$($(".navs")[0]).css("font-weight","bold");
			$($(".side-navi-btn")[1]).css("color","red");
			$("#planView-main").css("height", $("#planner-container").height()+100+"px");
			$("#main-map-map").css("width",$(document).width()-150+"px");
			$('#planTitle>i').hide();
			$("#cover-change").css("opacity",0);
			$("#users").attr("title","<%=users%>");
			
		});

		$(window).resize(function(){
			if($("div#main-map-map").is(':visible')){
				$("#main-map-map").css("width",$("#planView-main").width()-170+"px");
				fn_markerM(mainM);
			}
		});

		//요일 리턴 함수
		function returnDay(day){
			var dayK="";
			switch(day){
				case 0 : dayK="일";break;
				case 1 : dayK="월";break;
				case 2 : dayK="화";break;
				case 3 : dayK="수";break;
				case 4 : dayK="목";break;
				case 5 : dayK="금";break;
				case 6 : dayK="토";break;
			}
			return dayK;
		}

		//거리 리턴 함수
		function returnDistance(i, j){
			var r=6371e3;
			var loc1={lat:planList[i][j]['tourLat'],lng:planList[i][j]['tourLng']};
			var loc2={lat:planList[i][j+1]['tourLat'],lng:planList[i][j+1]['tourLng']};
			var lat1=loc1['lat']/180*3.141592;
			var lat2=loc2['lat']/180*3.141592;
			var lat_del=(loc2['lat']-loc1['lat'])/180*3.141592;
			var lng_del=(loc2['lng']-loc1['lng'])/180*3.141592;
			var a=Math.sin(lat_del/2)*Math.sin(lat_del/2)+Math.cos(lat1)*Math.cos(lat2)*Math.sin(lng_del/2)*Math.sin(lng_del/2);
			var c=2*Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
			var distance=r*c/1000;
			return distance.toPrecision(3);
		}

		//사이드 내비
		function day_go(day){
			var day_top=$("#planner-day"+day).offset().top;
			$('html, section').animate({scrollTop:(day_top-60)}, 800);
		}
		function top_go(){
			var day_top=$("#planner-day1").offset().top;
			$('html, section').animate({scrollTop:(day_top-60)}, 800);
		}
		function bottom_go(){
			var bottom_=$(".footer").offset().top;
			$('html, section').animate({scrollTop:bottom_}, 800);
		}


		//사이드 맵
		
		function initMap(){
      		map = new google.maps.Map(document.getElementById('side-map'), {
			gestureHandling: 'cooperative',
			fullscreenControl:false,
			streetViewControl:false
			});
			polyMarker_draw(map);
			
		}
	
		function polyMarker_draw(map){	
			var lats=[];
			var lngs=[];
			for(var i=0; i<planList[cDay-1].length; i++){
				lats.push(planList[cDay-1][i]['tourLat']);
				lngs.push(planList[cDay-1][i]['tourLng']);
			}
			var bounds=new google.maps.LatLngBounds();
			//화살표 연결
			var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
				flightPath = new google.maps.Polyline({
				geodesic: true,
				icons: [{icon: lineSymbol, offset: '100%', repeat:"100px"}],
				strokeColor: '#FF0000',
				strokeOpacity: 1.0,
				strokeWeight: 2
				});
        	flightPath.setMap(map);

			//마커
			path=flightPath.getPath();
			for(var i=0; i<lats.length; i++){
				var loc=new google.maps.LatLng(lats[i],lngs[i]);
				path.push(loc);
				var marker = new google.maps.Marker(
						{ position: loc, 
						  map: map
						});
				bounds.extend(loc);
				if(planList[cDay-1][i]['tourId'].substring(0,2)=='at'){
					marker.setIcon("<%=request.getContextPath()%>/views/planner/img/camera1.png");
				}else{
					marker.setIcon("https://img.icons8.com/office/40/000000/marker.png");
				}
				markers.push(marker);
			}
				map.panToBounds(bounds);
				map.fitBounds(bounds);
			if(lats.length==1){
				map.setZoom(18);
			}else{

			}
		}

		
		
		
		$(function(){
			//슬라이드에 따른 사이드 지도, 내비 변경
			$(window).scroll(function(){
				var top_planner=$("#planView-main").offset().top;
				var bot_con=$("#bot-container").offset().top;
				if(window.scrollY+500>bot_con){
					$("#right-side").css({"position":"absolute","top":$("#bot-container").offset().top-$(window).scrollTop()+300});
					$("#side-navi").css("position","absolute");
				}else if(window.scrollY>top_planner){
					$("#right-side").css({"position":"fixed", "top":"60px"});
					$("#side-navi").css("position","fixed");
				}else{
					$("#right-side").css({"position":"absolute", "top":"0"});
					$("#side-navi").css("position","fixed");
				}
			});
	
			$(window).scroll(function(){
				var days=$(".day-planner");
				var pathChange_yn=cDay;
				for(var i=0; i<days.length; i++){
					if(window.scrollY>$(days[i]).offset().top-70){
							cDay=i+1;
					}
				}
				if(pathChange_yn!=cDay){
					fn_marker(map);
				}
				var side=$(".side-navi-btn");
				for(var i=0; i<side.length; i++){
					if(i==cDay){
						$(side[i]).css("color","red");
						
					}else{
						$(side[i]).css("color","black");
					}
				}
			});
			//메인내비 클릭 이벤트
			var cPage=0;
			$(".navs").click(function(){
				switch($(this).html()){
					case "개요": fn_outline(this);break;
					case "일정표":fn_schedule(this);break;
					case "지도":fn_mainMap();break;
					default:;
				}
			});


		});
		cPage=0;
		function fn_outline(tag){
			cPage=0;
			$(".navs").css("font-weight","");
			$(".planView-main-container").hide();
			$("#planView-outline").show();
			$("#planView-main").css("height", $("#planner-container").height()+100+"px");
			$(tag).css("font-weight","bold");
			initMap();
		}
		function fn_schedule(tag){
			cPage=1;
			$(".planView-main-container").hide();
			$(".navs").css("font-weight","");
			$(tag).css("font-weight","bold");
			$("#planView-schedule").show();
			$("#planView-main").css("height", $("#planner-schedule-tbl").height()+100+"px");
		}
		function fn_mainMap(){
			$(".planView-main-container").hide();
			cDay=1;
			$(".mmn-div").css({"background-color":"white","color":"navy"});
			$($(".mmn-div")[0]).css({"background-color":"navy","color":"white"});
			$("html, section").scrollTop(0);
			$("html, section").css("overflow-y","hidden");
			$("#main-map").show();
			mainMap();
		}

		function exit_mainMap(){
			$("html, section").css("overflow-y","auto");
			$("#main-map").hide();
			if(cPage==0){
				$("#planView-outline").show();
			}else{
				$("#planView-schedule").show();
			}
			cDay=1;
			fn_marker(map);
		}


		function fn_marker(map){
			flightPath.getPath().clear();
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}	
			markers=[];
			polyMarker_draw(map);
		}




		//메인 맵
		var mainM;
		var markerM;
		var markersM=[];
		var flightPathM;
		var pathM;
		function mainMap(){
			mainM=new google.maps.Map(document.getElementById("main-map-map"),{
				gestureHandling: 'cooperative'
			});
			polyMarkerM_draw(mainM);
		}
		function polyMarkerM_draw(mainM){
			var lats=[];
			var lngs=[];
			for(var i=0; i<planList[cDay-1].length; i++){
				lats.push(planList[cDay-1][i]['tourLat']);
				lngs.push(planList[cDay-1][i]['tourLng']);
			}
			var bounds=new google.maps.LatLngBounds();
			//화살표 연결
			var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
			flightPathM = new google.maps.Polyline({
				geodesic: true,
				icons: [{icon: lineSymbol, offset: '100%', repeat:"100px"}],
				strokeColor: '#FF0000',
				strokeOpacity: 1.0,
				strokeWeight: 2
				});
        	flightPathM.setMap(mainM);

			//마커
			pathM=flightPathM.getPath();
			for(var i=0; i<lats.length; i++){
				var loc=new google.maps.LatLng(lats[i],lngs[i]);
				pathM.push(loc);
				var markerM = new google.maps.Marker({ position: loc, map: mainM });
				bounds.extend(loc);
				markersM.push(markerM);
			}
			mainM.fitBounds(bounds);
			mainM.panToBounds(bounds);
		}
		function fn_markerM(mainM){
			flightPathM.getPath().clear();
			for (var i = 0; i < markersM.length; i++) {
				markersM[i].setMap(null);
			}	
			markersM=[];
			polyMarkerM_draw(mainM);
		}
	
	// var like=false;
	var userId="<%=userId%>";
	var like;
	if(userId!='null'){
		fn_like_tf();
	}else{
		like=false;
	}
	//좋아요 데이터 가져오기
	function fn_like_tf(){
		$.ajax({
			url:"<%=request.getContextPath()%>/user/getLikePlanner",
			type:"get",
			dataType:"text",
			data:{"plannerId":"<%=planner.getPlannerId()%>", "userId":userId},
			success:function(data){
				if(data=='true'){
					$("#like_btn").css({"background-image":"url('../views/planner/img/heart_on.png')","opacity":"1"});
					like=true;
				}else{
					like=false;
				}
			}
		});
	}
	//좋아요버튼 클릭이벤트
	function like_click(){
		if(userId=='null'){
			fn_login();
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/user/likePlanner",
				type:"get",
				dataType:"text",
				data:{"plannerId":"<%=planner.getPlannerId()%>", "userId":userId, "like":""+like}
			});
			if(like){
				$("#like_btn").css({"background-image":"url('../views/planner/img/heart_off.png')","opacity":"0.7"});
				like=false;
			}else{
				$("#like_btn").css({"background-image":"url('../views/planner/img/heart_on.png')","opacity":"1"});
				like=true;
			}
		}
		
	}
	



	//일정 이름 바꾸기
	if(userId!='null'){
		$('#cover-container').mouseover(function(){
			// $(this).css("background-color","#F2F2F2");
			$('#planTitle>i').show();
			$("#cover-change").css("opacity",1);
		});
	}else{
		$("#modify_btn").hide();
	}
	$('#cover-container').mouseleave(function(){
		// $(this).css("background-color", "white");
		$('#planTitle>i').hide();
		$("#cover-change").css("opacity",0);
	});

	$('#planTitle').on('click',function(){
		$(this).hide();
		$('#editTitle').show();
		$("#editT").val($('#title').text().trim());
		$('#titleCnt').text($('#editT').val().length+"/15");
	});
	$('#editBT').on('click',function(){
		$('#editTitle').hide();
		$('#planTitle').show();
		$('#title').text($('#editT').val());

	});
	function fn_lengthCheck(input) {
		var text = $(input).val();
		var maxlength = $(input).prop("maxlength");
		var count = 0;

		for (var i = 0; i < text.length; i++) {
			var ch = escape(text.charAt(i)).length;
			if (ch == 6) {
				count++;
			}

			if (count > maxlength) {
				$(input).val(text.substr(0, 15));
			}
		}

		var totalLength = $(input).val().length;
		$('#titleCnt').text(totalLength+"/15");
    }
	function fn_titleChange(){
		$.ajax({
                url:"<%=request.getContextPath()%>/planner/titleChange",
                type:"get",//default:get
                dataType:"text",
				data:{"title":$("#editT").val(), "plannerId":"<%=planner.getPlannerId()%>"}
            });
	}
	
	//초대하기 함수
	function fn_invite_member(){
		$("#sending_mail").show();
		$.ajax({
				url:"<%=request.getContextPath()%>/invite",
				data:{"email":$("#invite_email").val(),"plannerName":"<%=planner.getPlannerName()%>","plannerId":"<%=planner.getPlannerId()%>"},
				success:function(data){
					alert(data);
					if(data.substring(0,1)=='초'){
						location.reload();
					}else{
						$("#sending_mail").hide();
						$("#invite_email").val("");
					}
				}
			});
	}
	$(function(){
		
		//커버 이미지 바꾸기
		$("#cover-img").change(function(){
			var fd=new FormData();
			// console.log($("#cover-img")[0].files);
			fd.append("cover",$("#cover-img")[0].files[0]);
			fd.append("plannerId", "<%=planner.getPlannerId()%>");
			fd.append("plannerCoverImg", "<%=planner.getPlannerCoverimg()%>");
			$.ajax({
				url:"<%=request.getContextPath()%>/planner/coverChange",
				data:fd,
				type:"post",
				processData:false,
                contentType:false,
				success:function(data){
					$("#cover-container").css("background-image","url('../views/planner/img/coverImg/"+data+"')");

				}
			});
		});

		

		//좋아요버튼 호버
		$("#like_btn").hover(function(){
			if(!like){
				$(this).css({"background-image":"url('../views/planner/img/heart_on.png')","opacity":"0.7"});
			}
		},function(){
			if(!like){
				$(this).css({"background-image":"url('../views/planner/img/heart_off.png')","opacity":"0.7"});
			}
		});

		//초대 클릭이벤트
		$("#planner-member-invite").click(function(){
			$("#invite-modal").show();
			
		});

		//초대 닫기 클릭
		$("#invite-modal-title>div>p").click(function(){
			$("#invite-modal").hide();
		});


		//관광지 줌 클릭이벤트
		$(".day-tour-zoom>.fa-map-marker-alt").click(function(){
			var day_num=$(this).parents().parents(".day-planner").index();
			var city_num=$(this).parents().siblings(".day-num").html()-1;
			if(cDay!=day_num+1){
				cDay=day_num+1;
				fn_marker(map);
			}
			var lats=[];
			var lngs=[];
			for(var i=0; i<planList[cDay-1].length; i++){
				lats.push(planList[cDay-1][i]['tourLat']);
				lngs.push(planList[cDay-1][i]['tourLng']);
			}
			var cityLat=lats[city_num];
			var cityLng=lngs[city_num];
			var cityLatLng=new google.maps.LatLng(cityLat,cityLng);
			map.setCenter(cityLatLng);
			map.setZoom(14);
		});

		//관광지 정보 클릭 이벤트
		$(".day-tour-zoom>.fa-info-circle").click(function(){
			var day_num=$(this).parents().parents(".day-planner").index();
			var city_num=$(this).parents().siblings(".day-num").html()-1;
			open("<%=request.getContextPath()%>/attraction/select?attId="+planList[day_num][city_num]['tourId']);
			
		});

		//메인맵 내비 클릭이벤트
		$(".mmn-div").click(function(){
			cDay=$($(this).children('input')).val();
			fn_markerM(mainM);
			$($(".mmn-div")).css({"background-color":"white","color":"navy"});
			$(this).css({"background-color":"navy","color":"white"});
		});
	
	});
	</script>


	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBREd6GKkpU6OFfj6EFcvSzytsLhZo-s14&callback=initMap"></script>
	

	
<%@ include file="/views/common/footer.jsp" %>