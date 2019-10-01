<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>
<%@ page import="triptaxi.user.model.vo.User" %>
<%@ page import="triptaxi.city.model.vo.City,com.triptaxi.attraction.model.vo.Attraction,java.util.List" %>
<%
	City c=(City)request.getAttribute("City");
%>
<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap" rel="stylesheet">
<section>

	

	<div class="top_con">
		<div class="top_con1">
			<div class="top_img">
				<div class="topcon_img">
					<img src="2.jpg" class="top_img0"/>
					<img src="1.jpg" class="top_img1"/>
					<img src="2.jpg" class="top_img2"/>
					<img src="3.jpg" class="top_img3"/>
				</div>
			</div>
			<div class="top_con1_1">
				<div class="top_con1_2">
					<div class="top_con1_2_1 top_border con1_hover1 hvr-shutter-out-vertical" onclick="">
						<div class="top_con1_2_11">
							<span class="top_con_span"> 여행일정 계획표 </span>
							<p class="top_con_p">나만의 특별한 여행일정 만들기</p>
						</div>
						<div class="top_con1_2_12 hvr-icon-spin">
							<!-- <i class="fas fa-map top_con_i"></i> -->
								<i class="material-icons top_con_i1 top_i">
									flight_takeoff
								</i>
						</div>
					</div>

					<div class="top_con1_2_1 con1_hover2 hvr-shutter-out-vertical hvr-icon-spin" onclick="">
						<div class="top_con1_2_11">
							<span class="top_con_span">여행지 추천</span>
							<p class="top_con_p">나만을 위한 여행지 추천받기</p>
						</div>
						<div class="top_con1_2_12">
							<!-- <i class="fas fa-globe-americas top_con_i1"></i> -->
								<i class="material-icons top_con_i1 top_i">
									stars
								</i>
						</div>
					</div>

					<div class="top_con1_2_1 con1_hover3 hvr-shutter-out-vertical top_border" onclick="">
						<div class="top_con1_2_11">
							<span class="top_con_span">동행 찾기</span>
							<p class="top_con_p">안전하고 즐거운 여행, 혼자보단 동행과 같이</p>
						</div>
						<div class="top_con1_2_12">
							<!-- <i class="fas fa-user-friends top_con_i1"></i> -->
								<i class="material-icons top_con_i1 top_i">
									supervised_user_circle
								</i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="con1">
		<h2>Main contents</h2>
		<div class="con1_1 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon material-icons_con1"> assignment </i>
				<p class="con1_text1">도시별 정보제공</p>
			</a>
			<p class="con1_text2">Activity | 환율 | 날씨</p>
		</div>
		<div class="con1_2 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon material-icons_con1"> today </i>
				<p class="con1_text1">여행 계획표</p>
			</a>
			<p class="con1_text2">Alone | Group</p>
		</div>
		<div class="con1_3 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon material-icons_con1"> people </i>
				<p class="con1_text1">동행 게시판</p>
			</a>
			<p class="con1_text2">
				동행과<br> 함께 떠나는 여행
			</p>
		</div>
	</div>
	
	<div class="con2">
			<h2>Best review</h2>
		<div class="bxslider">
			<div><img src="1.jpg" title="캡션을 지정할 수 있습니다." width="682" height="400"/></div>
			<div><img src="2.jpg" title="캡션을 지정할 수 있습니다." width="682" height="400"/></div>
			<div><img src="3.jpg" title="캡션을 지정할 수 있습니다." width="682" height="400"/></div>
			<div><img src="4.jpg" title="캡션을 지정할 수 있습니다." width="682" height="400"/></div>
		</div>
	</div>
	
	
