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
                    <td>아이디</td>
                    <td>
                        <input type="text" name="enroll_userId" id="enroll_userId" maxlength="50" placeholder="아이디입력" required>
                        <input type="button" value="중복확인"  onclick="checkIdDuplicate();"/>    
                    </td>
                </tr>
               <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="enroll_password" id="enroll_password" maxlength="12" placeholder="영문과숫자특수문자조합 "  required>
                     	 <span id="pwmessage"></span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" id="passwordcheck" maxlength="12" required>
                	</td>
                </tr>
                    
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="userName" id="userName" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td>성별</td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="F" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td>생일</td>
                    <td>
                        <input type="number" name="birthyear" id="birthyear" maxlength="4" placeholder="년(4자)" size="7"  step="" min="1900" max="2019" >
                        <input type="number" name="birthmonth" id="birthmonth" maxlength="2" placeholder="월" size="4" step="" min="1" max="12" >
                        <input type="number" name="birthday" id="birthday" maxlength="2" placeholder="일" size="4"  step="" min="1" max="31" >
                       
                        
                    </td>
                    
                </tr>
                    
                <tr>
                    <td>이메일</td>
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
                    <td>휴대전화</td>
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

	function checkIdDuplicate(){
		
			console.log($("#enroll_userId").val());
		var idReg = /^[a-z]+[a-z0-9]{4,19}$/g;
		//console.log($('#userId').val());
		if(!idReg.test($("#enroll_userId").val())){
			alert("영문으로 시작해서 4글자이상");
		
		}
	if($("#enroll_userId").val().trim()){
		var url="<%=request.getContextPath()%>/checkIdDuplicate?userId="+$('#enroll_userId').val();
		var title="checkId";
		var status="left=500px,top=100px,width=300px,"
		+"height=200px,scrollbars=yes";
		var popup=open(url,title,status);
	}else{
		alert("아이디를 다시 입력하십시오");
	}
} 

$('#enroll_password').blur(function(){
	var ps=/^[A-Za-z0-9]{8,12}$/;
	if(!ps.test($("#enroll_password").val())){
		alert("8자리이상 영문숫자");
	}else if($('#enroll_password').val()!=true){
		$("#enroll_password").focus;
	}
});
$('#passwordcheck').blur(function (){
	if($('#enroll_password').val()!=$('#passwordcheck').val()){
		$('#pwmessage').text('비밀번호가 일치하지않습니다.');
		$('#enroll_password').focus();
	}else if($('#enroll_password').val()==$('#passwordcheck').val()){
		$('#pwmessage').text('비밀번호가 일치합니다.');
	}
});

/*$('#birthyear').blur(function(){
		 var year=/^(19[0-9][0-9]|200[0-9])/;
		if(!year.test($("#birthyear").val())){
			$('#birthyear').focus();
		} */
	/* $('#birthmonth').blur(function(){
		var month=/^(0[0-9]|1[0-2])/;
		if(!month.test($("#birthmonth").val())){
			$('#birthmonth').focus();
		}
	});
	$('#birthday').blur(function(){
		var day=/^(0[1-9]|[1-2][0-9]|3[0-1])$/
		if(!day.test($("#birthday").val())){
			$('#birthday').focus();
		}
	});  
	});*/
	

			
			
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