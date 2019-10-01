<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean check=(boolean)request.getAttribute("check");
	String userId=request.getParameter("userId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='<%=request.getContextPath() %>/js/jquery-3.4.1.min.js'></script>
<title>중복아이디체크</title>
	<style>
		div#checkid-container{
			text-align:center;
			padding-top:50px;
		}
		span#duplicated{
			color:red;font-weight:bold;
		}
	</style>
</head>
<body>
	<div id="checkid-container">
		<%if(check==true){ %>
			[<span><%=userId %></span>]는 이미 사용중 입니다.
			<br><br>
			<form action='<%=request.getContextPath()%> /checkIdDuplicate'
			name="checkIdDuplicate" method="post">
				<input type="text" name="userId" placeholder="아이디입력">
			</form>
		<%} else{%>
			[<span><%=userId %></span>]는 사용가능합니다.
			<br><br>
			<button onclick='fn_close();'>닫기</button>
		<%} %>
	</div>
	<script>
		function fn_close(){
			opener.document.getElementById("userId").value='<%=userId%>';
			opener.document.getElementById("password").focus();
			self.close();
		}
	
	
	</script>
</body>
</html>








