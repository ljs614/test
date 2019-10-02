<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
section{font-family:'Nanum Gothic';}
table, th, td { border-collapse:collapse; padding:3px}
td{font-size:15px; font-weight:bold;  padding:20px; box-sizing:border-box;}
.btn1 {
  margin: 10px;
  padding: 10px;
  text-align: center;
  transition: 0.5s;
  background-size: 200% auto;
  color: white;
  font-weight:bold;
  border-radius: 20px;
  border:0px;
  box-shadow:0px;
 }
 .btn1:hover {
  background-position: right center;
}
.btn-4 {
  background-image: linear-gradient(to right, #a1c4fd 0%, #c2e9fb 51%, #a1c4fd 100%);
}

#wrap{
    position : relative;
	width : 100%;
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
    margin:0 auto;
}
table.userid_1{
margin:0 auto;
}
#frmButton{
	text-align:center;
}
input[type="button"]{
	background-color: rgb(73,80,106);
    border: none;
    height: 35px;
    width: 100px;
    margin-left: 15px;
    color: white;
    font-size: 14px;
    font-family: 'Nanum Gothic';
}


}
.inp_color{
	background-color: rgba(166,171,190,0.3);
    border: none;
    height: 40px;
    width: 270px;
    border-radius: 10px;
    padding-left:10px;
    
}
input[type="text"]{
	background-color: rgba(166,171,190,0.3);
    border: none;
    height: 40px;
    width: 270px;
    border-radius: 10px;
}
input[type="password"]{
	background-color: rgba(166,171,190,0.3);
    border: none;
    height: 40px;
    width: 270px;
    border-radius: 10px;
}

#frmButton input[type="submit"], #frmButton input[type="reset"]{
	width: 140px;
    height: 40px;
    line-height:20px;
    margin-left: 10px;
    margin-right: 10px;
    background-color:rgb(73,80,106);
    border:none;
    color:white;
    font-family: 'Nanum Gothic';
    font-weight: bolder;
    font-size: 16px;
}

