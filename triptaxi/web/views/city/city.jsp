<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="triptaxi.city.model.vo.City,com.triptaxi.attraction.model.vo.Attraction,java.util.List" %>
<%
	City c=(City)request.getAttribute("City");
%>
<link href="<%=request.getContextPath() %>/css/city.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/swiper.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/swiper.min.js"></script>
<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet">


	<script>
		
		
		$(".hover").mouseleave(
			function () {
				$(this).removeClass("hover");
			}
		);
		
		$(document).ready(
				function() {
					var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
					$(window).scroll(function(event) {
						var y = $(this).scrollTop();
						if ((y + 170) >= top) {
							$('#adside').addClass('fixed').css("top", "20px");
						} else {
							$('#adside').removeClass('fixed');
						}
					});
				});
	</script>

<section id="section">

	<div class="video_con">
		<video autoplay loop muted="false">
			<source src="<%=c.getCityVideoUrl() %>" type="video/mp4">
		</video>
		<div class="video_opacity">
		</div>
		<div class="video_con1">
			<div class="video_con1_1">
				<p><%=c.getCityName() %></p>
			</div>
			<div class="video_con1_2">
				<span id="time">
				</span>
				<span>
					&nbsp;<i class="material-icons">
						flight_land
					</i>&nbsp;<%=c.getFlightTime() %>
				</span>&nbsp;
				<span id="exchange_span">
					<i class="material-icons">
						attach_money
					</i>&nbsp;1<%=c.getErCode() %> = 
				</span>
			</div>
			<div class="video_con1_3">
				<div id="weather_div">
					
				</div>
				<div class="con1_weather">
					<i class="material-icons">
						flight_takeoff
					</i>
					<h3>여행 최적기</h3>
					<p>
						<%=c.getPeakSeason() %>
					</p>
				</div>
				<div>
					<i class="material-icons">
						battery_charging_full
					</i>
					<h3>사용 전압</h3>
					<p>
						<%=c.getNationName() %><br/>
						<%=c.getVolt() %>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="con1_bottom">
		<div class="con1_bottom1">
			<p class="con1_bottom_p1"><%=c.getCityName() %>여행 준비할 때 꼭 필요한 최신의 <%=c.getCityName() %> 여행정보를 보고 있습니다.</p>
			<p class="con1_bottom_p2"><a href="#"><i class="fas fa-angle-double-down"></i>&nbsp다른 여행도시 보기</a></p>
		</div>
	</div>

	<div class="city_content">
		<div class="city_con2" id="adsideWrapper">
				<div class="city_leftmenu" id="adside">
					<h2><%=c.getCityName() %></h2>
					<ul class="city_ul">
						<li><a href="<%=request.getContextPath()%>/citychoice?cityName=<%=c.getCityEng()%>">홈</a></li>
						<li><a href="#" id="tourist">관광지</a></li>
						<li><a href="#" id="activity">액티비티</a></li>
						<li><a href="#" id="festival">축제</a></li>
						<li><a href="#">지도보기</a></li>
					</ul>
			</div>
			<div class="city_right">
				<%-- <div class="right-att">
					<h2><%=c.getCityName() %> / 주요 관광지</h2>
				</div>
				<div class="card card-1">
					<a href="#">
						<div>
							<img src="<%=request.getContextPath() %>/images/다낭/Danang1.jpg" width="250px"/>
						</div>
						<div class="card-att">
							<h3><%=c.getCityName() %> / 미케비치</h3>
							<p>영국 최대의 국립 공공박물관이다. 대영박물관은 과거 영국이 제국주의시대부터 전세계 모든 대륙에서 수집한 방대한 유물들을 소장 및 전시하고 있다.</p>
						</div>
					</a>
				</div> --%>
			
				<div class="bxslider">
					<!-- <div>
						<img src="../../1.jpg" height="300" title="#" />
					</div> -->
				</div>
				<div class="city_right1">
					<p><%=c.getCityIntro() %></p>
				</div>
	
				<div class="city_schedule">
					<h2><%=c.getCityName() %>여행 추천일정</h2>
					<div class="city_schedule1">
						<!-- <figure class="snip1382">
							<a href="#"> <img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample96.jpg" />
								<figcaption>
									<h2>Gustav Purpleson</h2>
									<p>Weekends don't count unless you spend them doing
										something completely pointless.</p>
								</figcaption>
							</a>
						</figure> -->
						
					</div>
				</div>
				
				
				<div class="city_tourlist">
					<h2>주요 관광지</h2>
					<br />
					<div class="tourlist1">
							<div class="swiper">
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				     	 <!--  <div class="swiper-slide">
					      	  <img src="../../4.jpg" width="400" height="320"/>
					      	  <div class="swiper-slide_right">
									<h2>영국 박물관&브룸즈버리 지역</h2>
									<p>영국 박물관 주변을 브룸즈버리 지역이라고 통칭한다.
									King's Cross기차역을 중심으로 영국 도서관, 찰스 디킨스 박물관 등이 모두 이곳에
									 몰려 있는데 동선을 잘 짜면 꽤 근사한 일정이 완성된다. 
									걸어서 다닐정도로 가까운 편이라 느긋느긋 산책을 즐기면서 둘러보는 것을 추천한다.</p>
									<br>
									<p class="red"><i class="fas fa-exclamation-triangle"></i> 영국 박물관은 많은 여행자가 몰리기 때문에 아침 일찍 찾는것을 추천한다.</p>
									<br/>
									<div>
										<button onclick="" />자세히 보기</button>
									</div>
							  </div>
					   	  </div> -->
					    </div>
					    <!-- Add Pagination -->
					    
					    <!-- Add Arrows -->
					    <!-- <div class="swiper-button-next"></div>
					    <div class="swiper-button-prev"></div> -->
					  </div>
				</div>
							<div class="swiper-pagination"></div>
							<div>
						</div>
					</div>
				</div>
				<div class="city_pdf">
					<div class="pdf_con">
						<p>
							<%=c.getCityName()%>의 대한 여행 TIP!<br>
							트립택시에서 여행객들을 위한 <%=c.getCityName()%>여행 PDF파일을 제공합니다.
						</p>
					</div>
					<div>
						<div class="pdf_con2">
							<a href="<%=request.getContextPath()%>/pdf/<%=c.getCityEng()%>.pdf" download>
								파일 다운로드
								<i class="material-icons hvr-pulse-grow">
									system_update_alt
								</i>
							</a>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	

	
	
		

