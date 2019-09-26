<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="triptaxi.planner.model.vo.Planner"%>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

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
				<input type="button" id='editBT' value="수정" onclick="fn_titleChange();">
			<div id='titleCnt'>0/15</div>
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
			<li id="showFullPlan">전체일정보기</li>
		</ul>
		<ul class="mainMenu">

		</ul>

		<ul id="addDayBox" onclick='fn_addDay();'>
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
				<div id='sm_dayCount'>DAY 1</div>
				<div id="sm_prevBT"><</div>
				<div id="sm_nextBT">></div>
				<div id="sm_date"></div>
				<div id="sm_weekday"></div>
				<div id="sm_refresh">
					<i class="fas fa-redo"></i>
				</div>
			</li>
		</ul>
	</div>
	</div>

	<div id="searchCityMenu">
		<ul>
			<li>
				<div id="sc_title"></div>
				<div id="iconWrap">
					<div class='sc_icon iconColor'>
						<div id='attractionIcon'>
							<i class="fas fa-camera"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='activityIcon'>
							<i class="fas fa-running"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='festivalIcon'>
							<i class="fas fa-drum"></i>
						</div>
					</div>
					<div class='sc_icon'>
						<div id='clipIcon'>
							<i class="fas fa-paperclip"></i>
						</div>
					</div>
				</div>
			</li>
		</ul>
		
		<ul id='tourListMenu'>
      		
		</ul>
	</div>
	<div id="searchCityMenuClose"><</div>


	<div id="map"></div>
	<script>
    	const url = new URL(window.location.href);
		var plannerId = url.searchParams.get('plannerId');
		
      	var planner;
      	var dayList;
      	var tourList;
      
      	var leftDiv = $('.mainMenu').width()+$('#subMenu').width()+$('#searchCityMenu').width();
       	
      	$('#planTitle').mouseover(function(){
           $(this).css("background-color","#F2F2F2");
           $('#planTitle>i').css("color","black");
       	});
       
      	$('#planTitle').mouseleave(function(){
           $(this).css("background-color", "white");
           $('#planTitle>i').css("color","white");
       	});

       $('#planTitle').on('click',function(){
         $(this).hide();
         $('#editTitle').show();
         $("#title").val($('#pltitle').text().trim());
         $('#titleCnt').text($('#title').val().length+"/15");
       });
       $('#editBT').on('click',function(){
         $('#editTitle').hide();
         $('#planTitle').show();

         $('#pltitle').text($('#title').val());
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
          
          $.ajax({
           	  url:"<%=request.getContextPath()%>/makePlan2",
           	  type:"post",
           	  data:{"plannerId":plannerId},
           	  dataType:"json",
           	  success:function(data){
           		  	planner=data['plannerName'];
             			dayList = data['dayList'];
           		  	
     				  	$('#pltitle').text(data['plannerName']);
             			var date = new Date(data['plannerDate']);
        
             			var resultDate = calDate(date, dayList.length);
             			$('#fullDate').text(date.getMonth()+1+"."+date.getDate()
             					+" ~ "+(resultDate.getMonth()+1)+"."+resultDate.getDate());
             			
             			$.each(dayList, function(index, item){
           	  				fn_addDay(item['plannerDayNo'], item['cityName'],date);
             			});
          				$('.mainMenu>li:first').addClass("clickColor");
          				$('#sm_date').text($('.clickColor').find('#mm_date').text());
          				$('#sm_weekday').text($('.clickColor').find('#mm_weekday').text());
          				$('#sc_title').text($('.clickColor').find('#mm_city').text());
          				
          				console.log(data['attrList']);
          				tourList = data['attrList'];
          				$.each(tourList, function(index, item){
          					console.log(item['city']);
          					addTourList(item['city'], item['tourName'], item['category'], item['clipCount'], item['reviewScore']);
          				});
           	  }
           	  
             });
     
        });

        $(window).resize(function () {
          var h = $(window).height() - $('.mainMenu').height() - 213;
          var mainMenu = $(document).height() - 250;
          $('.mainMenu').css("max-height", mainMenu + "px");
          $('#addDayBox').css("height", h + "px");
          console.log($('#leftDiv').width());
          // console.log(mainMenu);
          var map_width = $(window).width() - leftDiv;
          var map_height = $(window).height() - 60;
          $('#map').css('width', map_width + 'px');
          $('#map').css("height", map_height + 'px');
          
        });

        
        function fn_addDay(dayNo, cityName, startDate) {
          var currDate = calDate(startDate, (dayNo-1));
          var add = "<li><div id='mm_dayCount'>DAY <span>" + dayNo;
          add += "</span></div>";
          add += "<div id='mm_date'>"+ (currDate.getMonth()+1)+"."+currDate.getDate() +"</div>";
          add += "<div id='mm_weekday'>"+ returnDay(currDate.getDay()) +"</div>";
          add += "<div id='mm_city'>"+ cityName +"</div></li>";

            console.log($(document).height()-235);
          $('.mainMenu').append(add);
          $('#addDayBox').css("height", $("#addDayBox").height() - 62 + "px");
          if ($('.mainMenu').height() >= ($(window).height() - 250)) {
            $('.mainMenu').css("overflow-y", "scroll");
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

    function addTourList(city, tourName, category, clipCount, reviewScore){
    	console.log("들어감");
		var add = "<li><div class='tourImg'>";
		add += "<img src='<%=request.getContextPath()%>/images/"+city+"/"+tourName+"/"+tourName+"1.jpg' width='90px' height='70px' />";
		add += "</div><div class='rightContent'><div class='tourTitle'>" + tourName + "</div>";
		add += "<div class='tourCategory'>" + category + "</div>";
		add += "<div class='tourClip'><i class='fas fa-paperclip'></i> " + clipCount + "</div>";
        add += "<div class='tourScore'><i class='fas fa-star'></i> " + reviewScore + "</div></div></li>";
  		
        $('#tourListMenu').append(add);
        $('#tourListMenu').css("height", $('#tourListMenu').height()+76+"px");
        if ($('#tourListMenu').height() >= ($(window).height() - 83)) {
          $('#tourListMenu').css("overflow-y", "scroll");
        }
        
    }

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

        $(document).on("click", '.mainMenu>li', function () {
          $('#showFullPlan').removeClass("clickColor");
          $('.mainMenu>li').removeClass("clickColor");
          $(this).addClass("clickColor");
          $('#sm_dayCount').text($(this).children().first().text());
          $('#sm_date').text($(this).find('#mm_date').text());
          $('#sm_weekday').text($(this).find('#mm_weekday').text());
          $('#sc_title').text($('.clickColor').find('#mm_city').text());
          console.log($(this).find('#mm_date').text());

          if(!($('#subMenu').is(':visible'))){
            $('#subMenu').show();
            $('#searchCityMenu').show();
            $('#searchCityMenuClose').show();
            leftDiv=leftDiv+$('#subMenu').width()+$('#searchCityMenu').width();
            $('#map').css('left',(leftDiv+2)+"px");
            $('#map').css('width', ($(window).width() - leftDiv+2) + 'px');
          }
        });

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
        var d = { lat: 37.551326, lng: 126.957865 };
        function initMap() {
          map = new google.maps.Map(document.getElementById('map'), {
            center: d,
            zoom: 10,
            gestureHandling: 'cooperative',
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                position: google.maps.ControlPosition.TOP_CENTER
            }
          });

          // google.maps.event.addListener(map,'click',function(event){
          //   placeMarker(event.latLng);
          // });

          var marker = new google.maps.Marker({ position: d, map: map });

        }

        $('#sm_refresh').click(function(){
          alert("초기화");
        });
        
        $('#sm_prevBT').click(function(){
        	
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
        
        function fn_titleChange(){
        	if(titleChangeFrm_validate()==true){
        		$.ajax({
        			url:"<%=request.getContextPath()%>/planner/titleChange",
        			type:"post",
        			data:{"title":$('#title').val(),"plannerId":plannerId}
        		});
        		
        	}
        }
        
        function titleChangeFrm_validate(){
        	if($('#title').val().trim().length!=0){
       		  return true;
       	  	}else if($('#title').val().trim().length==0){
       	  		$('#title').focus();
       	  		return false;
       	  	}
        		
        }
        
        
        

      </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRHnlHeqjt3QdNCzoC3PYBnyPuvr6caE&callback=initMap"></script>

</body>
</html>