*{font-family: 'Roboto', sans-serif;}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 30px;
  width: 30px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #a5c6f4;
}
.option-input:checked::before {
  height: 30px;
  width: 30px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 30px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #a5c6f4;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

body label {
  display: block;
  line-height: 30px;
}

.custom-select-wrapper {
  position: relative;
  display: inline-block;
  user-select: none;
}
  .custom-select-wrapper select {
    display: none;
  }
  .custom-select {
    position: relative;
    display: inline-block;
  }
    .custom-select-trigger {
      position: relative;
      display: block;
      width: 70px;
      padding: 0 84px 0 22px;
      font-size: 22px;
      font-weight: 300;
      color: #fff;
      line-height: 40px;
      background: #a5c6f4;
      border-radius: 10px;
      cursor: pointer;
    }
      .custom-select-trigger:after {
        position: absolute;
        display: block;
        content: '';
        width: 10px; height: 10px;
        top: 50%; right: 25px;
        margin-top: -3px;
        border-bottom: 1px solid #fff;
        border-right: 1px solid #fff;
        transform: rotate(45deg) translateY(-50%);
        transition: all .4s ease-in-out;
        transform-origin: 50% 0;
      }
      .custom-select.opened .custom-select-trigger:after {
        margin-top: 3px;
        transform: rotate(-135deg) translateY(-50%);
      }
  .custom-options {
    position: absolute;
    display: block;
    top: 100%; left: 0; right: 0;
    min-width: 100%;
    margin: 15px 0;
    border: 1px solid #b5b5b5;
    border-radius: 4px;
    box-sizing: border-box;
    box-shadow: 0 2px 1px rgba(0,0,0,.07);
    background: #fff;
    transition: all .4s ease-in-out;
    
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transform: translateY(-15px);
  }
  .custom-select.opened .custom-options {
    opacity: 1;
    visibility: visible;
    pointer-events: all;
    transform: translateY(0);
  }
    .custom-options:before {
      position: absolute;
      display: block;
      content: '';
      bottom: 100%; right: 25px;
      width: 7px; height: 7px;
      margin-bottom: -4px;
      border-top: 1px solid #b5b5b5;
      border-left: 1px solid #b5b5b5;
      background: #fff;
      transform: rotate(45deg);
      transition: all .4s ease-in-out;
    }
    .option-hover:before {
      background: #f9f9f9;
    }
    .custom-option {
      position: relative;
      display: block;
      padding: 0 22px;
      border-bottom: 1px solid #b5b5b5;
      font-size: 18px;
      font-weight: 600;
      color: #b5b5b5;
      line-height: 47px;
      cursor: pointer;
      transition: all .4s ease-in-out;
    }
    .custom-option:first-of-type {
      border-radius: 4px 4px 0 0;
    }
    .custom-option:last-of-type {
      border-bottom: 0;
      border-radius: 0 0 4px 4px;
    }
    .custom-option:hover,
    .custom-option.selection {
      background: #f9f9f9;
    }

</style>
<section id="enroll">
    <div id="wrap">
        <form id="frm_enroll" action="<%=request.getContextPath() %>/UserEnrollEnd" method="post" onsubmit="return enroll_validate();">
            <table class="userid_1">
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" class="inp_color" name="enroll_userId" id="enroll_userId" maxlength="50" placeholder="아이디입력" required>
                        <input type="button" class="btn1 btn-4" value="중복확인"  onclick="checkIdDuplicate();"/>    
                    </td>
                </tr>
               <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" class="inp_color" name="enroll_password" id="enroll_password" maxlength="12" placeholder="영문과 숫자 조합(8자리 이상 12자리 이하)"  required>
                     	 <span id="pwmessage"></span>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" class="inp_color" name="passwordcheck" id="passwordcheck" maxlength="12" required>
                	</td>
                </tr>
                    
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" class="inp_color" name="userName" id="userName" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td>성별</td>
                    <td>
                        <input type="radio" class="option-input radio" name="gender" value="M" checked>남
                        <input type="radio" class="option-input radio" name="gender" value="F" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td>생일</td>
                    <td>
                        <input type="number" class="inp_color" name="birthyear" id="birthyear" maxlength="4" placeholder="년(4자)" size="7"  step="" min="1900" max="2019" >
                        <input type="number" class="inp_color" name="birthmonth" id="birthmonth" maxlength="2" placeholder="월" size="4" step="" min="1" max="12" >
                        <input type="number" class="inp_color" name="birthday" id="birthday" maxlength="2" placeholder="일" size="4"  step="" min="1" max="31" >
                       
                        
                    </td>
                    
                </tr>
                    
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" class="inp_color" name="email" maxlength="50">@
                        <select id="sources" class="custom-select sources" name="email1" placeholder="naver.com">
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

            </table>
            <br>
            <div id="frmButton">
            <input type="submit" class="btn1 btn-4" value="가입"/>  
            <input type="reset" class="btn1 btn-4"value="다시입력">
            </div>
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

$(".custom-select").each(function() {
	  var classes = $(this).attr("class"),
	      id      = $(this).attr("id"),
	      name    = $(this).attr("name");
	  var template =  '<div class="' + classes + '">';
	      template += '<span class="custom-select-trigger">' + $(this).attr("placeholder") + '</span>';
	      template += '<div class="custom-options">';
	      $(this).find("option").each(function() {
	        template += '<span class="custom-option ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
	      });
	  template += '</div></div>';
	  
	  $(this).wrap('<div class="custom-select-wrapper"></div>');
	  $(this).hide();
	  $(this).after(template);
	});
	$(".custom-option:first-of-type").hover(function() {
	  $(this).parents(".custom-options").addClass("option-hover");
	}, function() {
	  $(this).parents(".custom-options").removeClass("option-hover");
	});
	$(".custom-select-trigger").on("click", function() {
	  $('html').one('click',function() {
	    $(".custom-select").removeClass("opened");
	  });
	  $(this).parents(".custom-select").toggleClass("opened");
	  event.stopPropagation();
	});
	$(".custom-option").on("click", function() {
	  $(this).parents(".custom-select-wrapper").find("select").val($(this).data("value"));
	  $(this).parents(".custom-options").find(".custom-option").removeClass("selection");
	  $(this).addClass("selection");
	  $(this).parents(".custom-select").removeClass("opened");
	  $(this).parents(".custom-select").find(".custom-select-trigger").text($(this).text());
	});
			
			
		</script>



<%@ include file="/views/common/footer.jsp" %>