<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="triptaxi.planner.model.vo.Planner"%>
<%
	System.out.println("user : " + session.getAttribute("loginUser"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<link href="<%=request.getContextPath() %>/fontAwesome/css/all.css"
	rel="stylesheet">

<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link href="<%=request.getContextPath() %>/css/makePlan2.css"
	rel="stylesheet">
<title>Insert title here</title>

</head>
<body>

	<header>
		<img logo src="" width="60px" height="60px">
		<div id="planTitle">
			<div id="pltitle"></div>
			<i class="far fa-edit"></i>
		</div>
		<div id="editTitle">
			<form name='titleChangeFrm'>
				<input type="text" id='title' name="title" maxlength="15"
					onkeyup="fn_lengthCheck(this);">
			</form>
			<input type="button" id='editBT' value="수정"
				onclick="fn_titleChange();">
			<div class='titleCnt'>0/15</div>
		</div>
		<button id="close">저장 & 닫기</button>
	</header>


	<nav>
		<ul class="dateInfo">
			<li>
				<div id="fullDate"></div>
				<div id="fullDateEdit">
					<i class="fas fa-cog"></i> EDIT
				</div>
			</li>
			<li id="showFullPlan">서브메뉴 접기</li>
		</ul>
		<ul class="mainMenu">

		</ul>

		<ul id="addDayBox">
			<li>
				<div id="addDay">
					<span>DAY 추가</span>
				</div>
			</li>
		</ul>
		<ul id="userGuide">
			<li><i class="fas fa-book"></i> 이용방법</li>
		</ul>
	</nav>
	<div id="subMenu">
		<ul>
			<li>
				<div id='sm_dayCount'>
					DAY <span>1</span>
				</div>
				<div id="sm_prevBT"><</div>
				<div id="sm_nextBT">></div>
				<div id="sm_date"></div>
				<div id="sm_weekday"></div>
				<div id="sm_refresh">
					<i class="fas fa-redo"></i>
				</div>
			</li>
		</ul>
		<ul id="sm_plannerList">

		</ul>
	</div>
	</div>

	<div id="searchCityMenu">
		<ul>
			<li>
				<div id="sc_title"></div>
				<div id="iconWrap">
					<div class='sc_icon iconColor'>
						<div id='attractionIcon' title="관광지">
							<i class="fas fa-camera"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='activityIcon' title="액티비티">
							<i class="fas fa-running"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='festivalIcon' title="축제">
							<i class="fas fa-drum"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='clipIcon' title="클립보드">
							<i class="fas fa-paperclip"></i>
						</div>
					</div>
				</div>
			</li>
		</ul>

		<ul id='tourListMenu' style="overflow-x: 'hidden'">
			<!-- 관광지, 액티비티, 축제 리스트 들어가는 부분 -->
		</ul>
	</div>
	<div id="searchCityMenuClose"><</div>

	<div id="map"></div>

	<div id="dayEditModal">
		<div id="dayEditModal-content">
			<ul id="dayEditModal-main">
				<li>
					<div id='dayEditClose'>완료</div>
				</li>
				<li>
					<div id="dayEditDate"></div>
					<div id="datepicker"></div>
				</li>
			</ul>

			<ul id="dayEditModal-list">

			</ul>
		</div>
	</div>
	
	<div id='closeModal'>
		<div id='closeModal-content'>
			<div id='cmTitle'>
			일정만들기 완료<img id="closeModalBT"
					src="<%=request.getContextPath()%>/views/planner/img/closeModal.png"
					alt="" width="20px" height="20px">
			</div>
			<form name='makePlanEndFrm' method='post' onsubmit="makePlanEnd_validate();" action="<%=request.getContextPath() %>/makePlan2End">
				<input type="hidden" id="endPlannerId" name="endPlannerId">
				<div id='cmContent'>
					<table>
						<tr>
							<th>일정 제목</th>
							<td><input type="text" id="endPlanTitle" name="endPlanTitle"
								placeholder="일정 제목을 입력하세요" maxlength="15"
								onkeyup="fn_lengthCheck(this);">
								<div class='titleCnt'>0/15</div></td>
						</tr>
						<tr>
							<th>출발일</th>
							<td><input type="text" id="endStartDay" name="endStartDay" readonly>
								<span> <i class="fas fa-calendar-alt"></i>
							</span></td>
						</tr>
						<tr>
							<th>여행 테마</th>
							<td>
								<div class="selectTheme">
									<input type="radio" name="endTheme" value="familyTrip" checked><br>
									<label for="familtTrip"><img src="https://img.icons8.com/ios-filled/64/000000/family--v2.png" width="40px" height="40px"><br>가족여행</label>
								</div>
								<div class="selectTheme">
									<input type="radio" name="endTheme" value="soloTrip"><br>
									<label for="familtTrip"><img src="https://img.icons8.com/ios-filled/50/000000/passenger-with-baggage.png" width="40px" height="40px"><br>나홀로여행</label>
								</div>
								<div class="selectTheme">
									<input type="radio" name="endTheme" value="coupleTrip"><br>
									<label for="familtTrip"><img src="https://img.icons8.com/ios-filled/100/000000/date.png" width="40px" height="40px"><br>커플여행</label>
								</div><br>
								<div class="selectTheme">
									<input type="radio" name="endTheme" value="friendTrip"><br>
									<label for="familtTrip"><img src="https://img.icons8.com/ios/100/000000/friends.png" width="40px" height="40px"><br>친구여행</label>
								</div>
								<div class="selectTheme">
									<input type="radio" name="endTheme" value="businessTrip"><br>
									<label for="familtTrip"><img src="https://img.icons8.com/ios-filled/50/000000/business.png" width="40px" height="40px"><br>비즈니스여행</label>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div id='cmBottom'>
					<input type="checkBox" id='endPublic' name='endPublic' value='N'>
					<label for="endPublic">비공개</label>
					<input type="submit" value="완료">
				</div>
			</form>
		</div>
	</div>
	
	
	<script>
    	const url = new URL(window.location.href);
		var plannerId = url.searchParams.get('plannerId');
		var receiveList = ${list};
		
     	var planner = receiveList['plannerName']; 
      	var dayList = receiveList['dayList'];
      	var tourList = receiveList['attrList'];
      	var date = new Date(receiveList['plannerDate']);
      	var theme = receiveList['plannerTheme'];
      	
      	var lats=[];
    	var lngs=[];
    	var plannerLats=[];
    	var plannerLngs=[];
    	var flightPath;
    	var iconBase = '<%=request.getContextPath()%>/views/planner/img/';
    	var icon;
      
      	var leftDiv = $('.mainMenu').width()+$('#subMenu').width()+$('#searchCityMenu').width();
      	$('#planTitle').mouseover(function(){
           $(this).css("background-color","#F2F2F2");
           $('#planTitle>i').css("color","black");
       	});
       
      	$('#planTitle').mouseleave(function(){
           $(this).css("background-color", "white");
           $('#planTitle>i').css("color","white");
       	});

      	//일정제목 변경
       $('#planTitle').on('click',function(){
         $(this).hide();
         $('#editTitle').show();
         $("#title").val($('#pltitle').text().trim());
         $('.titleCnt').text($('#title').val().length+"/15");
       });
       $('#editBT').on('click',function(){
         $('#editTitle').hide();
         $('#planTitle').show();

         $('#pltitle').text($('#title').val());
       });

       //일정제목 길이 체크함수
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
          $('.titleCnt').text(totalLength+"/15");
        };

      
      $(window).ready(function () {
          var h = $(document).height() - $('.mainMenu').height() - 149;
          var mainMenu = $(document).height() - 250;
          $('.mainMenu').css("max-height", mainMenu + "px");
          $('#addDayBox').css("height", h + "px");
          
          var map_width = $(window).width() - leftDiv;
          var map_height = $(window).height() - 60;
          $('#map').css('width', map_width + 'px');
          $('#map').css("height", map_height + 'px');
          $('#map').css("left", leftDiv + "px");
          $('#dayEditModal-list').css("height", $(window).height()-84 + "px");
          $('#tourListMenu').css("height", $(window).height()-144+"px");
          $('#sm_plannerList').css("height", $(window).height()-144+"px");
          
          //일정리스트 초기설정
          if(dayList[0]['tourList']!=null){
           	var dayTourList = dayList[0]['tourList'].split(',');

			for(var i=0;i<dayTourList.length;i++){
           		var name;
           		var category;
           		var lat;
           		var lng;
           		
           		$.each(tourList, function(index, item){
           			if(item['tourId']==dayTourList[i]){
           		  		name=item['tourName'];
           		  		category=item['category'];
           		  		lat=item['tourLat'];
           		  		lng=item['tourLng'];
           		  	}
           		});
           		
           		fn_addPlanner(dayTourList[i], name, category, lat, lng);
           		plannerLats.push(lat);
           		plannerLngs.push(lng);
           	}
			polyMarker_draw(map);  			
           }
           		  		
           		  		
     	   $('#pltitle').text(planner);
 
     	   //여행기간 설정
			var dateString = date.getFullYear()+"-"+(date.getMonth()+1) + "-"+date.getDate();
			$('#dayEditDate').html(dateString + " <i class='fas fa-calendar-alt'></i>");
			$('#endStartDay').val(dateString);
            var resultDate = calDate(date, dayList.length);
            $('#fullDate').text(date.getMonth()+1+"."+date.getDate()
             					+" ~ "+(resultDate.getMonth()+1)+"."+resultDate.getDate());
            
            //메인메뉴 설정
            $.each(dayList, function(index, item){
           		fn_addDay(item['plannerDayNo'], item['cityName'],date);
            });
          	$('.mainMenu>li:first').addClass("clickColor");
          	$('#sm_date').text($('.clickColor').find('#mm_date').text());
          	$('#sm_weekday').text($('.clickColor').find('#mm_weekday').text());
          	$('#sc_title').text($('.clickColor').find('#mm_city').text());
          				
          				
          	$.each(tourList, function(index, item){
          		addTourList(item);
          		lats.push(item['tourLat']);
          		lngs.push(item['tourLng']);
          	});
          		icon = "atMarker";
          		Marker_draw(map);
           	
        });

        $(window).resize(function () {
          var h = $(window).height() - $('.mainMenu').height() - 213;
          var mainMenu = $(document).height() - 250;
          $('.mainMenu').css("max-height", mainMenu + "px");
          $('#addDayBox').css("height", h + "px");

          var map_width = $(window).width() - leftDiv;
          var map_height = $(window).height() - 60;
          $('#map').css('width', map_width + 'px');
          $('#map').css("height", map_height + 'px');
          $('#map').css("left", leftDiv + "px");
          $('#dayEditModal-list').css("height", $(window).height()-84 + "px");
          $('#tourListMenu').css("height", $(window).height()-144+"px");
          $('#sm_plannerList').css("height", $(window).height()-144+"px");
          
          if($('#tourListMenu').css("height")>=$(window).height()-144+"px"){
        	  $('#tourListMenu').css("overflow-y", "scroll");
          }
          
          if($('#sm_plannerList').css("height")>=$(window).height()-144+"px"){
        	  $('#sm_plannerList').css("overflow-y", "scroll");
        }
          
          
        });

        //메인메뉴 day추가
        function fn_addDay(dayNo, cityName, startDate) {
          var currDate = calDate(startDate, (dayNo-1));
          var add = "<li><div id='mm_dayCount'>DAY <span>" + dayNo;
          add += "</span></div>";
          add += "<div id='mm_date'>"+ (currDate.getMonth()+1)+"."+currDate.getDate() +"</div>";
          add += "<div id='mm_weekday'>"+ returnDay(currDate.getDay()) +"</div>";
          add += "<div id='mm_city'>"+ cityName +"</div></li>";

          $('.mainMenu').append(add);
          $('#addDayBox').css("height", $("#addDayBox").height() - 62 + "px");
          if ($('.mainMenu').height() >= ($(window).height() - 250)) {
            $('.mainMenu').css("overflow-y", "scroll");
          }

        };
        
        //dayedit모달 - day추가 
        function fn_addEditDay(dayNo, cityName, startDate) {
            var currDate = calDate(startDate, (dayNo-1));
            var add = "<li><div class='md_dayCount'>DAY <span>" + dayNo;
            add += "</span></div>";
            add += "<div class='md_weekday'>"+ returnDay(currDate.getDay()) +"</div>";
            add += "<div class='md_date'>"+ (currDate.getMonth()+1)+"."+currDate.getDate() +"</div>";
            add += "<div class='md_city'>"+ cityName +"</div>";
            add += "<div class='delete_md_day'>X</div></li>";

            $('#dayEditModal-list').append(add);
            if ($('#dayEditModal-list').height() >= ($(window).height() - 84)) {
              $('#dayEditModal-list').css("overflow-y", "scroll");
            }

          };
        
        function returnDay(day){
			var dayK="";
			switch(day){
				case 0 : dayK="일요일";break;
				case 1 : dayK="월요일";break;
				case 2 : dayK="화요일";break;
				case 3 : dayK="수요일";break;
				case 4 : dayK="목요일";break;
				case 5 : dayK="금요일";break;
				case 6 : dayK="토요일";break;
			}
			return dayK;
		}

    //투어리스트 추가
    function addTourList(tourList){
    	var tourId = tourList['tourId'];
    	var city = tourList['city'];
    	var tourName = tourList['tourName'];
    	var category = tourList['category'];
    	var clipCount = tourList['clipCount'];
    	var reviewScore = tourList['reviewScore'];
    	var lat = tourList['tourLat'];
    	var lng = tourList['tourLng'];
    	
		var add = "<li class='tourListMenu_li' data-tourId='"+tourId+"' data-lat='"+lat+"' data-lng='"+lng+"'><div class='tourImg'>";
		add += "<img src='<%=request.getContextPath()%>/images/"+city+"/"+tourName+"/"+tourName+"1.jpg' width='90px' height='70px' />";
		add += "</div><div class='rightContent'><div class='tourTitle'";
		if(tourName.length>9){
			add += "style='font-size:11.5px'";
		}
		add += ">" + tourName + "</div>";
		add += "<div class='tourCategory'>" + category + "</div>";
		add += "<div class='tourClip'><i class='fas fa-paperclip'></i> " + clipCount + "</div>";
        add += "<div class='tourScore'><i class='fas fa-star'></i> " + reviewScore + "</div>";
        add += "<div class='plusTour'>+</div></div></li>";
  		
        $('#tourListMenu').append(add);
        if($('#tourListMenu').css("height")>=$(window).height()-144+"px"){
      	  $('#tourListMenu').css("overflow-y", "scroll");
        }
        
    }
		
    	//서브메뉴 접기
        $('#showFullPlan').click(function () {
          $(this).addClass("clickColor");
          $('.mainMenu>li').removeClass("clickColor");
          if($('#subMenu').is(':visible')){
            $('#subMenu').hide();
            $('#searchCityMenu').hide();
            $('#searchCityMenuClose').hide();
            leftDiv=leftDiv-$('#subMenu').width()-$('#searchCityMenu').width();
            $('#map').css('left',$('.mainMenu').width()+"px");
            $('#map').css('width', ($(window).width() - leftDiv) + 'px');
          }
        });

        //서브메뉴 내용 메인메뉴 클릭에 따라 변경하는 함수
        function fn_navTextChange(){
        	$('#sm_dayCount>span').text($('.clickColor').find("#mm_dayCount").children().text());
            $('#sm_date').text($('.clickColor').find('#mm_date').text());
            $('#sm_weekday').text($('.clickColor').find('#mm_weekday').text());
            if($('.clickColor').find('#mm_city').text() != $('#sc_title')){
          	fn_changeTourListCity($('.clickColor').find('#mm_city').text());
            	$('#sc_title').text($('.clickColor').find('#mm_city').text());
            }
        }
        
        //메인메뉴 클릭
        $(document).on("click", '.mainMenu>li', function () {
          $('#showFullPlan').removeClass("clickColor");
          $('.mainMenu>li').removeClass("clickColor");
          $(this).addClass("clickColor");
          
          fn_navTextChange();
			
		  $('#sm_plannerList>li').remove(); 
          
		  if(plannerLats.length>0){
		  	map_clear();
			  
		  }
      	
          $.ajax({
        	url:"<%=request.getContextPath()%>/changeDayList",
        	data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text()},
    		dataType:"json",
    		success:function(data){
    			var list = data;
    			if(list.length>0){
    				
    			$.each(list, function(index,item){
    				fn_addPlanner(item['tourId'],item['tourName'],item['category'],item['tourLat'],item['tourLng']);
    				plannerLats.push(item['tourLat']);
    				plannerLngs.push(item['tourLng']);
    			});
    				
    				polyMarker_draw(map);
    			}else{
    				Marker_draw(map);
    			}
    		}
        	
          })
          
          if(!($('#subMenu').is(':visible'))){
            $('#subMenu').show();
            $('#searchCityMenu').show();
            $('#searchCityMenuClose').show();
            leftDiv=leftDiv+$('#subMenu').width()+$('#searchCityMenu').width();
            $('#map').css('left',(leftDiv+2)+"px");
            $('#map').css('width', ($(window).width() - leftDiv+2) + 'px');
          }
          
        });

        //투어리스트 목록 접기
        $('#searchCityMenuClose').click(function(){
          $(this).show();
          var menuWidth = $('#searchCityMenu').width();
          if($('#searchCityMenu').is(':visible')){
            $('#searchCityMenu').hide();
            $(this).text(">");
            leftDiv=leftDiv-$('#searchCityMenu').width();
            $('#map').css('left',(leftDiv+1)+"px");
            $(this).css("left",(leftDiv+1)+"px");
          }else{
            $('#searchCityMenu').show();
            $(this).text("<");
            leftDiv=leftDiv+$('#searchCityMenu').width();  
            $('#map').css('left',(leftDiv+2)+"px");
            $(this).css("left",(leftDiv+2)+"px");
          }
          
          $('#map').css('width', ($(window).width() - leftDiv) + 'px');

        });

        var map;
     
        //지도 초기화
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
              gestureHandling: 'cooperative',
              mapTypeControlOptions: {
                  style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                  position: google.maps.ControlPosition.TOP_CENTER
              }
            });
            Marker_draw(map);
          }
        
        var markers=[];
        //투어리스트 마커 찍는 함수
        function Marker_draw(map){

        	var beforeIndex;
        	var bounds = new google.maps.LatLngBounds();
        	
        	for(var i=0;i<lats.length;i++){
        		var loc = new google.maps.LatLng(lats[i], lngs[i]);
        		var marker = new google.maps.Marker({position:loc, map:map , icon:iconBase+icon+"-40.png" });
        			bounds.extend(loc);
        			markers.push(marker);
        	}

        		map.fitBounds(bounds);
        		map.panToBounds(bounds);
        		
        		$(document).on("mouseover", '#tourListMenu>li.tourListMenu_li', function(){
         			var ct = $(this).find('.tourTitle').text();
         			var list = tourList;
  
            		$.each(list, function(index, item){
            			if(item['tourName']==ct){
            				
            				beforeIndex = index;
            				markers[beforeIndex].setIcon(iconBase+icon+"-80.png");
            			}   			
            		});
            		
            	});
            	$(document).on("mouseout", '#tourListMenu>li.tourListMenu_li', function(){
            		markers[beforeIndex].setIcon(iconBase+icon+"-40.png");
            	})
        }
        
        var markers2=[];
        //일정리스트 마커, 폴리라인 함수
		function polyMarker_draw(map){	
			var beforeIndex2;
			var Lats=[];
			var Lngs=[];
			
			for(var i=0; i<plannerLats.length; i++){
				lats.push(plannerLats[i]);
				lngs.push(plannerLngs[i]);
			}
			var bounds=new google.maps.LatLngBounds();
			//화살표 연결
			var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
				flightPath = new google.maps.Polyline({
				geodesic: true,
				icons: [{icon: lineSymbol, offset: '100%', repeat:"200px"}],
				strokeColor: '#FF0000',
				strokeOpacity: 1.0,
				strokeWeight: 2
				});
        	flightPath.setMap(map);

    
			//마커
			path=flightPath.getPath();
			for(var i=0; i<plannerLats.length; i++){
				var loc=new google.maps.LatLng(plannerLats[i],plannerLngs[i]);
				path.push(loc);
				var marker = new google.maps.Marker(
						{ position: loc, 
						  map: map,
						  icon:"https://img.icons8.com/office/40/000000/marker.png"
						});
				if(plannerLats.length != 1){
					bounds.extend(loc);	
				}
				markers2.push(marker);
			}
			if(plannerLats.length != 1){
				map.fitBounds(bounds);
				map.panToBounds(bounds);	
			}else{
				map.setZoom(13);
				map.setCenter(new google.maps.LatLng(plannerLats[0],plannerLngs[0]));
			}
			
			$(document).on("mouseover", '#sm_plannerList>li', function(){
	 			beforeIndex2 = $(this).index();
	    		markers2[beforeIndex2].setIcon("https://img.icons8.com/office/80/000000/marker.png");
	    		});   			
		
	    	$(document).on("mouseout", '#sm_plannerList>li', function(){
	    		markers2[beforeIndex2].setIcon("https://img.icons8.com/office/40/000000/marker.png");
	    	})
		}
		
        //일정리스트 맵 초기화
		function map_clear(){
	      	flightPath.getPath().clear(); 	
	      	
			plannerLats=[];
	    	plannerLngs=[];
	   		for(var i=0;i<markers2.length;i++){
	      		markers2[i].setMap(null);
	      	}
	   		markers2=[];
		}

        //일정 초기화
        $('#sm_refresh').click(function(){
          alert("초기화");
          $('#sm_plannerList>li').remove(); 
          
          	map_clear();
      	
      		/* polyMarker_draw(map); */
      		Marker_draw(map); 
      		
      		$.ajax({
        		url:"<%=request.getContextPath()%>/refreshDay",
        		data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text()},
        		dataType:"text"
        	})
        });
        
        //서브메뉴 prev 버튼
        $('#sm_prevBT').click(function(){
        	if($('.clickColor').prev().length!=0){
        		var prev = $('.clickColor').prev();
        		$('.mainMenu>li').removeClass("clickColor");
        		prev.addClass('clickColor');
        		fn_navTextChange();
        		$('#sm_plannerList>li').remove(); 
        		map_clear();
        		flightPath.getPath().clear();
        		
        		$.ajax({
                	url:"<%=request.getContextPath()%>/changeDayList",
                	data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text()},
            		dataType:"json",
            		success:function(data){
            			var list = data;
            			if(list.length>0){
            				$.each(list, function(index,item){
            					fn_addPlanner(item['tourId'],item['tourName'],item['category'],item['tourLat'],item['tourLng']);
            					plannerLats.push(item['tourLat']);
            					plannerLngs.push(item['tourLng']);
            				});	
            			}
            			polyMarker_draw(map);
            		}
                	
                  })
        	}
        	
        })
        
        //서브메뉴  next 버튼
        $('#sm_nextBT').click(function(){
        	if($('.clickColor').next().length!=0){
        		var next = $('.clickColor').next();
        		$('.mainMenu>li').removeClass("clickColor");
        		next.addClass('clickColor');
        		fn_navTextChange();
        		$('#sm_plannerList>li').remove(); 
        		map_clear();
        		flightPath.getPath().clear();
        		
        		$.ajax({
                	url:"<%=request.getContextPath()%>/changeDayList",
                	data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text()},
            		dataType:"json",
            		success:function(data){
            			var list = data;
            			if(list.length>0){
            			$.each(list, function(index,item){
            				fn_addPlanner(item['tourId'],item['tourName'],item['category'],item['tourLat'],item['tourLng']);
            				plannerLats.push(item['tourLat']);
            				plannerLngs.push(item['tourLng']);
            			});
            			polyMarker_draw(map);
            				
            				
            			}
            			
            			
            		}
                	
                  })
        	}
        	
        	
        })

        $('.sc_icon').click(function(){
        	$('.sc_icon').removeClass("iconColor");
        	$(this).addClass("iconColor	");
        });
        
        function calDate(receiveDate, addDay){
            var addDate = new Date(receiveDate);
            var addResult = new Date(addDate.setDate(receiveDate.getDate() + addDay));
              
            return addResult;            
        }
        
        //일정제목 변경 함수
        function fn_titleChange(){
        	if(titleChangeFrm_validate()==true){
        		$.ajax({
        			url:"<%=request.getContextPath()%>/planner/titleChange",
        			type:"post",
        			data:{"title":$('#title').val(),"plannerId":plannerId}
        		});
        		
        	}
        }
        
        //일정제목 길이 검사 함수
        function titleChangeFrm_validate(){
        	if($('#title').val().trim().length!=0){
       		  return true;
       	  	}else if($('#title').val().trim().length==0){
       	  		$('#title').focus();
       	  		return false;
       	  	}
        		
        }

        //달력
        $(function () {
      $("#datepicker").datepicker({
        dayNamesMin: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
        minDate: "0D",
        maxDate: "1Y",
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText) {
          var dateIcon = '<i class="fas fa-calendar-alt"></i>';
          $('div#dayEditDate').text(dateText);
          $('div#dayEditDate').append(" " + dateIcon);
          $('#datepicker').fadeOut(800);
          $('#startDay').val(dateText);
        }
      });
    });

        
    $('div#dayEditDate').toggle(function () {
      $('div#datepicker').css("display", "block");
    }, function () {
      $('div#datepicker').css("display", "none");
    })
    
    $('#fullDateEdit').click(function(){
      $('#dayEditModal').css("display","block");
      
      $.each(dayList, function(index, item){
    	  fn_addEditDay(item['plannerDayNo'], item['cityName'], date)
      })
    })
    
    $('#dayEditClose').click(function(){
    	var newDate = $('#dayEditDate').text();
    	if(date != newDate){
    		$.ajax({
				url:"<%=request.getContextPath()%>/changeStartDate",
    	        type:"post",
    	        data:{"plannerId":plannerId, "date" : newDate},
    	        dataType:"text",
    	        success:function(data){
    	        	if(data=="true"){
    	        		location.reload();
    	        	}
    	        }
    		})
    	}
    });
    
  	//투어리스트 카테고리 변경
    $('.sc_icon').click(function(){
    	var category = $($(this).children()).attr('id');
    	var table;
    	var select=0;
    	switch(category){
    		case "attractionIcon" : table = "tt_attraction"; break;
    		case "activityIcon" : table = "tt_activity"; break;
    		case "festivalIcon" : table = "tt_festival"; select = (date.getMonth()+1);break;
    		case "clipIcon" : table = "tt_clip";  break;
    	}
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/changeTourList",
    		type:"post",
    		data:{"table":table,"cityName": $(this).parent().siblings().text(),"select":select},
    		dataType:"json",
    		success:function(data){
    			tourList = data;
    			
    			if(data.length>0){
    				var category = tourList[0]['tourId'].substring(0,2);
    			
    				switch(category){
    					case "at": icon="atMarker"; break;
    					case "ac": icon="acMarker"; break;
    					case "fe": icon="feMarker"; break;
    					case "cl": icon="clipMarker"; break;
    				}	
    			}
    			
    			fn_resetTourList(tourList);			
    		}
    	});
    });
    
  	//day 삭제
    $(document).on('click', '.delete_md_day',function(){
    	$.ajax({
    		url:"<%=request.getContextPath()%>/deletePlannerDay",
    		type:"post",
    		data:{"plannerId":plannerId,"dayNo": $(this).siblings('.md_dayCount').find('span').text()},
    		dataType:"json",
    		success:function(data){
    			$('#dayEditModal-list>li').remove();
    			dayList = data;
    			$.each(dayList, function(index, item){
    		    	  fn_addEditDay(item['plannerDayNo'], item['cityName'], date)
    		     });
    			
    		}
    	});
    	
    });
    
  	//day 추가
    $('#addDay').click(function(){
    	var city = $('.mainMenu>li:last-child').find('#mm_city').text();
    	var dayNo = $('.mainMenu>li:last-child').find('#mm_dayCount>span').text();
    	$.ajax({
    		url:"<%=request.getContextPath()%>/insertPlannerDay",
    		type:"post",
    		data:{"cityName":city, "dayNo": dayNo,
    				"plannerId":plannerId},
    		dataType:"text",
    		success:function(data){
    			if(data=="true"){
	        		fn_addDay(((dayNo*1)+1), city, date);
	        	}
    		}
    	});
    })
    
    //투어리스트 재설정
    function fn_resetTourList(data){
    	$('#tourListMenu>li').remove(); 
		lats=[];
		lngs=[];
		$.each(data, function(index, item){     
			addTourList(item);
			lats.push(item['tourLat']);
			lngs.push(item['tourLng']);
		});
		
		for(var i=0;i<markers.length;i++){
    		markers[i].setMap(null);
    	}
    	markers=[];
    	
	  	if(data.length>0){
	  		Marker_draw(map);  
	  	}
	  	else{
		  map.setCenter(new google.maps.LatLng(32.982518, 155.563655));
		  map.setZoom(2);
		  var add = "<li style='border:none'><div id='dataNullalertIcon'><i class='fas fa-exclamation-triangle'></i></div>";
		  add += "<div id='dataNullalertContent'>해당하는 데이터가<br>없습니다.</div></li>";
		  $('#tourListMenu').append(add);
	  	}
    }
    
  	//투어리스트 도시 변경
    function fn_changeTourListCity(city){
    	$('.sc_icon').removeClass("iconColor");
    	$('#attractionIcon').parent().addClass("iconColor");
    	$.ajax({
    		url:"<%=request.getContextPath()%>/changeTourListCity",
    		data:{"cityName":city},
    		dataType:"json",
    		success:function(data){
    			tourList = data;
    			fn_resetTourList(tourList);
    		}
    	})
    }
    
  	//일정리스트 추가
    function fn_addPlanner(tourId, tourName, category, lat, lng){
    	switch(tourId.substring(0,2)){
    		case 'at':	img="<i class='fas fa-camera'></i>"; break;
    		case 'ac':	img="<i class='fas fa-running'></i>"; break;
    		case 'fe':	img="<i class='fas fa-drum'></i>"; break;	
    	}
    	
    	var add = "<li data-tourid='"+tourId+"' data-lat='"+lat+"' data-lng='"+lng+"'><div class='sm_plannerListImg'>"+img+"</div>";
    	add += "<div class='sm_plannerDelete'>X</div>";
    	add += "<div class='sm_plannerListTitle'";
    	if(tourName.length>10){
			add += "style='font-size:13px;padding-top:3px;padding-bottom:3px'";
		}
    	add += ">"+tourName+"</div>";
    	add += "<div class='sm_plannerListCategory'>"+category+"</div></li>";
    	$('#sm_plannerList').append(add);
    	
    	if($('#sm_plannerList').css("height")>=$(window).height()-144+"px"){
        	  $('#sm_plannerList').css("overflow-y", "scroll");
        }
    }
    
    //일정 추가
    var firstPlus = 0;
    $(document).on('click', '.plusTour', function(){
    	var img;
    	var tourId=$(this).parent().parent().data('tourid');
    	var tour = $(this).parent().parent().find('.tourTitle').text();
    	var category = $(this).parent().parent().find('.tourCategory').text();
    	var lat = $(this).parent().parent().data('lat');
    	var lng = $(this).parent().parent().data('lng');
    	fn_addPlanner(tourId, tour, category, lat, lng);
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/updateTourList",
    		data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text(),"tourId":tourId},
    		dataType:"text"
    	});
    	
    	if(firstPlus!=0){
    		flightPath.getPath().clear();
    		firstPlus=1;
    	}
    	plannerLats.push(lat);
    	plannerLngs.push(lng);

    	
    	polyMarker_draw(map);
    		
    })
    
    //일정 삭제
    $(document).on('click', '.sm_plannerDelete', function(){
    	map_clear();
    	$(this).parent().remove();
    	var tourList = "";
    	for(var i=0 ; i<$('#sm_plannerList>li').length ;i++){
    		tourList += $($('#sm_plannerList>li')[i]).data('tourid');
    		if(i!=($('#sm_plannerList>li').length-1)){
    			tourList+=",";
    		}
    		plannerLats.push($($('#sm_plannerList>li')[i]).data('lat'));
    		plannerLngs.push($($('#sm_plannerList>li')[i]).data('lng'))
    	} 
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/deleteTourOne",
    		data:{"plannerId":plannerId, "dayNo":$('.clickColor').find('span').text(),"tourList":tourList},
    		dataType:"text"
    	})
    	
    	polyMarker_draw(map);
    
    });
    
    $('#close').click(function(){
    	if(theme==null){
    		$('#closeModal').css("display","block");
    		$('#endPlanTitle').val($('#pltitle').text());
    		$('#endPlannerId').val(plannerId);
    		
    	}else{
    		location.href="<%=request.getContextPath()%>/planner/plannerView?plannerId"+plannerId;
    	}
    	
    	
    });
    $('#closeModalBT').click(function(){
    	$('#closeModal').css("display", "none");
    })
   
    $(function(){
      $('#endStartDay').datepicker({
        dayNamesMin: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
        minDate: "0D",
        maxDate: "1Y",
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText) {
          $('#datepicker').fadeOut(800);
          $('#startDay').val(dateText);
        }
      });
    });

     $('#endStartDay').toggle(function () {
      $('div#ui-datepicker-div').css("display", "block");
    }, function () {
      $('div#ui-datepicker-div').css("display", "none");
    })
    
    function makePlanEnd_validate(){
    	  if($('#endPlanTitle').val().trim().length!=0 && $('#endStartDay').val().length!=0){
    		  return true;
    	  }
    	  else if($('#endPlanTitle').val().trim().length==0){
    		  $('#endPlanTitle').focus();
    		  return false;
    	  }
    	  else if($('#endStartDay').val().length==0){
    		  $('#endStartDay').focus();
    		  return false;
    	  }
      } 

  

      </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRHnlHeqjt3QdNCzoC3PYBnyPuvr6caE&callback=initMap"></script>

</body>
</html>