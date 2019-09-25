<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@page import="triptaxi.user.model.vo.User" %>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">

<%
	User loginUser=(User)session.getAttribute("loginUser");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	 if(cookies!=null){
		for(Cookie c:cookies){
			//getName() -> key값 가져오기 / getValue() -> 값!
			System.out.println("key : "+c.getName());
			System.out.println("value: "+c.getValue());
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
			} 
		}
	 }

%>

<section>
	<div class="login_1">
		<form action="<%=request.getContextPath()%>/login" method="post" onsubmit="validate();">
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
				<span class="search"><a href="">회원가입</a></span> <span class="search"><a
					href="">아이디/비밀번호 찾기</a></span>
			</div>
		</div>
		</form>
	</div>

</section>
<script>
/* function validate(){
	if($("#userId").val().trim().length<4){
		alert("아이디는 4글자 이상 입력하세요");
		$("#userId").focus();
		return false;
	}
}
 */
</script>



<%@ include file="/views/common/footer.jsp" %>












