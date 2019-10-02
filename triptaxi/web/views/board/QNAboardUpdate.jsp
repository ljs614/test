<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file="/views/common/header.jsp"%>
<%@ page import="triptaxi.board.model.vo.Board" %>
 <%
	Board b=(Board)request.getAttribute("board");

 %>
 
 <section>
    <style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style>
		<section id="board-container">
		<br><br><br>
		<h2>동행모집 게시판 수정하기</h2>
   	<form action="<%=request.getContextPath()%>/board/boardUpdateEnd" method="post" enctype="multipart/form-data">
		<table id="tbl-board">
		<tr>
				<th>글번호</th>
				<td>
				<input name="boardNo" type="hidden" value="<%=b.getQnaNo()%>"/>
					<%=b.getQnaNo()%>
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>
					<input type="text" name="title" id="title" value="<%=b.getQnaTitle()%>"/>
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					 <select required name = "category" id="category-select" >
					 		<option>성별선택</option>
                            <option value = "남성">남성</option>
                            <option value = "여성">여성</option>
                            <option value = "혼성">혼성</option>
                    </select>
				</td>
			</tr>
			<tr>
				<th>연령선택</th>
				<td>
					 <select required name = "age-grade" id="category-select" >
					 		<option required>연령선택</option>
                            <option value = "10대">10대</option>
                            <option value = "20대">20대</option>
                            <option value = "30대">30대</option>
                            <option value = "40대">40대</option>
                            <option value = "50대">50대</option>
                            <option value = "황혼여행">황혼여행</option>
                    </select>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				<input type="text" name="writer" value="<%=loginUser.getUserId()%>" readonly/>
				</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="up_file" id="up_file" value="<%=b.getOriFileName()%>">
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>
					<textarea rows="5" cols="50" name="content" id="content" required><%=b.getQnaContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type=button onclick="fn_listBoard()" value="돌아가기"/>
					<button type ="submit" id="submit">수정완료</button>
					
					
					
				</th>
			</tr>
		</table>
	</form>
    <script>
    
    function fn_listBoard(){
    	location.href='<%=request.getContextPath()%>/board/boardList?cPage=<%=request.getAttribute("cPage")%>';
    	
    }

    </script>

    </section>

</section>
<%@ include file="/views/common/footer.jsp"%>