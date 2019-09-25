<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/citySelect.css" rel="stylesheet">

<section>
	<div id="continentSelect">
		<div id="innerContinentSelect">
			<div id='continent-container'>
				<ul id="continents">
					<li id="northAmerica"><a>NorthAmerica</a></li>
					<li id="southAmerica"><a>SouthAmerica</a></li>
					<li id="asia"><a>Asia</a></li>
					<li id="australia"><a>Australia</a></li>
					<li id="africa"><a>Africa</a></li>
					<li id="europe"><a>Europe</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="continentSelectContent">
		<div id="innerContent">
			<div id="contentTitle"></div>
		</div>

	</div>

	<div id='totalList'>
		<div id='innertotalList'>
			<div id='totalListTitle'></div>
		</div>
	</div>

</section>

<script>
	$(document).ready(function() {
		$('#continentSelect').css("height", $(window).height() - 52 + "px");
		$('#continentSelectContent').css("height",$(window).height() + "px");
		$('section').css("height", 600 + $('#continentSelect').height()
										+ $('#continentSelectContent').height() + "px");
	});

	$('#continents>li>a').click(function() {
		console.log($(this).text());
	});
</script>

<%@ include file="/views/common/footer.jsp"%>
