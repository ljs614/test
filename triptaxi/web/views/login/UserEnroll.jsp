<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
table, th, td {border:1px solid #333333; border-collapse:collapse; padding:10px}
td{font-size:18px; font-weight:bold;  padding:20px;}
#wrap{
    position : relative;
    
	width : 600px;
	height: 600px;
    margin:0 auto;

}
#enroll{
    height:900px;
    width:100%;
}
#frm_enroll{
    position: relative;
    top:100px;
}

</style>
<section id="enroll">
    <div id="wrap">
        <form id="frm_enroll" action="<%=request.getContextPath() %>/UserEnrollEnd" method="post" onsubmit="return enroll_validate();">
            <table class="userid_1">
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="userId" id="userId" maxlength="50" placeholder="아이디입력" required>
                        <input type="button" value="중복확인"  onclick="checkIdDuplicate();"/>    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" id="password" maxlength="12" placeholder="영문과숫자특수문자조합 "  required>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" id="passowrdcheck" maxlength="12" required>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="userName" id="userName" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="F" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyear" maxlength="4" placeholder="년(4자)" size="7" >
                        <input type="text" name="birthmonth" maxlength="2" placeholder="월" size="4" >
                        <input type="text" name="birthday" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="email" maxlength="50">@
                        <select name="email1">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" id="phone" placeholder="(-없이)" />
                    </td>
                </tr>
                <tr>
         <th>메일/SMS 정보수신</th>
         <td class="s">
            <input type="radio" name="chk_mail" checked> 수신
            <input type="radio" name="chk_mail" > 수신거부
         </td>
      </tr>
     
      


      
            </table>
            <br>
            <input type="submit" value="가입"/>  
            <input type="reset" value="다시입력">
        </form>

        
    </div>
</section>
    <script>
    function enroll_validate(){
		//정규표현식을 적용해서 유효성검사 
      	/* if($("#password").val()=""){
      		alert("비밀번호를 정확히 입력해 주세요");
      		return;
      	}
		if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{6}$/.test($("#password").val())){
			alert("비밀번호는 6자리를 사용해야 합니다.");
			return;
		}
		if($("#passwordcheck").val()=""){
			alert("비밀버노 확인을 입력해 주세요");
			return;
		}
		if($("#passwordcheck").val() !=$("#password").val()){
			alert("비밀번호 확인을 다시 입력해 주세요");
			return;
		} */
		var id=$('#userId_').val().trim();
		console.log(id);
		if(id.length<4){
			alert("아이디는 4글자 이상입력!");
			$('#userId_').focus();
			return false;
		}
		return true;
	}
	$(function(){		
		
		$("#passwordcheck").blur(function(){
			var pw=$("#password").val().trim();
			var pwck=$(this).val().trim();
			if(pw!=pwck){
				alert("패스워드가 일치하지 않습니다.");
				$("#password").focus();
				$(this).val("");
				$("#password").val("");
			}
		});
	}); 
	function checkIdDuplicate(){
		if($("#userId").val().trim().length>=4){
			var url="<%=request.getContextPath()%>/checkIdDuplicate?userId="+$('#userId').val();
			var title="checkId";
			var status="left=500px,top=100px,width=300px,"
			+"height=200px,scrollbars=yes";
			var popup=open(url,title,status);
		}else{
			alert("아이디를 다시 입력하십시오");
		}
	} 
			

			
			
		</script>
    <!--var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; -->
	<!--// 비밀번호 정규식
	 날짜 정규식 
	
	
	 if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){

alert('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');

return false;

} -->

<%@ include file="/views/common/footer.jsp" %>