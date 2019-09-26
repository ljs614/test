<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="triptaxi.city.model.vo.City" %>
<link href="<%=request.getContextPath() %>/css/city.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/swiper.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/swiper.min.js"></script>
<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet">
<%
	City c=(City)request.getAttribute("City");
	String[] getImgUrl=c.getImageUrl().split(",");
%>

	<script>
		$(document).ready(function(){
        $('.bxslider').bxSlider({
            slideWidth: 800,
            controls : false,
            auto : true,
            pause : 3000,
            mode : "fade",
            captions: true
        	});
        });
		
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

<section>
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
				<span id="time"></span>
				<span><%=c.getFlightTime() %></span>
				<span>1EUR = 1,316.15원</span>
			</div>
			<div class="video_con1_3">
				<div>
					<i class="fas fa-cloud-sun"></i>
					<h3>현지 날씨</h3>
					<p>
						최저 19 /최고 27℃ <br />
						<a href="#">월별 날씨 보기</a>
					</p>
				</div>
				<div class="con1_weather">
					<i class="far fa-calendar-alt"></i>
					<h3>여행 최적기</h3>
					<p>
						4~6월 or 9~10월<br/>
						여행의 최적기, 봄과 가을
					</p>
				</div>
				<div>
					<i class="fas fa-bolt"></i>
					<h3>사용 전압</h3>
					<p>
						220V<br/>
						볼트
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="con1_bottom">
		<div class="con1_bottom1">
			<p class="con1_bottom_p1">하와이 여행 준비할 때 꼭 필요한 최신의 하와이 여행정보를 보고 있습니다.</p>
			<p class="con1_bottom_p2"><a href="#"><i class="fas fa-angle-double-down"></i>&nbsp다른 여행도시 보기</a></p>
		</div>
	</div>

	<div class="city_content">
		<div class="city_con2" id="adsideWrapper">
				<div class="city_leftmenu" id="adside">
					<h1>로마</h1>
					<ul class="city_ul">
						<li><a href="#">홈</a></li>
						<li><a href="#" id="tourist">관광지</a></li>
						<li><a href="#" id="activity">액티비티</a></li>
						<li><a href="#" id="festival">축제</a></li>
						<li><a href="#">지도보기</a></li>
					</ul>
			</div>
			<div class="city_right">
				<div class="bxslider">
					<div>
						<img src="../../1.jpg" height="300" title="#" />
					</div>
					<div>
						<img src="../../2.jpg" height="300" title="#" />
					</div>
					<div>
						<img src="../../3.jpg" height="300" title="#" />
					</div>
					<div>
						<img src="../../4.jpg" height="300" title="#" />
					</div>
				</div>
				<div class="city_right1">
					<p>테베레 강 하류에 위치한 이탈리아 수도 로마, 수많은 문화유산과 다양한 예술작품들을 볼수 있는 도시이다.
						'모든길은 로마로 통한다'라는 말이 있듯이 로마를 중심으로 육로, 수로 교통이 잘 발달되어 있다. 젤라또, 파스타,
						에스프레소를 정통의 맛 그대로 즐길수 있는 미의 도시 로마를 여행해보자.</p>
				</div>
	
				<div class="city_schedule">
					<h2>로마여행 추천일정</h2>
					<br />
					<div class="city_schedule1">
						<figure class="snip1382">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample96.jpg" />
							<figcaption>
								<h2>Gustav Purpleson</h2>
								<p>Weekends don't count unless you spend them doing something
									completely pointless.</p>
								<div class="icons">
									<a href="#"><i class="fas fa-heartbeat"></i></a>
								</div>
							</figcaption>
						</figure>
						<figure class="snip1382">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample96.jpg" />
							<figcaption>
								<h2>Gustav Purpleson</h2>
								<p>Weekends don't count unless you spend them doing something
									completely pointless.</p>
								<div class="icons">
									<a href="#"><i class="fas fa-heartbeat"></i></a>
								</div>
							</figcaption>
						</figure>
					</div>
				</div>
				
				
				<div class="city_tourlist">
					<h2>주요 관광지</h2>
					<br />
					<div class="tourlist1">
							<div class="swiper">
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				     	  <div class="swiper-slide">
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
							  
					   	  </div>
					      <div class="swiper-slide">
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
					   	  </div>
					   	  <div class="swiper-slide">
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
					   	  </div>
					   	  <div class="swiper-slide">
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
					   	  </div>
					    </div>
					    <!-- Add Pagination -->
					    
					    <!-- Add Arrows -->
					    <div class="swiper-button-next"></div>
					    <div class="swiper-button-prev"></div>
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
							로마의 대한 여행 TIP!<br>
							트립택시에서 PDF파일로 잘 정리하여 어디서나 볼수있도록 제공해드립니다.
						</p>
					</div>
					<div>
						<button>
							PDF파일 다운로드
						</button>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
		

</section>

	<script>
	
	$(function(){
		$(document).ready(function(){
			setInterval(function(){
				var time=new Date();
				var year = time.getFullYear();
				var hour = time.getHours()<%=c.getTimeDiffence()%>;
			    var minute = time.getMinutes();
			    var second = time.getSeconds();
				$("#time").html(year+"년 "+hour+":"+minute+":"+second+"(시차 "+<%=c.getTimeDiffence()%>+"시간)");
			},1000);
		});
	});
	$(function (){
		$("#tourist").one('click', function () {
			$.ajax({
				url:"<%=request.getContextPath() %>/tourist",
				type:"post",
				success:function(data){
					console.log(data);
					var addDiv="";
					for(var i=0;i<data.length;i++){
						  console.log(data[i]["touristTitle"]);
						  addDiv += "<div class='aos-item aos-init aos-animate' data-aos='flip-up'>";
						  addDiv += "<div class='aos-item__inner'>";
				          addDiv += "<h3>";
				          addDiv += data[i]["touristTitle"];
				          addDiv += "</h3>";
				          addDiv += "</div></div>";
					}
					$(".city_right").html(addDiv);
					$("section").css("height",$(".city_leftmenu").height());
				}
			});
		});
	});
	

	$(function (){
		$("#activity").one('click', function () {
		      $.ajax({          
		            url: "<%=request.getContextPath() %>/exChange",
		            type: 'get',
		            dataType: 'json',
		            success: function(data){
		            	
		            	console.log(data);
		            	console.log(data[1]["deal_bas_r"]);        
		            }
		        });  
		  });
	});
	
	$(function (){
		$("#festival").one('click', function () {
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=98d4971f2e14753dd582c6f4443133d8";
		    $.ajax({
		        url: apiURI,
		        dataType: "json",
		        type: "GET",
		        async: "false",
		        success: function(resp) {
		            console.log(resp);
		            console.log("현재온도 : "+ resp.main.temp );
		            console.log("현재습도 : "+ resp.main.humidity);
		            console.log("날씨 : "+ resp.weather[0].main );
		            console.log("상세날씨설명 : "+ resp.weather[0].description );
		            console.log("날씨 이미지 : "+ resp.weather[0].icon );
		            console.log("바람   : "+ resp.wind.speed );
		            console.log("나라   : "+ resp.sys.country );
		            console.log("도시이름  : "+ resp.name );
		            console.log("구름  : "+ (resp.clouds.all) +"%" );                 
		        }
		    })
		});
	});
		
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
  </script>

<%@ include file="/views/common/footer.jsp"%>