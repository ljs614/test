<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="triptaxi.board.model.vo.Board,triptaxi.board.model.vo.BoardComment,java.util.List,com.triptaxi.attraction.model.vo.TourReview" %>
<%@ include file="/views/common/header.jsp"%>

<%	List<Board> list=(List)request.getAttribute("list");
	int cPage=(int)request.getAttribute("cPage");

%>
<style>
	section#board-container{width: 1000px; margin:0 auto; text-align:center;}
	section#board-container h2{margin:10px 0;
	margin-top:50px}
	table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	div#pageBar span.cPage{color: #0066ff;}
	</style>
	
	<section id="board-container">
		<h2>게시판 </h2>
		<%if(loginUser!=null){ %>
		<input type="button" value="글쓰기" id="btn-add"	onclick="fn_boardForm()"/>
		<script>
		function fn_boardForm(){
			location.href='<%=request.getContextPath()%>/board/boardForm';
		}	
		
		</script>
		
		<%} %>
		<table id="tbl-board">
			<tr>
			<th>성별</th>
			<th>연령대 </th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>첨부파일</th>
			</tr>
		<!--내용작성-->
		<!--pageBar도 있어야함-->
			<%if(list.isEmpty()) {%>
				<tr>
					<td colspan="6">
						등록된 게시글이 없습니다!
					</td>
				</tr>
			<%}else{
				for(Board b : list){ %>
				<tr>
					<td><%=b.getQnaCategory() %></td>
					<td><%=b.getAgeGrade() %></td>
					<td><%=b.getQnaNo() %></td>
					<td>
						<a href='<%=request.getContextPath()%>/board/boardView?no=<%=b.getQnaNo()%>&cPage=<%=cPage%>'>
							<%=b.getQnaTitle()%>
						</a>
					</td>
					<td><%=b.getQnaWriter() %></td>
					<td><%=b.getQnaDate() %></td>
					<td><%=b.getQnaReadCount() %></td>
					<td>
					<%if(b.getOriFileName()!=null){%>
						O
					<%}else{%>
						X
						<%} %>
						</td>
					</tr>
			<%}
				}%>
			
		</table>
		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
	</section>
	<script>
 	$("#list-select").click(function(){

		location.href='<%=request.getContextPath()%>/board/boardListSelect?gender=$("#category-select").val()&age=$("#age-select")';
		
	});
	
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>