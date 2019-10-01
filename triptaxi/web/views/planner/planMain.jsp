<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, triptaxi.planner.model.vo.CityList, triptaxi.planner.model.vo.PlannerFullInfo"%>
<%@ include file="/views/common/header.jsp"%>
<%
	String userId = "null";
	if (loginUser != null) {
		userId = loginUser.getUserId();
	}

	List<CityList> list = (List<CityList>) request.getAttribute("cityList");	
	List<PlannerFullInfo> plannerList = (List<PlannerFullInfo>)request.getAttribute("plannerList");
	
%>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/planMain.css"
	rel="stylesheet">

<section>

	<div id='planMainHeaderColor'></div>

	<div id="planMainHeader">
		<div id="innerHeader">
			<div id="pmh_title">누구나 쉽게 일정을 계획할 수 있습니다.</div>
			<div id='makePlanBT' onclick="fn_openMakePlan1();">
				<i class="far fa-calendar-plus"></i> 새 일정 만들기
			</div>
			<div id='planViewBT' onclick="fn_openMyPage();">
				<i class="far fa-eye"></i> 나의 일정보기
			</div>
		</div>
	</div>

	<div id='planMainContent'>
		<div id='innerContent'>
			<div id='pmc_title'>여행자들의 일정보기</div>

			<table id="planContentFilter">
				<tr>
					<th>여행지</th>
					<td class="tbl_Continent">아시아</td>
					<td class="tbl_Continent">유럽</td>
					<td class="tbl_Continent">북아메리카</td>
					<td class="tbl_Continent">오스트레일리아</td>
					<td class="tbl_Continent">남아메리카</td>
					<td class="tbl_Continent">아프리카</td>
				</tr>
				<tr class='showCityList' id='showCityList_Asia' data-continent="아시아"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>아시아</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("Asia")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
				<tr class='showCityList' id='showCityList_Europe' data-continent="유럽"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>유럽</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("Europe")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
				<tr class='showCityList' id='showCityList_NorthAmerica' data-continent="북아메리카"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>북아메리카</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("NorthAmerica")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
				<tr class='showCityList' id='showCityList_Austrailia' data-continent="오스트레일리아"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>오스트레일리아</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("Austrailia")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
				<tr class='showCityList' id='showCityList_SouthAmerica' data-continent="남아메리카"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>남아메리카</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("SouthAmerica")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
				<tr class='showCityList' id='showCityList_Africa'  data-continent="아프리카"
					style="display: none">
					<td colspan='7'>
						<div id='sac_title'>아프리카</div>
						<div id='sac_content'>
							<ul>
								<%
									for (int i = 0; i < list.size(); i++) {
										if (list.get(i).getContinentName().equals("Africa")) {
								%>
								<li data-cityeng='<%=list.get(i).getCityEng()%>'><%=list.get(i).getCityName()%></li>
								<%
									}
									}
								%>
							</ul>
						</div>
					</td>
				</tr>
			</table>

			<div id='planViewWrap'>
				<div id="planViewState">
					<div id='planSort'>
						<div id='popularPlan' class="clickColor">인기</div>
						|
						<div id='newestPlan'>신규</div>
					</div>
					<div id='planTotalCount'>
						<span id='totalCnt'>${totalData}</span>개의 일정
					</div>
				</div>


				<% for(int i=0;i<plannerList.size();i++){ %>
				
				<div class='planView_Div'>
					<div class='planView_Thumbnail' onclick="location.href='<%=request.getContextPath()%>/planner/plannerView?plannerId=<%=plannerList.get(i).getPlannerId()%>'">
						<img
							src="<%=request.getContextPath() %><%= plannerList.get(i).getPlannerCoverimg()%>"
							alt="" width="268px" height="180px">
					</div>
					<div class="planView_Content">
						<div class='pvc_title'><%=plannerList.get(i).getPlannerName() %></div>
						<div class='pvc_date'><%=plannerList.get(i).getPlannerDate() %></div>
						<div class='pvc_totalDay'><%=plannerList.get(i).getDayCount() %> DAY</div>
						<div class="pvc_city"><%=plannerList.get(i).getCityList() %></div>
						<div class='pvc_theme'><%=plannerList.get(i).getPlannerTheme() %></div>
						<div class='pvc_users'>
							<i class="fas fa-user"></i> <%=plannerList.get(i).getPlannerWriter() %>
						</div>
						<div class='pvc_Popularity'>
							<i class="fas fa-eye"></i> <%=plannerList.get(i).getPlannerCount() %> <i class="fas fa-heart"></i> <%=plannerList.get(i).getPlannerLike() %>
						</div>

					</div>
				</div>
				
				<%} %>
				
			</div>
		</div>
			<div id="pageBar">
				${pageBar}
			</div>

	</div>

