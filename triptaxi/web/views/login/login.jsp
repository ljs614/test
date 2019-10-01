<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">


<section>
	<div class="login_1">
		<form action="<%=request.getContextPath()%>/login" method="post">
		<div class="login">
			<div class="login_h2">
				<h2>회원 로그인</h2>
			</div>
			<div class="login_2">
				<input type="text" name="userId" id="userId" value="<%=saveId !=null?saveId:""%>" placeholder="아이디"> <br/>
				<input type="password" id="password" name="password" placeholder="비밀번호"/><br>
				<label><input type="checkbox" name="saveId" id="saveId" <%=saveId != null ? "checked" : ""%> />아이디 저장</label>
				<div class="wrap">
					<button class="button1">로그인</button>
				</div>
			</div>
			<div>
				<div class="wrap1">
					<button class="button1">
						<i class="fab fa-google"></i>네이버
					</button>
				</div>
				<div class="wrap1">
					<button class="button1">
						<i class="fab fa-google"></i>페이스북
					</button>
				</div>

			</div>
			<div>
				<div class="wrap1">
					<button class="button1">
						<i class="fab fa-google"></i>구글
					</button>
				</div>
				<span >
				<a href="<%=request.getContextPath()%>/views/login/UserEnroll.jsp">회원가입</a></span>
				console.log()
				 <span id="search">
				 <a href="<%-- <%=request.getContextPath()%>/views/ --%>">아이디/비밀번호 찾기</a></span>
			</div>
		</div>
		</form>
	</div>

</section>
<script>

</script>



<%@ include file="/views/common/footer.jsp" %>












