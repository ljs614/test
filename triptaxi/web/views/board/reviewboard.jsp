<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath() %>/css/city.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/reviewboard.css" rel="stylesheet">

<script>
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
		<video autoplay loop muted="false">
			<source src="../video/city.mp4" type="video/mp4">
		</video>
		
	<div class="con1_bottom">
		<div class="con1_bottom1">
			<p class="con1_bottom_p1">여행 준비할 때 꼭 필요한 최신의 여행정보를 추천해드립니다.</p>
		</div>
	</div>

	<div class="community">
		<div id="adsideWrapper">
			<div id="adside">
				<h1>커뮤니티</h1>
				<ul class="city_ul">
					<li><a href="#">후기게시판</a></li>
					<li><a href="#" id="tourist">Q&A 게시판</a></li>
					<li><a href="#" id="activity">동행 게시판</a></li>
				</ul>
			</div>
		</div>
		
		<div class="community_right">
			<div>
			
			</div>
		</div>
	</div>





</section>


<%@ include file="/views/common/footer.jsp"%>