</section>

	<script>   
	
	
	
	$(function(){
		$(document).ready(function(){
				var slideArr="";
				var imgUrl="<%=c.getImageUrl()%>".split(",");
				for(var i=0 ; i<imgUrl.length ; i++){
					slideArr+="<div>";
					slideArr+="<img src='<%=request.getContextPath()%>"+imgUrl[i]+"' height='400' title='<%=c.getCityName()%>' />";
					slideArr+="</div>";
				}
				$(".bxslider").html(slideArr);
				
				$('.bxslider').bxSlider({
		            slideWidth: 800,
		            controls : false,
		            auto : true,
		            pause : 3000,
		            mode : "fade",
		            captions: true
		        	});
		});
	});
	
	$(function(){
		$(document).ready(function(){
			setInterval(function(){
				var time=new Date();
				var year = time.getFullYear();
				var hour = time.getHours()<%=c.getTimeDiffence()%>;
			    var minute = time.getMinutes();
			    var second = time.getSeconds();
				$("#time").html("<i class='material-icons'>alarm</i>&nbsp;현재시간 : "+hour+"시 "+minute+"분 "+second+"초 (시차 "+<%=c.getTimeDiffence()%>+"시간)");
			},1000);
		});
	});
	
	
	 $(function(){
		 $(document).ready(function(){
			 $.ajax({
					url:"<%=request.getContextPath()%>"+"/city/plan?cityName="+"<%=c.getCityName()%>",
					type:"post",
					success:function(data){
						console.log(data);
						var planArr="";
						 for(var i=0; i<data.length; i++){
							planArr+="<figure class='snip1382'>";
							planArr+="<a href='#'>";
							planArr+="<img src=<%=request.getContextPath()%>"+data[i]["plannerCoverimg"]+">";
							planArr+="<figcaption>";
							planArr+="<h2>"+data[i]["plannerName"]+"</h2>";
							planArr+="<p>"+data[i]["plannerTheme"]+"</p>";
							planArr+="</figcaption>";
							planArr+="</a>";
							planArr+="</figure>";
						} 
						 $(".city_schedule1").append(planArr);
					}
			 });
		 });
	 });
	  
	window.onload=$(function (){
		$(document).ready(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>"+"/city/attraction?cityName="+"<%=c.getCityName()%>",
				type:"post",
				success:function(data){
					console.log(data);
					/* console.log(data[0]["imageUrl"]); */
					 var attArr="";
					for(var i=0; i<data.length; i++){
						var attImg=data[i]["imageUrl"].split(",");
						attArr+="<div class='swiper-slide'>";
						attArr+="<img src='<%=request.getContextPath() %>/images/<%=c.getCityName()%>/"+data[i]['attractionName']+"/"+attImg[0]+"' width='400' height='320' />";
						attArr+="<div class='swiper-slide_right'>";
						attArr+="<h2>"+data[i]['attractionName']+"</h2>";
						attArr+="<p>"+data[i]['attractionComment']+"</p><br>";
						attArr+="<p class='red'>category : <i class='material-icons'>thumb_up</i>"+data[i]['category']+"</p><br>";
						attArr+="<div>";
						attArr+="<button onclick=''>자세히 보기</button>";
						attArr+="</div>";
						attArr+="</div>";
						attArr+="</div>";
					}
					$(".swiper-wrapper").append(attArr);
					var arrArr2="";
					arrArr2+="<div class='swiper-button-next'></div>";
					arrArr2+="<div class='swiper-button-prev'></div>";
					$(".swiper-container").append(arrArr2); 
					
					 var swiper = new Swiper('.swiper-container', {
					      pagination: {
					        el: '.swiper-pagination',
					        type: 'fraction',
					      },
					      navigation: {
					        nextEl: '.swiper-button-next',
					        prevEl: '.swiper-button-prev',
					      },
					    });
				}
			});
		});
	});
	$(function (){
		$("#festival").on('click', function () {
			$.ajax({
				url:"<%=request.getContextPath() %>/page/festival?cityName=<%=c.getCityName() %>",
				type:"post",
				success:function(data){
					console.log(data);
					var attDiv="";
					if(data.length!=0){
						for(var i=0;i<data.length;i++){
							  var attImg=data[i]["imageUrl"].split(",");
							  attDiv += "<div class='card card-1'>";
							  attDiv += "<a href='#'>";
							  attDiv += "<img src='<%=request.getContextPath() %>/images/<%=c.getCityName()%>/"+data[i]['attractionName']+"/"+attImg[0]+"'/>";
							  attDiv += "<div class='card-att'>";
							  attDiv += "<h3><%=c.getCityName() %> / "+data[i]["attractionName"]+"</h3>";
							  attDiv += "<p>"+data[i]["attractionComment"]+"</p></div></a></div>";
						}
						var atth2="";
						atth2+="<div class='right-att'>";
						atth2+="<h2><%=c.getCityName() %> / Festival</h2>";
						atth2+="</div>";
						$(".city_right").html(atth2);
						$(".city_right").append(attDiv);
						$("#section").css("height",$(".card").height()*7.5);
					}else{
						var nullfestival="";
						nullfestival+="<img src='<%=request.getContextPath()%>/images/commingsoon.png' />";
						$("section").css("height","770px");
						$(".city_right").html(nullfestival);
					}
				}
			});
		});
	});
	
	
	
	$(function (){
		$("#activity").on('click', function () {
			$.ajax({
				url:"<%=request.getContextPath() %>/page/activity?cityName=<%=c.getCityName() %>",
				type:"post",
				success:function(data){
					console.log(data);
					var attDiv="";
					if(data.length!=0){
					for(var i=0;i<data.length;i++){
						  var attImg=data[i]["imageUrl"].split(",");
						  attDiv += "<div class='card card-1'>";
						  attDiv += "<a href='#'>";
						  attDiv += "<img src='<%=request.getContextPath() %>/images/<%=c.getCityName()%>/"+data[i]['attractionName']+"/"+attImg[0]+"'/>";
						  attDiv += "<div class='card-att'>";
						  attDiv += "<h3><%=c.getCityName() %> / "+data[i]["attractionName"]+"</h3>";
						  attDiv += "<p>"+data[i]["attractionComment"]+"</p></div></a></div>";
					}
					var atth2="";
					atth2+="<div class='right-att'>";
					atth2+="<h2><%=c.getCityName() %> / Activity</h2>";
					atth2+="</div>";
					$(".city_right").html(atth2);
					$(".city_right").append(attDiv);
					$("#section").css("height",$(".card").height()*4.8);
					}else{
						var nullactivity="";
						nullactivity+="<img src='<%=request.getContextPath()%>/images/commingsoon.png' />";
						$(".city_right").html(nullactivity);
						$("section").css("height","770px");
					}
				}
			});
		});
	});
	
	$(function (){
		$("#tourist").on('click', function () {
			$.ajax({
				url:"<%=request.getContextPath() %>/page/attraction?cityName=<%=c.getCityName() %>",
				type:"post",
				success:function(data){
					console.log(data);
					var attDiv="";
					for(var i=0;i<data.length;i++){
						  var attImg=data[i]["imageUrl"].split(",");
						  attDiv += "<div class='card card-1'>";
						  attDiv += "<a href='#'>";
						  attDiv += "<img src='<%=request.getContextPath() %>/images/<%=c.getCityName()%>/"+data[i]['attractionName']+"/"+attImg[0]+"'/>";
						  attDiv += "<div class='card-att'>";
						  attDiv += "<h3><%=c.getCityName() %> / "+data[i]["attractionName"]+"</h3>";
						  attDiv += "<p>"+data[i]["attractionComment"]+"</p></div></a></div>";
					}
					var atth2="";
					atth2+="<div class='right-att'>";
					atth2+="<h2><%=c.getCityName() %> / Tourist Spot</h2>";
					atth2+="</div>";
					$(".city_right").html(atth2);
					$(".city_right").append(attDiv);
					$("#section").css("height",$(".card").height()*6.5);
				}
			});
		});
	});


	$(function(){
		$(document).ready(function(){
		      $.ajax({          
		            url: "<%=request.getContextPath() %>/exChange",
		            type: 'get',
		            dataType: 'json',
		            success: function(data){
		            	for(var i=0 ; i<22 ;i++){
		            		 if(data[i]["cur_unit"]=="<%=c.getErCode() %>"){
		            			var exchange=data[i]["deal_bas_r"]
		            		} 
		            	}
		            	$("#exchange_span").append(exchange+"원 (평일 기준)");
		            }
		        });  
		  });
	});

	$(function(){
		$(document).ready(function(){
			var city=("<%=c.getCityName()%>"=='나트랑'?'Danang':"<%=c.getCityEng()%>");
			console.log(city);
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&appid=98d4971f2e14753dd582c6f4443133d8";
		    $.ajax({
		        url: apiURI,
		        dataType: "json",
		        type: "GET",
		        async: "false",
		        success: function(data) {
		        	var wetherArr="";
		        	wetherArr+="<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' width='60px' height='60px' style='margin-bottom:-20px;'/>";
		        	wetherArr+="<h3>현재날씨</h3>";
		        	wetherArr+="<p>현재온도 : "+Math.ceil(data.main.temp)+"도<br>현재습도 : "+data.main.humidity+"%</p>";
		        	
		        	$("#weather_div").html(wetherArr);

		        	console.log(data);
		            console.log("현재온도 : "+ data.main.temp );
		            console.log("현재온도 : "+ Math.ceil(data.main.temp));
		            console.log("현재습도 : "+ data.main.humidity);
			        console.log("날씨 : "+ data.weather[0].main );
		            console.log("상세날씨설명 : "+ data.weather[0].description );
		            console.log("날씨 이미지 : "+ data.weather[0].icon );
		            console.log("바람   : "+ data.wind.speed );
		            console.log("나라   : "+ data.sys.country );
		            console.log("도시이름  : "+ data.name );
		            console.log("구름  : "+ (data.clouds.all) +"%" );                 
		        }
		    })
		});
	});
		
   
  </script>

<%@ include file="/views/common/footer.jsp"%>