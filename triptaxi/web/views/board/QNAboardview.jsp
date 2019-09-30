<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="triptaxi.board.model.vo.Board,triptaxi.board.model.vo.BoardComment,java.util.List,com.triptaxi.attraction.model.vo.TourReview" %>
<%@ include file="/views/common/header.jsp"%>

<%
	loginUser.getUserId();
	Board b=(Board)request.getAttribute("board");
	List<BoardComment> list=(List)request.getAttribute("comments");
%>
<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px; height:50px; color:white; background:#3300ff; position:relative; top:-20px;}
     /*댓글테이블*/
   table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; }
   table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
   table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
   table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
   table#tbl-comment button.btn-reply{display:none;}
   table#tbl-comment tr:hover {background:lightgray;}
   table#tbl-comment tr:hover button.btn-reply{display:inline;}
   table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
   table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
   table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
   table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
   table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
   table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    
    </style>
    
    <section id="board-container">
		<h2>게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td><%=b.getQnaNo()%></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><%=b.getQnaTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=b.getQnaWriter() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=b.getQnaReadCount() %></td>
			</tr>
			
				<th>내 용</th>
				<td><%=b.getQnaContent() %></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="목록으로" onclick="fn_listBoard();"/>
			<%--글작성자/관리자인경우 수정삭제 가능 --%>
			<%if(loginUser!=null&&(loginUser.getUserId().equals("admin")
					|| loginUser.getUserId().equals(b.getQnaWriter() ))){%>

					<input type="button" value="수정하기" onclick="fn_updateBoard()">
					<input type="button" value="삭제하기" onclick="fn_deleteBoard()">
			<%} %>
				</th>
			</tr>
			

		</table>
		
		<div id="comment-container">
		<div class="comment-editor">
			<form action="<%=request.getContextPath()%>/board/insertComment" method="post" onsubmit="return fn_commentValidate();">
				<input type="hidden" name="boardRef" value="<%=b.getQnaNo()%>">
				<input type="hidden" name="boardCommentRef" value="0">
				<input type="hidden" name="boardCommentLevel" value="1">
				<input type="hidden" name="boardWriter" value="<%=loginUser!=null?loginUser.getUserId():""%>">
				<textarea name="content" rows="3" cols="60"></textarea>
				<input type="submit" value="등록">
			</form>
		</div>
		</div>
	
	<table id="tbl-comment">
	<%if(!list.isEmpty()) {
			for(BoardComment bc: list){
				if(bc.getBoardCommentLevel()==1){

	%>
		<tr class='level1'>
			<td>
				<sub class="comment-writer"><%= bc.getBoardCommentWriter()%></sub>
				<sub class="comment-date"><%= bc.getBoardCommentDate()%></sub>
				<br>
				<%=bc.getBoardCommentContent() %>
				
			</td>
			<td>
				<button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button>
				<button class="btn-delete" value="<%=bc.getBoardCommentNo()%>" onclick="fn_deleteBoardComment();">삭제</button>

			</td>
		</tr>
		<%}else{%>
		<tr class='level2'>
			<td>
				<sub ><%= bc.getBoardCommentWriter()%></sub>
				<sub ><%= bc.getBoardCommentDate()%></sub>
				<br>
					<%=bc.getBoardCommentContent() %>
				</td>
			<td>
				<button class="btn-reply" value="<%=bc.getBoardCommentNo() %>">답글</button>
			</td>
		</tr>
		
		<%} %>
	<%} %>
	<%} %>	
	
	</table>	

    <script>
    $(function(){
    	$("[name=content]").focus(function(){
    		if(<%=loginUser==null%>){
    			fn_loginAlert();
    		}
    	})

    	$(".btn-reply").click(function(){
    		if(<%=loginUser==null%>){
    			fn_loginAlert();
    			return;
    		}
    		var tr=$("<tr>");
    		var html="<td style='display:none;text-align:left;' colspan='2'>";
    		html+="<form action='<%=request.getContextPath()%>/board/insertComment' method='post'>";
    		
    		html+='<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>">';
    		html+='<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'">';
    		html+='<input type="hidden" name="boardCommentLevel" value="2">';
    		html+='<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getUserId():""%>">';
			
    		html+='<textarea name="content" rows="3" cols="60"></textarea>';
    		html+='<input type="submit" value="등록">';
    		html+='</form></td>';
    		tr.html(html);
    		tr.insertAfter($(this).parent().parent().after()).children("td").show(800);
    		$(this).off('click');
    	});
    	
    
    	
    });
    
    function fn_commentValidate(){
    	if(<%=loginUser==null%>){
    		fn_loginAlert();
    		return false;
    	}
    	var len=$("[name==comment]").val().trim().length;
    	if(len<1){
    		return false;
    	}return true;
    }
    
    function fn_loginAlert(){
    	alert("로그인 후 이용하세요!");
    	$("#userId").focus();
    }
    
    
    
    function fn_listBoard(){
    	location.href='<%=request.getContextPath()%>/board/boardList?cPage=<%=request.getAttribute("cPage")
    						!=null?request.getAttribute("cPage"):"1"%>';
    	
    }
    
    function fn_deleteBoardComment(){
    	location.href='<%=request.getContextPath()%>/board/boardCommentDelete?boardCommentRef='+$("#btn-delete").val;

    }
    function fn_updateBoard(){
        
    }
    function fn_deleteBoard(){
    	
    	
    }
    </script>

    </section>

<%@ include file="/views/common/footer.jsp"%>