</section>

<script>
	
	var cPage=1;
	var aa;
	var selectId;
	var flag=true;
	$('.tbl_Continent').click(function () {
		if(!flag){
			$('#innerContent').css("height",$('#innerContent').height()-$(selectId).height());
            $('section').css('height',$('section').height()-$(selectId).height());
		}

		switch($(this).text()){
			case '아시아': selectId='#showCityList_Asia'; break;
			case '유럽': selectId='#showCityList_Europe'; break;
			case '북아메리카': selectId='#showCityList_NorthAmerica'; break;
			case '오스트레일리아': selectId='#showCityList_Austrailia'; break;
			case '남아메리카': selectId='#showCityList_SouthAmerica'; break;
			case '아프리카': selectId='#showCityList_Africa'; break;
		}

		$('.showCityList').hide();

		if(selectId == aa){
			$(selectId).slideUp();
			aa='';
			flag=true;
		}else{
			$(selectId).slideDown();
			aa = selectId;
		
			$('#innerContent').css("height",$('#innerContent').height()+$(selectId).height());
            $('section').css('height',$('section').height()+$(selectId).height());
			flag=false;
			
		}
		
	});

	
	
	$('#planSort>div').click(function () {
		$('#planSort>div').removeClass('clickColor');
		$(this).addClass('clickColor');
	})
	
	function fn_openMakePlan1(){
		if('<%=userId%>'== 'null'){
			fn_login();
		}else{
			location.href='<%=request.getContextPath()%>/makePlan1';
		}
	}
	
	function fn_openMyPage(){
		if('<%=userId%>'=='null'){
			fn_login();
		}else{
			location.href='<%=request.getContextPath() %>/user/mypage';
		}
	}
	
	$('.tbl_Continent').click(function(){

		var continent = $(this).text();
		
		var arr = $(this).parent().siblings();
		$.each(arr, function(index, item){
			if(continent == $(item).data("continent")){
				if($(item).find("li").length==0){
					var ul = $(item).find("ul");
					var add = "<li id='comingsoon' style='border:none'><div id='dataNullalertIcon'><i class='fas fa-exclamation-triangle'></i> </div>";
					add += "<div id='dataNullalertContent'>해당하는 데이터가 없습니다.</div></li>";
					ul.append(add);
				}
			}
		}) 

		
	});
	
	$('#sac_content>ul>li').click(function(){
		$('#sac_content>ul>li').removeClass('clickCategory');
		$(this).addClass('clickCategory');
		
		var option1;
		if($('.clickColor').text() == '인기'){
			option1 = "order by planner_like desc";
		}else{
			option1 = "order by planner_writedate desc";
		}
		fn_paging2(option1, $(this).data("cityeng"), cPage);
	})
	$('.tbl_Continent').click(function(){
		$('#sac_content>ul>li').removeClass('clickCategory');
		
		var option1;
		if($('.clickColor').text() == '인기'){
			option1 = "order by planner_like desc";
		}else{
			option1 = "order by planner_writedate desc";
		}
		fn_paging1(option1, cPage);
		
	})
	

	function fn_paging1(option1, cPage){
		$.ajax({
			url:"<%=request.getContextPath()%>/option1Change",
			data:{"option1":option1, "cPage":cPage},
			success:function(data){
				
			}
		})
		
	}
	
	function fn_paging2(option1, option2, cPage){
		$.ajax({
			url:"<%=request.getContextPath()%>/option2Change",
			data:{"option1":option1, "option2":option2, "cPage":cPage},
			success:function(data){
				
			}
		})
	}
	
	
	
	$('#newestPlan').click(function(){
		var option="null";
	
		if($('.clickCategory').length>0){
			option=$('.clickCategory').data("cityeng");
			fn_paging2("order by planner_writedate desc", option, cPage);
		}else{
			fn_paging1("order by planner_writedate desc", cPage);
		}
		

	});
	
	$('#popularPlan').click(function(){
		var option="null";
		
		if($('.clickCategory').length>0){
			option=$('.clickCategory').data("cityeng");
			fn_paging2("order by planner_like desc", option, cPage);
		}else{
			fn_paging1("order by planner_like desc", cPage);
		}
		
	})
	
	
	
	
	
	
</script>


<%@ include file="/views/common/footer.jsp"%>