</section>

	<div id="transcroller-body" class="aos-all con3_1">
		<h3>어디로 갈까?</h3>
		<p>트립택시를 이용하는 여행자들의 가장 선호하는 여행지를 추천해드립니다.</p>
		
			<!-- <div class="aos-item" data-aos="fade-up">
				<a href="#">
					<div class="aos-item__inner">
						<img src="1.jpg" />
						<h3>홍콩</h3>
						<p>HongKong</p>
					</div>
				</a>
			</div>
		<button class="" onclick="">인기도시 모두보기</button> -->
		
	</div>
	
	<div class="con3">
		<div id="transcroller-body" class="aos-all con3_2">
			<h3>인기 여행일정</h3>
			<p>다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</p>
				<!-- <div class="aos-item" data-aos="fade-up">
					<a href="#" class="aos_a">
						<div class="aos-item__inner coco">
							<img src="1.jpg" />
							<div class="con3_coco">
								<div class="con3_coco1">
									<p>best</p>								
								</div>
								<div class="con3_coco2">
									<h4>여행 일정이름</h4>
									<h5>가족여행, 친구</h5>
									<i class="material-icons con3_met"> 
										remove_red_eye
									</i>
									123
									<i class="material-icons con3_met"> 
										favorite
									</i>
									23
								</div>
							</div>
						</div>
					</a>
				</div> -->
			</div>
	
	
	<div class="parallax-window" data-parallax="scroll"
		data-image-src="<%=request.getContextPath() %>/images/4.jpg">
		<div class="con4">
			<h2>TRIP TAXI</h2>
			<div class="con4_1">
				<h1 id="counter1"></h1>
				<h1 id="counter2"></h1>
				<h1 id="counter3"></h1>
			</div>
			<div class="con4_2">
				<p>트립택시 여행자</p>
				<p>트립택시 여행자의 일정</p>
				<p>트립택시의 도시정보</p>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
				<span class="close">&times;</span>
				<!-- <form> -->
			<div class="modal-content1">
				<h3>여행하고싶은 대륙을 선택해주세요.</h3>
				<div class="modal-con">
					<label class="list_label">
						<input type="checkbox" class="option-input checkbox" value="Asia" name="continent"/> 아시아
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="Oceania" name="continent"/> 오세아니아
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="Europe" name="continent"/> 유럽
					</label>
				</div>
				<div class="modal-con">
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="NorthAmerica" name="continent"/> 남아메리카
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="SouthAmerica" name="continent"/> 북아메리카
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="Africa" name="continent"/> 아프리카
					</label>
				</div>
				<button value="다음" id="first_btn">다음</button>
			</div>
			
			<div class="modal-content2">
				<h3>누구랑 여행을 계획중이신가요?</h3>
				
				<div class="modal-con">
					<label class="list_label">
						<input type="checkbox" class="option-input checkbox" value="family_trip" name="withTravel" onclick="doOpenCheck(this);"/> 가족여행
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="solo_trip" name="withTravel" onclick="doOpenCheck(this);"/> 나홀로여행
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="couple_trip" name="withTravel" onclick="doOpenCheck(this);"/> 커플여행
					</label>
				</div>
				<div class="modal-con">
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="friend_trip" name="withTravel" onclick="doOpenCheck(this);" /> 친구와함께
					</label> 
					<label class="list_label"> 
						<input type="checkbox" class="option-input checkbox" value="business_trip" name="withTravel" onclick="doOpenCheck(this);"/> 비즈니스여행
					</label> 
				</div>
				<!-- <input type="submit" value="전송" id="last_btn">
				</form> -->
				<button value="매칭" id="last_btn">매칭</button>
			</div>
		</div>
	</div>


	<script>
	
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("withTravel");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

	
	$(function(){
		$(document).ready(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/countUser",
				type:"get",
				success:function(data){
					console.log(data["result"]);
					console.log(data["result1"]);
					console.log(data["result2"]);
					function numberCounter(target_frame, target_number) {
					    this.count = 0; this.diff = 0;
					    this.target_count = parseInt(target_number);
					    this.target_frame = document.getElementById(target_frame);
					    this.timer = null;
					    this.counter();
					};
					numberCounter.prototype.counter = function() {
					    var self = this;
					    this.diff = this.target_count - this.count;
					     
					    if(this.diff > 0) {
					        self.count += Math.ceil(this.diff / 100);
					    }
					     
					    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					     
					    if(this.count < this.target_count) {
					        this.timer = setTimeout(function() { self.counter(); }, 100);
					    } else {
					        clearTimeout(this.timer);
					    }
					};

					new numberCounter("counter1", data["result"]);
					new numberCounter("counter2", data["result1"]);
					new numberCounter("counter3", data["result2"]);

				}
			});
		});
	});
	
	
	
		$(function(){
			$(".modal-content2").hide();
		});
		$("#first_btn").on("click",function(){
			$(".modal-content1").hide();
			$(".modal-content2").show();
		});
		
 
			 				var continent=[];
				 			var withTravel=[];
				 $("#last_btn").on("click",function(){
			        	 $("input[name=continent]:checked").each(function() {
			        		 continent.push($(this).val());
			 				/* continent+=$(this).val(); */
			 			});
			 				console.log(continent); 
			        	 $("input[name=withTravel]:checked").each(function() {
			        		 withTravel.push($(this).val());
				 				/* withTravel+=$(this).val(); */
				 		});
				 				console.log(withTravel);
			        	/*  var allData = {"continent":continent,"withTravel":withTravel}; */
			        	 /* $('#myModal').hide(); */
			        	<%-- location.href="<%=request.getContextPath()%>/city/matching"; --%>
			        	
			        	$.ajax({
							url:"<%=request.getContextPath()%>/city/matching",
							type:"get",
							data:{"continent":continent,"withTravel":withTravel},
							success:function(data){
								var cityArr="";
								console.log(data);
								console.log(data.length);
								for(var i=0; i<data.length; i++){
									console.log(data[i]["cityEng"]);
									cityArr="<span class='close'>&times;</span>";
									cityArr+="<a href='<%=request.getContextPath()%>/citychoice?cityName="+data[i]["cityEng"]+"'>"+data[i]["cityName"]+"</a>";
								}
							 	$(".modal-content").html(cityArr);
							 	$(".close").on("click",function(){
									/* $("#myModal").css("display","none"); */
									location.reload();
								});	
							}
						});   	 
			});

		
 
		$(function(){
			$(".con1_hover2").on("click",function(){
				$("#myModal").css("display","block");
			});			
		});
		
		$(".close").on("click",function(){
			/* $("#myModal").css("display","none"); */
			location.reload();
		});	
					
		$(function(){
			$("window").on("click",function(){
				if (event.target == modal) {
					$("#myModal").css("display","none");
				}
			});			
		});


		AOS.init({
			easing : 'ease-in-out-sine'
		});

	

	$(function(){
		$(document).ready(function(){
			$.ajax({
				url:"<%=request.getContextPath() %>/indexcityservlet",
				type:"get",
				success:function(data){
					var cityArr="";
				 	for(var i=0; i<=5; i++){
				 		var imgurl=data[i]["imageUrl"].split(",");
				 		cityArr+="<div class='aos-item' data-aos='zoom-out-down'>";
				 		cityArr+="<a href='<%=request.getContextPath()%>/citychoice?cityName="+data[i]['cityEng']+"'>";
				 		cityArr+="<div class='aos-item__inner'>";
				 		cityArr+="<img src='<%=request.getContextPath() %>"+imgurl[0]+"' width='100%' height='100%'/>";
				 		cityArr+="<h3>"+data[i]["cityName"]+"</h3>";
				 		cityArr+="<p>"+data[i]["cityEng"]+"</p>";
				 		cityArr+="</div>";
				 		cityArr+="</a>";
				 		cityArr+="</div>";
					} 
				 	$(".con3_1").append(cityArr);
				 	$(".con3_1").append("<button class='' onclick=''>인기도시 모두보기</button>");
				}
			});
		});
	});

	

	
 	$(function(){
		$(document).ready(function(){
			$.ajax({
				url:"<%=request.getContextPath() %>/indexplanner",
				type:"get",
				success:function(data){
					console.log(data);
					
					var plannerArr="";
				 	for(var i=0; i<=5; i++){
				 		plannerArr+="<div class='aos-item' data-aos='fade-down'>";
				 		plannerArr+="<a href='#' class='aos_a'>";
				 		plannerArr+="<div class='aos-item__inner coco'>";
				 		plannerArr+="<img src='<%=request.getContextPath() %>"+data[i]['plannerCoverimg']+"'/>";
				 		plannerArr+="<div class='con3_coco'>";
				 		plannerArr+="<div class='con3_coco1'>";
				 		plannerArr+="<p>BEST</p>";
				 		plannerArr+="</div>";
				 		plannerArr+="<div class='con3_coco2'>";
				 		plannerArr+="<h4>"+data[i]["plannerName"]+"</h4>";
				 		plannerArr+="<h5>"+data[i]["plannerTheme"]+"<h5>";
				 		plannerArr+="<i class='material-icons con3_met'>remove_red_eye</i>&nbsp;";
				 		plannerArr+=data[i]["plannerCount"]+"&nbsp;";
				 		plannerArr+="<i class='material-icons con3_met'>favorite</i>&nbsp;";
				 		plannerArr+=data[i]["plannerLike"];
				 		plannerArr+="</div>";
				 		plannerArr+="</div>";
				 		plannerArr+="</div>";
				 		plannerArr+="</a>";
				 		plannerArr+="</div>";
					} 
				 	
				 	$(".con3_2").append(plannerArr);
				 	$(".con3_2").append("<button class='' onclick=''>인기도시 모두보기</button>");
				 	
				 	$(function(){
						$(".coco").first().hover(function(){
							$(".con3_coco2").first().css("display","block");
							$(".con3_coco").first().css("transform","translateY(-120px)");
							$(".con3_coco").first().css("transition","1s");

						},function(){
							$(".con3_coco2").first().css("display","none");
							$(".con3_coco").first().css("transform","translateY(1px)");
							$(".con3_coco").first().css("transition","1s");
						});
						$(".coco").eq(1).hover(function(){
							$(".con3_coco2").eq(1).css("display","block");
							$(".con3_coco").eq(1).css("transform","translateY(-120px)");
							$(".con3_coco").eq(1).css("transition","1s");

						},function(){
							$(".con3_coco2").eq(1).css("display","none");
							$(".con3_coco").eq(1).css("transform","translateY(1px)");
							$(".con3_coco").eq(1).css("transition","1s");
						});
						$(".coco").eq(2).hover(function(){
							$(".con3_coco2").eq(2).css("display","block");
							$(".con3_coco").eq(2).css("transform","translateY(-120px)");
							$(".con3_coco").eq(2).css("transition","1s");

						},function(){
							$(".con3_coco2").eq(2).css("display","none");
							$(".con3_coco").eq(2).css("transform","translateY(1px)");
							$(".con3_coco").eq(2).css("transition","1s");
						});
						$(".coco").eq(3).hover(function(){
							$(".con3_coco2").eq(3).css("display","block");
							$(".con3_coco").eq(3).css("transform","translateY(-120px)");
							$(".con3_coco").eq(3).css("transition","1s");

						},function(){
							$(".con3_coco2").eq(3).css("display","none");
							$(".con3_coco").eq(3).css("transform","translateY(1px)");
							$(".con3_coco").eq(3).css("transition","1s");
						});
						$(".coco").eq(4).hover(function(){
							$(".con3_coco2").eq(4).css("display","block");
							$(".con3_coco").eq(4).css("transform","translateY(-120px)");
							$(".con3_coco").eq(4).css("transition","1s");

						},function(){
							$(".con3_coco2").eq(4).css("display","none");
							$(".con3_coco").eq(4).css("transform","translateY(1px)");
							$(".con3_coco").eq(4).css("transition","1s");
						});
						$(".coco").last().hover(function(){
							$(".con3_coco2").last().css("display","block");
							$(".con3_coco").last().css("transform","translateY(-120px)");
							$(".con3_coco").last().css("transition","1s");

						},function(){
							$(".con3_coco2").last().css("display","none");
							$(".con3_coco").last().css("transform","translateY(1px)");
							$(".con3_coco").last().css("transition","1s");
						});
					});
					
				}
			});
		});
	});
 	

	$(document).ready(function(){
    $('.bxslider').bxSlider({
        slideWidth: 682,
        captions: true
    	});
    });
	
		
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>


<%@ include file="/views/common/footer.jsp" %>