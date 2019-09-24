<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, triptaxi.planner.model.vo.Planner,com.triptaxi.attraction.model.vo.Attraction, java.text.SimpleDateFormat"%>
<%
	List<Attraction[]> list=(List)request.getAttribute("atts");
	Planner planner=(Planner)request.getAttribute("planner");
	int count=0;
	int mapIndex=0;
	String attsLat="";
	String attsLng="";
%>


<%@ include file="/views/common/header.jsp" %>

	<link href="<%=request.getContextPath() %>/css/planView.css" rel="stylesheet">

	
	<section id="header-container">
		<div id="cover-container">
			<div id="cover-content">
				<button id="like_Btn" onclick="like_click();"></button>
			</div>
		</div>
		<div id="planView-nav">
				<div id="navBar">
				<ul>
					<li><a class="navs">개요</a></li>
					<li><a class="navs">일정표</a></li>
					<li><a class="navs">지도</a></li>
					<li><a class="navs">댓글</a></li>
				</ul>
				<input type="button" id="modify_btn" value="수정하기"/>
				<input type="button" id="copy_btn" value="복사하기"/>
			</div>
		</div>
	</section>


	<section id="planView-main">
		<div id="planView-outline" class="planView-main-container">
			<div id="side-navi">
			</div>
			<div id="planner-containerNmap">
				<div id="planner-container">
					<div id="planner-outline">
					</div>
				</div>
				<div id="right-side">
					<div id="side-map">
						<div id="content">
							Hellow world!
						</div>
					</div>
					<div id="side-attrs">

					</div>
				</div>
			</div>
		</div>

		<div id="planView-schedule" class="planView-main-container">
		</div>
		<div id="main-map">
			<div id="main-map-map">

			</div>
			<div id="main-map-navi">
				
			</div>
		</div>
	</section>
	<div id="bot-container" style="width:100%; height:600px; border:1px solid red;">
			
	</div>
	<script>
		//개요 테이블 생성
		var planList=${jlist};
		var html="";
		for(var i=0; i<planList.length; i++){
			html+="<div id='planner-day"+(i+1)+"' class='day-planner'>";
			html+="<table class='day-table'>";
			html+="<tr>";
			html+="<td class='day-day' rowspan='2' colspan='2'>DAY"+(i+1)+"</td>";
			html+="<td class='day-date' colspan='3'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			html+="&nbsp;&nbsp;"+date_.getFullYear()+"년 "+(date_.getMonth()+1)+"월 "+date_.getDate()+"일 ("+returnDay(date_.getDay())+")</td>";
			html+="</tr>";
			html+="<tr>";
			html+="<td class='day-city' colspan='3'>&nbsp;"+planList[i][0]["city"]+"</td>";
			html+="</tr>";
			for(var j=0; j<planList[i].length; j++){
				html+="<tr>";
				html+="<td class='day-num' rowspan='3' colspan='2'>"+(j+1)+"</td>";
				html+="<td class='day-tourImg' rowspan='3'>";
				html+="<img src='<%=request.getContextPath()%>/"+planList[i][j]["imageUrl"]+"' width='100px' height='100px' /></td>";
				html+="<td class='day-tourName' colspan='2'>"+planList[i][j]['attractionName']+"</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='day-tourType'>"+planList[i][j]['category']+"</td>";
				html+="<td class='day-score'>8/10 b</td>";//수정하기
				html+="</tr>";
				html+="<tr>";
				html+="<td colspan='2'></td>";
				html+="</tr>";
				if(j!=planList[i].length-1){
					html+="<tr>";
					html+="<td class='day-tourDistance1'></td>";
					html+="<td class='day-tourDistance2'>&nbsp;"+returnDistance(i, j)+"km</td>";
					html+="</tr>";
				}
			}
			html+="</table>";
			html+="</div>";
		}
		$("#planner-outline").html(html);

		//일정표 테이블 생성
		html="<table id='planner-schedule-tbl'>";
		html+="<tr><th>날짜</th><th>도시</th><th>일정</th></tr>";
		for(var i=0; i<planList.length; i++){
			html+="<tr>";
			html+="<td class='schedule-day'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			html+=date_.getMonth()+"월 "+date_.getDate()+"일 ("+returnDay(date_.getDay())+")";
			html+="<p class='p-day'>DAY"+(i+1)+"</p></td>";
			html+="<td class='schedule-city'>ㆍ"+planList[i][0]['city']+"</td>";
			html+="<td class='schedule-att'>";
			for(var j=0; j<planList[i].length; j++){
				html+="<p>&nbsp;&nbsp;"+(j+1)+".&nbsp;"+planList[i][j]['attractionName']+"</p>";
			}
			html+="</td></tr>";
		}
		html+="</table>";
		$("#planView-schedule").html(html);

		//사이드내비 생성
		html='<input type="button" class="side-navi-btn" onclick="top_go();" value="▲"/>';
		html+="<div id='city-navi'>";
		for(var i=0; i<planList.length; i++){
			html+="<input type='button' class='side-navi-btn' onclick='day_go("+(i+1)+");' value='"+planList[i][0]["city"]+"' />";
		}
		html+="</div>";
		html+='<input type="button" class="side-navi-btn" onclick="bottom_go();" value="▼"/>';
		$("#side-navi").html(html);

		var lats="";
		var lngs="";
		for(var i=0; i<planList.length; i++){
			for(var j=0; j<planList[i].length; j++){
				lats+=planList[i][j]['attractionLat'];
				lngs+=planList[i][j]['attractionLng'];
				if(j<planList[i].length-1){
					lats+=",";
					lngs+=",";
				}
			}
			if(i<planList.length-1){
				lats+="/";
				lngs+="/";
			}
		}
		//메인 내비 생성
		html='<div id="exit-main"><button id="exit-mainMap" onclick="exit_mainMap();">X</button></div>';
		for(var i=0; i<planList.length; i++){
			html+="<div class='mmn-div'>";
			html+="<input type='hidden' value='"+(i+1)+"' />";
			html+="<table class='mmn-tbl'>";
			html+="<tr>";
			html+="<td class='mmn-day' rowspan='2' colspan='2'>DAY"+(i+1)+"</td>";
			html+="<td class='mmn-date' colspan='3'>";
			var date_=new Date('<%=planner.getPlannerDate()%>');
			date_.setDate(date_.getDate()+i);
			html+="<p>"+date_.getFullYear()+"."+date_.getMonth()+"."+date_.getDate()+"("+returnDay(date_.getDay())+")</p>";
			html+="<p class='mmn-date-city'>"+planList[i][0]["city"]+"</p></td>";
			html+="</td>";
			html+="</table>";
			html+="</div>";
		}
		$("#main-map-navi").html(html);
				
		//초기화
		var cDay=1;
		var attrsLat=lats.split("/");
		var attrsLng=lngs.split("/");
		var map;
		var attrLat_marker;
		var attrLng_marker;
		var markers=[];
		var flightPath;
		var path;
		

		$(window).ready(function(){
			$(".planView-main-container").hide();
			$("#planView-outline").show();
			$(".navs").css("font-weight","");
			$($(".navs")[0]).css("font-weight","bold");
			$($(".side-navi-btn")[1]).css("color","red");
			$("#main-map").hide();
			$("#planView-main").css("height", $("#planner-container").height()+100+"px");
			$("#main-map-map").css("width",$("#planView-main").width()-150+"px");
			$($(".mmn-div")[0]).css({"background-color":"lavender","color":"navy"});
		});

		$(window).resize(function(){
			if($("div#main-map-map").is(':visible')){
				$("#main-map-map").css("width",$("#planView-main").width()-170+"px");
				fn_markerM(mainM);
			}
		})

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
			var loc1={lat:planList[i][j]['attractionLat'],lng:planList[i][j]['attractionLng']};
			var loc2={lat:planList[i][j+1]['attractionLat'],lng:planList[i][j+1]['attractionLng']};
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
			ployMarker_draw(map);
			
		}

		function ployMarker_draw(map){
			attrLat_marker=attrsLat[cDay-1].split(",");
			attrLng_marker=attrsLng[cDay-1].split(",");
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
			for(var i=0; i<attrLat_marker.length; i++){
				var loc=new google.maps.LatLng(attrLat_marker[i]*1,attrLng_marker[i]*1);
				path.push(loc);
				var marker = new google.maps.Marker(
						{ position: loc, 
						  map: map
						});
				bounds.extend(loc);
				if(planList[cDay-1][i]['attractionId'].substring(0,2)=='at'){
					marker.setIcon("<%=request.getContextPath()%>/views/images/attraction/camera.png");
				}
				markers.push(marker);
			}
			
			map.fitBounds(bounds);
			map.panToBounds(bounds);
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
			$(".navs").click(function(){
				switch($(this).html()){
					case "개요":$(".navs").css("font-weight","");$(".planView-main-container").hide();$("#planView-outline").show();$("#planView-main").css("height", $("#planner-container").height()+100+"px");$(this).css("font-weight","bold");break;
					case "일정표":$("#planView-main").css("height", $("#planView-schedule").height()+100+"px");$(".navs").css("font-weight","");$(".planView-main-container").hide();$("#planView-schedule").show();$(this).css("font-weight","bold");break;
					case "지도":cDay=1;$(".mmn-div").css({"background-color":"navy","color":"white"});$($(".mmn-div")[0]).css({"background-color":"lavender","color":"navy"});$("html, section").scrollTop(0);$("html, section").css("overflow-y","hidden");$("#main-map").show();mainMap();break;
					default:;
				}
			});


		});
		function exit_mainMap(){
			$("#main-map").hide();
			$("html, section").css("overflow-y","auto");
		}

		function fn_marker(map){
			flightPath.getPath().clear();
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}	
			markers=[];
			ployMarker_draw(map);
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
			ployMarkerM_draw(mainM);
		}
		function ployMarkerM_draw(mainM){
			attrLat_marker=attrsLat[cDay-1].split(",");
			attrLng_marker=attrsLng[cDay-1].split(",");
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
			for(var i=0; i<attrLat_marker.length; i++){
				var loc=new google.maps.LatLng(attrLat_marker[i]*1,attrLng_marker[i]*1);
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
			ployMarkerM_draw(mainM);
		}

	$(function(){
		$(".mmn-div").click(function(){
			cDay=$($(this).children('input')).val();
			fn_markerM(mainM);
			$($(".mmn-div")).css({"background-color":"navy","color":"white"});
			$(this).css({"background-color":"lavender","color":"navy"});
		});
	});	
	

	</script>


	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBREd6GKkpU6OFfj6EFcvSzytsLhZo-s14&callback=initMap"></script>
	

	
<%@ include file="/views/common/footer.jsp" %>