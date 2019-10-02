<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, triptaxi.review.model.vo.Review" %>
<link href="<%=request.getContextPath() %>/css/reviewboard.css" rel="stylesheet">
<%
	List<Review> list=(List<Review>)request.getAttribute("list");
%>
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
	<div>
		<img src="../1.jpg" width="100%" height="350px">
	</div>
		
	<div class="con1_bottom">
		<div class="con1_bottom1">
			<p class="con1_bottom_p1">여행 준비할 때 꼭 필요한 최신의 여행정보를 추천해드립니다.</p>
		</div>
	</div>

	<div class="community">
		<div id="adsideWrapper">
			<div class="city_leftmenu" id="adside">
					<h2>커뮤니티</h2>
					<ul class="city_ul">
						<li><a href="#" id="tourist">후기 게시판</a></li>
						<li><a href="#" id="activity">Q&A 게시판</a></li>
						<li><a href="#" id="festival">동행 게시판</a></li>
					</ul>
			</div>
		
		<div class="community_right">
			<div class="review_list">
			<button onclick="reviewWrite();">글쓰기</button>
				<table>
					<tr>
						<th>사진</th>
						<th>번호</th>
						<th>도시</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<%for(int i=0;i<list.size();i++) {%>
					<tr>
						<td><%=list.get(i).getReviewFilePathRename() %></td>
						<td><%=list.get(i).getReviewNo() %></td>
						<td><%=list.get(i).getReviewCategory() %></td>
						<td class="reviewView" data-no='<%=list.get(i).getReviewNo() %>'><%=list.get(i).getReviewTitle() %></td>
						<td><%=list.get(i).getReviewWriter() %></td>
						<td><%=list.get(i).getReviewDate() %></td>
						<td><%=list.get(i).getReviewReadCount() %></td>
					<tr>
					<%} %>
				</table>
				 <div id="pageBar">
					<%=request.getAttribute("pageBar")%>
				</div>
			</div>
			
			<div class="review_write">
				<form action="<%=request.getContextPath()%>/review/writeEnd" method="post" enctype="multipart/form-data">
			<table id="tbl-notice">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="review_title" required>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="review_writer" value="<%=loginUser.getUserId()%>" readonly>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="review_upfile"/>
					</td>
				</tr>
				<tr>
					<th>도시</th>
					<td>
						<select name="review_category">
							<option value="방콕">방콕</option>
							<option value="나트랑">나트랑</option>
							<option value="푸켓">푸켓</option>
							<option value="라오스">라오스</option>
							<option value="싱가포르">싱가포르</option>
							<option value="파리">파리</option>
							<option value="런던">런던</option>
							<option value="로마">로마</option>
							<option value="칭다오">칭다오</option>
							<option value="베이징">베이징</option>
							<option value="라스베이거스">라스베이거스</option>
							<option value="로스앤젤레스">로스앤젤레스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textArea rows="5" cols="50" name="review_content"></textArea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
					</td>
				</tr>
					
				
			</table>
		</form>
			</div>
			
		</div>
	</div>
	</div>


</section>

<script>
	$(function(){
		$(document).ready(function(){
			$(".review_write").hide();
		});
	});
	
	function reviewWrite(){
		$(".review_list").hide();
		$(".review_write").show();
	};
	
	
	
	$(function(){
		$(".reviewView").on("click",function(){
			var reviewno=$(this).data("no");
			console.log(reviewno);
			$.ajax({
				url:"<%=request.getContextPath()%>/review/view?reviewNo="+reviewno,
				type:"post",
				success:function(data){
					var viewArr="";
					console.log(data);
					viewArr+="<table>";
					viewArr+="<tr>";
					viewArr+="<th>제목</th>";
					viewArr+="<td>"+data["reviewTitle"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<th>작성자</th>";
					viewArr+="<td>"+data["reviewWriter"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th>작성일</th>";
					viewArr+="<td>"+data["reviewDate"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th>도시</th>";
					viewArr+="<td>"+data["reviewCategory"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th>첨부파일</th>";
					viewArr+="<td>"+data["reviewFilePathRename"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th>내용</th>";
					viewArr+="<td>"+data["reviewContent"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th>조회수</th>";
					viewArr+="<td>"+data["reviewReadCount"]+"</td>";
					viewArr+="</tr>";
					viewArr+="<tr>";
					viewArr+="<th colspan='2'>";
					viewArr+="<input type='button' value='수정하기'  class='reviewView' data-no='"+data["reviewNo"]+"' onclick='modifyReview();'>";
					viewArr+="<input type='button' value='삭제하기' onclick='removeReview();''>";
					viewArr+="</th>";
					viewArr+="</table>";
					
					$(".community_right").html(viewArr);
					
				}	
			});
		});
	});
	
	
		
	
	function modifyReview(){
	var reviewNo=$(".reviewView").data("no");
		console.log(reviewNo);
		$.ajax({
			url:"<%=request.getContextPath()%>/review/modify?reviewNo="+reviewNo,
			type:"post",
			success:function(data){
				var modiArr="";
				modiArr+="<form action='<%=request.getContextPath()%>/review/modifyEnd?noticeNo="+reviewNo+"' method='post' enctype='multipart/form-data' >";
				modiArr+="<table>";
				modiArr+="<tr>";
				modiArr+="<th>제목</th>";
				modiArr+="<td><input type='text' name='title' value='"+data["reviewTitle"]+"' required></td>";
				modiArr+="</tr><tr>";
				modiArr+="<th>도시</th>";
				modiArr+="<td><input type='text' name='category' value='"+data["reviewCategory"]+"' readonly></td>";
				modiArr+="</tr><tr>";
				modiArr+="<th>작성자</th>";
				modiArr+="<td><input type='text' name='writer' value='"+data["reviewWriter"]+"' readonly></td>";
				modiArr+="</tr><tr>";
				modiArr+="<th>첨부파일</th>";
				modiArr+="<td><input type='file' id='up_file' name='up_file' value='"+data["reviewFilePathRename"]+"'></td>";
				modiArr+="<tr></tr>";
				modiArr+="<th>내용</th>";
				modiArr+="<td><textArea rows='5' cols='50' name='content'>"+data["reviewContent"]+"</textArea></td>";
				modiArr+="<tr></tr>";
				modiArr+="<td colspan='2'><input type='submit' value='수정'></td>";
				modiArr+="</tr></table></form>";
				
				$(".community_right").html(modiArr);
			}
		}); 
	}
	
</script>


<%@ include file="/views/common/footer.jsp"%>