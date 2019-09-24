<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath() %>/css/city.css" rel="stylesheet">

<section>
	<div class="video_con">
		<video autoplay loop muted="false">
			<source src="../../video/city.mp4" type="video/mp4">
		</video>
		<div class="video_opacity">
		</div>
		<div class="video_con1">
			<div class="video_con1_1">
				<p>로마</p>
			</div>
			<div class="video_con1_2">
				<span>12:49:47 (시차 -8시간 )</span>
				<span>약 12시간 25분(직항기준)</span>
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
			<p>하와이 여행 준비할 때 꼭 필요한 최신의 하와이 여행정보를 보고 있습니다.</p>
			<a href="#">다른 여행도시 보기</a>
		</div>
	</div>


</section>

<%@ include file="/views/common/footer.jsp"%>