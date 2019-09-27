<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, triptaxi.planner.model.vo.CityList" %>
<%
	List<CityList> list = (List<CityList>)request.getAttribute("cityList");
	for(CityList c : list){
		System.out.println(c.getCityName());
	}
	
	HashSet<String> continents = new HashSet<>();
	HashSet<String> nations = new HashSet<>();
	for(CityList c : list){
		continents.add(c.getContinentName());
		nations.add(c.getNationName());
	}
	

	
%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/citySelect.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Russo+One&display=swap" rel="stylesheet">

<section>
	<div id="continentSelect">
		<div id="innerContinentSelect">
				<ul id="continents">
					<li id="northAmerica"><a href='#continentSelectContent'>NorthAmerica</a></li>
					<li id="southAmerica"><a href='#continentSelectContent'>SouthAmerica</a></li>
					<li id="asia"><a href='#continentSelectContent'>Asia</a></li>
					<li id="australia"><a href='#continentSelectContent'>Australia</a></li>
					<li id="africa"><a href='#continentSelectContent'>Africa</a></li>
					<li id="europe"><a href='#continentSelectContent'>Europe</a></li>
				</ul>
		</div>
	</div>

	<div id="continentSelectContent">
		<div id="innerContent">
			<div id="contentTitle"></div>
			
		</div>

	</div>

	<% int count=0; %>
	<div id='totalList'>
		<div id='innertotalList'>
			<div id='totalListTitle'>국가리스트</div>
					<div class='continentName'>아시아</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("Asia")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
					<div class='continentName'>유럽</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("Europe")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
					<div class='continentName'>북아메리카</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("NorthAmerica")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
					<div class='continentName'>오스트레일리아</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("Austrailia")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
					<div class='continentName'>남아메리카</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("SouthAmerica")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
					<div class='continentName'>아프리카</div>
						<div class='listContent'>
						<% for(int i=0;i<list.size();i++){
							if(list.get(i).getContinentName().equals("Africa")) { count++;%>
								<div class="city">
								<img src="<%=request.getContextPath()%><%=list.get(i).getFlagUrl()%>" width="30px" height="20px">
								<a href="<%=request.getContextPath()%>/citychoice?cityName=<%=list.get(i).getCityEng()%>">
									<%=list.get(i).getCityName() %><span><%=list.get(i).getCityEng() %></span>
								</a>
								</div>
							<%} 
							} if(count==0){%>
							<a id='comingSoon'>COMING SOON</a>
						<% } count=0;%>
						</div>
				
		</div>
	</div>

</section>

<script>

	$(document).ready(function() {
		$('#continentSelect').css("height", $(window).height() - 52 + "px");
		$('#continentSelectContent').css("height",$(window).height() + "px");
		$('#totalList').css("height", $('#innertotalList').height() + 50 + "px");
		$('section').css("height", $('#totalList').height() + $('#continentSelect').height() + "px");
	});

	$('#continents>li>a').click(function() {
		var str = $(this).text();
		console.log($(this).text());
		$('#continentSelectContent').css("display","block");
		$('#contentTitle').text("- " + str.toUpperCase());
		$('section').css("height", 600 + $('#continentSelect').height() 
				+$('#continentSelectContent').height()+ "px");
	});
	
	
</script>

<%@ include file="/views/common/footer.jsp"%>
