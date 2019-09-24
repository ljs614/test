<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>
<!-- jquery 경로 수정해야됨 -->
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<link href="<%=request.getContextPath() %>/css/makePlan2.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>

    <header>
        <img logo src="" width="60px" height="60px">
        <div id="planTitle">
          <div id="title">
            가나다라마바사아자차카타파하하
          </div>
          <i class="far fa-edit"></i>
        </div>
        <div id="editTitle">
          <form action="">
            <input type="text" id='editT' name="editT" maxlength="15" onkeyup="fn_lengthCheck(this);">
            <input type="button" id='editBT' value="수정">
          </form>
          <div id='titleCnt'>0/15</div>
        </div> 
        <button id="close">저장 & 닫기</button>
      </header>


      <nav>
        <ul class="dateInfo">
          <li>
            <div id="fullDate">00.00 ~ 00.00</div>
            <div id="fullDateEdit"><i class="fas fa-cog"></i> EDIT</div>   
          </li>
          <li id="showFullPlan">전체일정보기</li>
        </ul>
        <ul class="mainMenu">
          <li class="clickColor">
            <div id="mm_dayCount">DAY <span>1</span></div>
            <div id="mm_date">00.00</div>
            <div id="mm_weekday">일요일</div>
            <div id="mm_city">서울</div>
          </li>
          <li>
            <div id="mm_dayCount">DAY <span>2</span></div>
            <div id="mm_date">00.00</div>
            <div id="mm_weekday">일요일</div>
            <div id="mm_city">서울</div>
          </li>
        </ul>
      
        <ul id="addDayBox" onclick='fn_addDay();'>
          <li>
            <div id="addDay"><span>DAY 추가</span></div>
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
            <div id="sm_refresh"><i class="fas fa-redo"></i></div>
          </li>
        </ul>
      </div>
    </div>

    <div id="searchCityMenu">
      <ul>
        <li>
          <div id="sc_title">서울</div>
          <div id="iconWrap">
          <div class='sc_icon' id="attractionIcon"><i class="fas fa-camera"></i></div>
          <div class='sc_icon' id="activityIcon"><i class="fas fa-running"></i></div>
          <div class='sc_icon' id="festivalIcon"><i class="fas fa-drum"></i></div>
          <div class='sc_icon' id="clipIcon"><i class="fas fa-paperclip"></i></div>
        </div>
        </li>
      </ul>
    </div>
    <div id="searchCityMenuClose"><</div>


      <div id="map"></div>
    <script>
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
        };

      $(window).ready(function () {
          var h = $(document).height() - $('.mainMenu').height() - 213;
          var mainMenu = $(document).height() - 250;
          $('.mainMenu').css("max-height", mainMenu + "px");
          $('#addDayBox').css("height", h + "px");
          $('#sm_date').text($('.clickColor').find('#mm_date').text());
          $('#sm_weekday').text($('.clickColor').find('#mm_weekday').text());
          
          var map_width = $(window).width() - leftDiv;
          var map_height = $(window).height() - 60;
          $('#map').css('width', map_width + 'px');
          $('#map').css("height", map_height + 'px');
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

        function fn_addDay() {
          var day = $('.mainMenu>li:last-of-type').children().first().children().text() * 1;
          var add = "<li><div id='mm_dayCount'>DAY <span>" + (day + 1);
          add += "</span></div>";
          add += "<div id='mm_date'>00.00</div>";
          add += "<div id='mm_weekday'>일요일</div>";
          add += "<div id='mm_city'>서울</div></li>";

            console.log($(document).height()-235);
          $('.mainMenu').append(add);
          $('#addDayBox').css("height", $("#addDayBox").height() - 62 + "px");
          if ($('.mainMenu').height() >= ($(window).height() - 250)) {
            $('.mainMenu').css("overflow-y", "scroll");
          }

        };

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

        $('.sc_icon').click(function(){
        	$('.sc_icon').removeClass("iconColor");
        	$(this).addClass("iconColor	");
        });

      </script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRHnlHeqjt3QdNCzoC3PYBnyPuvr6caE&callback=initMap"></script>

</body>
</html>