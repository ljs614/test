<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
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
							<i class="fas fa-map top_con_i"></i>
						</div>
					</div>

					<div class="top_con1_2_1 con1_hover2 hvr-shutter-out-vertical hvr-icon-spin" onclick="">
						<div class="top_con1_2_11">
							<span class="top_con_span">여행지 추천</span>
							<p class="top_con_p">나만을 위한 여행지 추천받기</p>
						</div>
						<div class="top_con1_2_12">
							<i class="fas fa-globe-americas top_con_i"></i>
						</div>
					</div>

					<div class="top_con1_2_1 con1_hover3 hvr-shutter-out-vertical top_border" onclick="">
						<div class="top_con1_2_11">
							<span class="top_con_span">동행 찾기</span>
							<p class="top_con_p">안전하고 즐거운 여행, 혼자보단 동행과 같이</p>
						</div>
						<div class="top_con1_2_12">
							<i class="fas fa-user-friends top_con_i"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="con1">
		<h2>Main contents</h2>
		<div class="con1_1 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon"> assignment </i>
				<p class="con1_text1">도시별 정보제공</p>
			</a>
			<p class="con1_text2">Activity | 환율 | 날씨</p>
		</div>
		<div class="con1_2 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon"> today </i>
				<p class="con1_text1">여행 계획표</p>
			</a>
			<p class="con1_text2">Alone | Group</p>
		</div>
		<div class="con1_3 hvr-icon-spin">
			<a href=""> <i class="material-icons hvr-icon"> people </i>
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

	<div id="transcroller-body" class="aos-all">
		<h3>어디로 갈까?</h3>
		<p>팁에서 아이디어를 얻어보세요.</p>
		<div class="aos-item" data-aos="fade-up">
			<div class="aos-item__inner">
				<h3>1</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="fade-down">
			<div class="aos-item__inner">
				<h3>2</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="zoom-out-down">
			<div class="aos-item__inner">
				<h3>3</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="flip-down">
			<div class="aos-item__inner">
				<h3>4</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="flip-up">
			<div class="aos-item__inner">
				<h3>5</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="fade-down">
			<div class="aos-item__inner">
				<h3>6</h3>
			</div>
		</div>
		<button class="" onclick="">인기도시 모두보기</button>
	</div>
	
	<div id="transcroller-body" class="aos-all">
		<h3>인기 여행일정</h3>
		<p>다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</p>
		<div class="aos-item" data-aos="fade-up">
			<div class="aos-item__inner">
				<h3>1</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="fade-down">
			<div class="aos-item__inner">
				<h3>2</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="zoom-out-down">
			<div class="aos-item__inner">
				<h3>3</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="flip-down">
			<div class="aos-item__inner">
				<h3>4</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="flip-up">
			<div class="aos-item__inner">
				<h3>5</h3>
			</div>
		</div>
		<div class="aos-item" data-aos="fade-down">
			<div class="aos-item__inner">
				<h3>6</h3>
			</div>
		</div>
		<button class="" onclick="">추천일정 모두보기</button>
	</div>
	
	
	<div class="parallax-window" data-parallax="scroll"
		data-image-src="4.jpg">
		<div class="con4">
			<div class="con4_1">
				<div class="con4_1_1">
					<p>TRIP TAXI</p2>
					<p>나만의 여행 플래너 trip taxi<br/>
					       쉽고 빠르게 여행을 계획하세요.</p>
				</div>
				<div class="con4_1_2">
					<button class="" onclick="">여행계획 만들러가기</button>
				</div>
			</div>
			<div class="con4_2">
				<div class="con4_2_1">
					<img src="" width="700" height="200"/>
					<ul>
						<li>
							<a href="">
								<div class="con4_list">
									도시정보
								</div>
							</a>
						</li>
						<li>
							<a href="" >
								<div class="con4_list">
									도시별 액티비티
								</div>
							</a>
						</li>
						<li>
							<a href="" >
								<div class="con4_list">
									도시별 축제
								</div>
							</a>
						</li>
						<li>
							<a href="" >
								<div class="con4_list">
									도시별 관광명소
								</div>
							</a>
						</li>
					</ul>
				</div>
				
				<div>
					<p>
						투어택시 이용자들을 위한 도시별 각종정보
						<br/>환율, 날씨등 다양한 정보를 한 눈에 볼수 있습니다.
					</p>
					
				</div>
			</div>
		</div>
	</div>
		




<script>
	AOS.init({
		easing : 'ease-in-out-sine'
	});
</script>


<%@ include file="/views/common/footer.jsp"%>