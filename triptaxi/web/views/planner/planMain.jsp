<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/header.jsp"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="<%=request.getContextPath() %>/css/planMain.css" rel="stylesheet">

<section>
	<div id='planMainHeaderColor'></div>

	<div id="planMainHeader">
		<div id="innerHeader">
			<div id="pmh_title">누구나 쉽게 일정을 계획할 수 있습니다.</div>
			<div id='makePlanBT' onclick="location.href=''">
				<i class="far fa-calendar-plus"></i> 새 일정 만들기
			</div>
			<div id='planViewBT' onclick="location.href=''">
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
				<tr>
					<th>여행일</th>
					<td>1-3일</td>
					<td>4-6일</td>
					<td>7-10일</td>
					<td>11-15일</td>
					<td colspan='2' style='text-align: left; padding-left: 40px'>15일이상</td>

				</tr>
				<tr>
					<th>여행테마</th>
					<td>가족여행</td>
					<td>나홀로여행</td>
					<td>커플여행</td>
					<td>친구여행</td>
					<td colspan='2' style='text-align: left; padding-left: 27px'>비즈니스여행</td>
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
						<span id='totalCnt'>1000</span>개의 일정
					</div>
				</div>

				<div class='planView_Div'>
					<div class='planView_Thumbnail'>
						<img
							src="https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
							alt="" width="268px" height="180px">
					</div>
					<div class="planView_Content">
						<div class='pvc_title'>일정 제목</div>
						<div class='pvc_date'>2019-01-01</div>
						<div class='pvc_totalDay'>10 DAY</div>
						<div class="pvc_city">도시</div>
						<div class='pvc_theme'>가족여행</div>
						<div class='pvc_users'>
							<i class="fas fa-user"></i> 누구,누구,누구
						</div>
						<div class='pvc_Popularity'>
							<i class="fas fa-eye"></i> 100 <i class="fas fa-heart"></i> 20
						</div>

					</div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'>
						<img
							src="https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
							alt="" width="268px" height="180px">
					</div>
					<div class="planView_Content">
						<div class='pvc_title'>일정 제목</div>
						<div class='pvc_date'>2019-01-01</div>
						<div class='pvc_totalDay'>10 DAY</div>
						<div class="pvc_city">도시</div>
						<div class='pvc_theme'>가족여행</div>
						<div class='pvc_users'>
							<i class="fas fa-user"></i> 누구,누구,누구
						</div>
						<div class='pvc_Popularity'>
							<i class="fas fa-eye"></i> 100 <i class="fas fa-heart"></i> 20
						</div>

					</div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'>
						<img
							src="https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
							alt="" width="268px" height="180px">
					</div>
					<div class="planView_Content">
						<div class='pvc_title'>일정 제목</div>
						<div class='pvc_date'>2019-01-01</div>
						<div class='pvc_totalDay'>10 DAY</div>
						<div class="pvc_city">도시</div>
						<div class='pvc_theme'>가족여행</div>
						<div class='pvc_users'>
							<i class="fas fa-user"></i> 누구,누구,누구
						</div>
						<div class='pvc_Popularity'>
							<i class="fas fa-eye"></i> 100 <i class="fas fa-heart"></i> 20
						</div>

					</div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
				<div class='planView_Div'>
					<div class='planView_Thumbnail'></div>
				</div>
			</div>
		</div>

	</div>

</section>

<script>
        $('.tbl_Continent').click(function () {

            if ($(this).text() != $('#showAllCity').children().text() || $('#showAllCity').length == 0) {
                $('#showAllCity').remove();
                var tr = $("<tr id='showAllCity'>");
                var html = "<td colspan='7'><div id='sac_title'>" + $(this).text() + "</div>";
                html += "<div id='sac_content'><ul><li>도시</li></ul></div></td>";
                tr.html(html);
                console.log($(this).parent());
                tr.insertAfter($(this).parent());
                console.log($('section').height());
                $('#innerContent').css("height",$('#innerContent').height()+$('#showAllCity').height());
                $('section').css('height',$('section').height()+$('#showAllCity').height());

            }
        });

        $('#planSort>div').click(function () {
            $('#planSort>div').removeClass('clickColor');
            $(this).addClass('clickColor');
        })
    </script>


<%@ include file="/views/common/footer.jsp"%>