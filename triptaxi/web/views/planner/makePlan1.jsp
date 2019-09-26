<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, triptaxi.planner.model.vo.CityList, com.google.gson.*,org.json.simple.*"%>

<!DOCTYPE html>
<html>

<head>
<title>Plannig</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

<link href="<%=request.getContextPath() %>/css/makePlan1.css"
	rel="stylesheet">
</head>

<body>

	<header>
		<div width="500px">
			<img logo src="" width="150px" height="60px">
			<h3>도시선택 -> 상세일정만들기</h3>
		</div>
		<button id="close" onclick="openCloseModal();">닫기</button>
	</header>
	<nav>
		<ul id="mainMenu">
			<li class="clickColor">Asia</li>
			<li>North<br>America</li>
			<li>Europe</li>
			<li>Australia</li>
			<li>South<br>America</li>
			<li>Africa</li>
		</ul>

	</nav>


	<div id="subMenu">
		<ul>
			<li class="continent">아시아</li>

		</ul>
	</div>

	<div id=selectPopup>
		<div id="selTitle">
			<div id="titleName">여행도시</div>
			<div id="selDate">
				출발일 선택 <i class="fas fa-calendar-alt"></i>
			</div>
			<div id="datepicker"></div>
		</div>
		<!-- selectCity 들어갈 부분 -->

	</div>




	<div id="map"></div>

	<div id="plan1Modal">
		<div id="plan1Modal-content">
			<div id="MoTitle">
				일정표 생성 <img id="closeModal"
					src="<%=request.getContextPath()%>/views/planner/img/closeModal.png"
					alt="" width="20px" height="20px">
			</div>
			<form name="plan1Frm" method="post" >
				<input type="hidden" id="jsonData" name="jsonData" >
				<div id="MoContent">
					<table>
						<tr>
							<th>일정제목</th>
							<td><input type="text" id="planTitle" name="planTitle"
								placeholder="일정 제목을 입력하세요" maxlength="15"
								onkeyup="fn_lengthCheck(this);">
								<div id='titleCnt'>0/15</div></td>
						</tr>
						<tr>
							<th>출발일</th>
							<td><input type="text" id="startDay" name="startDay" readonly>
								<span> <i class="fas fa-calendar-alt"></i>
							</span></td>
						</tr>
					</table>
				</div>
			</form>
			<input type="button" onclick="fn_makePlan();"value="완료">
		</div>
	</div>

	<div id="closeBTModal">
    <div id="closeBTModal-content">
        <div id="cbm-Title">
            닫기 <img id="cbm-ModalClose"
              src="<%=request.getContextPath()%>/views/planner/img/closeModal.png"
              alt="" width="20px" height="20px">
        </div>
      <div id="cbm-Content">
        현재 작업중인 데이터는 저장되지 않습니다.<br><br>
        일정만들기 페이지를 종료하시겠습니까?
      </div>
      <div id="cbm-BTArea">
        <div id="cbmBT-Y">예</div>
        <div id="cbmBT-N">아니오</div>
    </div>
    </div>
  </div>


	<script>
	var lats=[];
	var lngs=[];
	var jsonList;
	const nations = new Set([]);
	var iconBase = '<%=request.getContextPath()%>/views/planner/img/';
	makeCityList(${asiaList});

	
	/* selectPopup 도시 저장용 */
	var choiceCity = [];
	
	
	console.log(${asiaList});
	
    
	
	var markers=[];

	$(document).ready(function () {
      var map_width = $(window).width() - 205;
      var map_height = $(window).height() - 60;
      $('#map').css('width', map_width + 'px');
      $('#map').css("height", map_height + 'px');
     	
    });

    $(window).resize(function () {
      var map_width = $(window).width() - 205;
      var map_height = $(window).height() - 60;
      $('#map').css('width', map_width + 'px');
      $('#map').css("height", map_height + 'px');


    });
    
    function makeCityList(list){
    	
    	jsonList = list;
    	
    	lats=[];
        lngs=[];
       
    	
    	var html="";
    	if(jsonList.length==0){
    		html="<li class='comingsoon'>COMING SOON!</li>";
    	}else{
    		html="";
    		nations.clear();
    	
    	$.each(jsonList,function(index,item){
        	nations.add(item['nationName']);
        	lats.push(item['latitude']);
        	lngs.push(item['longitude']);
        });
    	
    	var iterator = nations.values();
    	
	    for(var i=0;i<nations.size;i++){
	    	var value = iterator.next().value;
	    	html += "<li class='country'>"+value + "</li>";
	    	
    		$.each(jsonList,function(index,item){
	    		if(value == item['nationName']){
	    			html += "<li class='city' onclick='addCity(event);'>"+item['cityName']+"</li>";
	    		}
    		});
	    }
    	}
    	
    	$('.continent').after(html);
    	
    }
	
    var map;

    function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
        gestureHandling: 'cooperative'
      });
      Marker_draw(map);
    }
    
    
    function Marker_draw(map){
    	var beforeIndex;
    	var bounds = new google.maps.LatLngBounds();
    	
    	for(var i=0;i<lats.length;i++){
    		var loc = new google.maps.LatLng(lats[i], lngs[i]);
    		var marker = new google.maps.Marker({position:loc, map:map , icon:iconBase+"marker-40.png" });
    			bounds.extend(loc);
    			markers.push(marker);
    	}
	    	console.log(lats);
	    	console.log(lngs);
    		map.fitBounds(bounds);
    		map.panToBounds(bounds);
    	
    	$(document).on("mouseover", '.city', function(){
 			var ct = $(this).text();
 			var list = jsonList;
    		$.each(list, function(index, item){
    			if(item['cityName']==ct){
    				var latitude = item['latitude'];
    				var longitude = item['longitude'];
    				
    				beforeIndex = index;
    				markers[beforeIndex].setIcon(iconBase+"marker-80.png");
    			}   			
    		});
    		
    	});
    	$(document).on("mouseout", '.city', function(){
    		markers[beforeIndex].setIcon(iconBase+"marker-40.png");
    	})
    	
    }
    



    $('#mainMenu>li').click(function () {

      $('#mainMenu>li').removeClass("clickColor");
      $(this).addClass("clickColor");
      
      $('.country').remove();
      $('.city').remove();
      $('.comingsoon').remove();
      
      var sel;
      switch ($(this).text()) {
        case "Asia": sel = "아시아"; break;
        case "NorthAmerica": sel = "북아메리카"; break;
        case "Europe": sel = "유럽"; break;
        case "Australia": sel = "오스트레일리아"; break;
        case "SouthAmerica": sel = "남아메리카"; break;
        case "Africa": sel = "아프리카"; break;
      }
      $('.continent').text(sel);
      console.log($(this).text());
      $.ajax({
    	  url:"<%=request.getContextPath()%>/cityListAjax",
    	  type:"post",
    	  data:{"continentName" : $(this).text()},
    	  dataType:"json",
    	  success:function(data){  
    		  
    		  makeCityList(data);
    		  
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
    		  }
    	  }
      });
      

    });

    $(function () {
      $("#datepicker").datepicker({
        dayNamesMin: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
        minDate: "0D",
        maxDate: "1Y",
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText) {
          var dateIcon = '<i class="fas fa-calendar-alt"></i>';
          $('div#selDate').text(dateText);
          $('div#selDate').append(" " + dateIcon);
          $('#datepicker').fadeOut(800);
          $('#startDay').val(dateText);
        }
      });
    });

    $('div#selDate').toggle(function () {
      $('div#datepicker').css("display", "block");
    }, function () {
      $('div#datepicker').css("display", "none");
    })

    $(function(){
      $('#startDay').datepicker({
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

     $('#startDay').toggle(function () {
      $('div#ui-datepicker-div').css("display", "block");
    }, function () {
      $('div#ui-datepicker-div').css("display", "none");
    })


    var totalDay=0;

     function removeCity(event) {
         if ($('div.selCity').length == 1) {
           $('div#selectPopup').css("display", "none");
           $('div#selectCity').remove();
           $('div.selButton').remove();
         } else {
        	 console.log($('.cityCloseBt').index($(event.target)));
        	 if($('.cityCloseBt').index($(event.target))==0){
        		 console.log($($(event.target).parent().siblings().children('.roadImg')[0]));
        		 $($(event.target).parent().siblings().children('.roadImg')[0]).remove();	 
        	 }
        	 /* if($('.cityCloseBt').index($(event.target))) */
           $(event.target).parent().remove();
         if ($('div.selCity').length< 6) {
           $('div#selectPopup').css("height", $('div#selectPopup').height() - 65 + "px");
           $('div#selectCity').css("height", $('div#selectCity').height() - 65 + "px");
           $('div#selectCity').css("overflow-y", "visible");
         }
         }
         $('div.selButton').css("top",$('div#selectCity').height()+ "px");
         totalDay = totalDay - $(event.target).siblings().children().text();
         $('#selectCity').attr("totalDay",totalDay);
         
       };



       function addCity(event) {
           var cityName = $(event.target).text();
           console.log($(event.target).text());
           if ($('div#selectPopup').css("display")=="none") {
             $('div#selectPopup').css("display", "block");
             var addDiv = "<div id='selectCity'>";
             addDiv += "<div class='selCity' style=' margin-bottom:18px;'>";
             addDiv += "<img class='cityCloseBt' src='<%=request.getContextPath()%>/views/planner/img/cityCloseBt.png' width='15px' height='15px' onclick='removeCity(event);'>";
             addDiv += "<div class='selCityName'>"
             addDiv += cityName;
             addDiv += "</div>";
             addDiv += "<img class='mButton' onclick='fn_mDayCnt(event)'src='<%=request.getContextPath()%>/views/planner/img/mButton.png' width='15px' height='15px'>";
             addDiv += "<div class='setDay'><span class='setDayCount'>2</span>일</div>"
             addDiv += "<img class='pButton' onclick='fn_pDayCnt(event)' src='<%=request.getContextPath()%>/views/planner/img/pButton.png' width='16px' height='15px'>";
             addDiv += "<div class='tDay'>";
             addDiv += "</div></div></div>";
             addDiv += "<div class='selButton'><div class='makePlanBt' onclick='openModal();'>상세일정만들기</div></div>";
             $('div#selectPopup').append(addDiv);
             $('div#selectCity').css("height", $('div#selectCity').height() + 20 + "px");
             $('div.selButton').css("top",$('div#selectCity').height() + "px");
            
           } else {
             var addDiv2 = "<div class='selCity' style='margin-bottom:18px;'>";
             addDiv2 += "<img class='roadImg' src='<%=request.getContextPath()%>/views/planner/img/road1.png' height='18px'>";
             addDiv2 += "<img class='cityCloseBt' src='<%=request.getContextPath()%>/views/planner/img/cityCloseBt.png' width='15px' height='15px' onclick='removeCity(event);'>";
             addDiv2 += "<div class='selCityName'>"
             addDiv2 += cityName;
             addDiv2 += "</div>";
             addDiv2 += "<img class='mButton' onclick='fn_mDayCnt(event)' src='<%=request.getContextPath()%>/views/planner/img/mButton.png' width='15px' height='15px'>";
             addDiv2 += "<div class='setDay'><span class='setDayCount'>2</span>일</div>"
             addDiv2 += "<img class='pButton' onclick='fn_pDayCnt(event)' src='<%=request.getContextPath()%>/views/planner/img/pButton.png' width='16px' height='15px'>";
             addDiv2 += "<div class='tDay'>";
             addDiv2 += "</div></div>";

          
             if ($('div#selectCity').height() >= 408) {
               $('div#selectCity').css("overflow-y", "scroll");
             }

             $('div#selectCity').append(addDiv2);

             $('div#selectPopup').css("height", $('div#selectPopup').height() + 65 + "px");
             $('div#selectCity').css("height", $('div#selectCity').height() + 65 + "px");
             $('div.selButton').css("top",$('div#selectCity').height()+ "px");
           }
             totalDay=totalDay+2;
             $('#selectCity').attr("totalDay",totalDay);
         };

      
      function fn_mDayCnt(event){
        var day = $(event.target).siblings().children().text();
        if(day==1){
          day=1;
        }else{
          day--;
          totalDay--;
        }
        $(event.target).siblings().children().text(day);
        $('#selectCity').attr("totalDay",totalDay);
      }

      function fn_pDayCnt(event){
        var day = $(event.target).siblings().children().text();

        if(day==30){
          day=30;
        }else{
          day++;
          totalDay++;
        }
        $(event.target).siblings().children().text(day);
        $('#selectCity').attr("totalDay",totalDay);
      }
    

      $('#closeModal').click(function(){
        $('#plan1Modal').css("display","none");

      });

      function openModal(){
        $('#plan1Modal').css("display","block");
      };
     
   
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

      function openCloseModal(){
        console.log($('.selCity').length);
        if($('.selCity').length > 0){
          $('#closeBTModal').css("display", "block");
        }
        else{
        	/* 나중에 Servlet경로로 변경 */
          location.href="<%=request.getContextPath()%>/views/planner/planMain.jsp";
        }
      }

      $('#cbmBT-N,#cbm-Title>img').click(function(){
        $('#closeBTModal').css("display", "none");
      });
      
      $('#cbmBT-Y').click(function(){
    	  /* 나중에 Servlet경로로 변경 */
    	  location.href="<%=request.getContextPath()%>/views/planner/planMain.jsp";
      });
      
      
      function fn_makePlan(){
    	  var dayArr=[];
        for(var i=0;i<$('.selCity').length;i++){
          var city = $($('.selCity')[i]).children('.selCityName').text();
          var count = $($('.selCity')[i]).children().children('.setDayCount').text();
          dayArr.push({city:city,count:count});
        }
        var jsonData = JSON.stringify(dayArr);
        console.log(jsonData);

        console.log(dayArr);
    	  if(plan1Frm_validate()==true){
    		$('#jsonData').val(jsonData);
    		plan1Frm.action="<%=request.getContextPath()%>/makePlan1End";
    		plan1Frm.submit();
  			
  		  }
      }
      
       function plan1Frm_validate(){
    	  if($('#planTitle').val().trim().length!=0 && $('#startDay').val().length!=0){
    		  return true;
    	  }
    	  else if($('#planTitle').val().trim().length==0){
    		  $('#planTitle').focus();
    		  return false;
    	  }
    	  else if($('#startDay').val().length==0){
    		  $('#startDay').focus();
    		  return false;
    	  }
      } 
      
      

  </script>
  
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBREd6GKkpU6OFfj6EFcvSzytsLhZo-s14&callback=initMap"
    async defer></script> -->
	<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?client=sjl0614&v=quarterly&callback=initMap"></script> -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRHnlHeqjt3QdNCzoC3PYBnyPuvr6caE&callback=initMap"></script>

	<footer></footer>
</body>

</html>
