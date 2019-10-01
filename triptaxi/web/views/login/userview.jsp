<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="triptaxi.user.model.vo.User"%>
<% 
	User u=(User)request.getAttribute("User"); 
	String[] birthday=u.getBirthday().split("-");
	
%>

<section id="enroll-container">
	<h2>회원정보수정</h2>

		    <div id="wrap">
       
       <form name="updateuser" method="post">
            <table class="userid_1">
                <tr>
                    <td >아이디</td>
                    <td>
                        <input type="text" name="userId" id="view_userId" maxlength="50" placeholder="아이디입력" value="<%=u.getUserId() %>"   readonly>
                        
                    </td>
                </tr>
                        
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="password" id="view_password" maxlength="12" placeholder="영문과숫자특수문자조합 " value="*******" readonly>
                    </td>
                </tr>
                
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" id="passowrdcheck" maxlength="12" value="*******"  readonly>
                    </td>
                </tr>
                    
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="userName" id="userName" maxlength="50" value="<%=u.getUserName() %>" readonly>
                    </td>
                </tr>
                    
                <tr>
                    <td>성별</td>
                    
                    	<% if(u.getGender()=='M') { %>
                    	<td>
	                        <input type="radio" name="gender" value="M" checked />남
	                        <input type="radio" name="gender" value="F">여
                        </td>
                        <%} else if(u.getGender()=='F'){ %>
                        <td>
	                        <input type="radio" name="gender" value="M" />남
	                        <input type="radio" name="gender" value="F" checked />여
                        </td>
                        <%} %>
                    
                </tr>
                    
                <tr>
                    <td>생일</td>
                    <td>
                        <input type="text" name="birthyear" maxlength="4" placeholder="년(4자)" size="7" value="<%=birthday[0]%>" readonly>
                        <input type="text" name="birthmonth" maxlength="2" placeholder="월" size="4"  value="<%=birthday[1]%>" readonly>
                        <input type="text" name="birthday" maxlength="2" placeholder="일" size="4" value="<%=birthday[2]%>" readonly>
                    </td>
                </tr>
                    
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="user_email" id="user_email" maxlength="50" value="<%=u.getEmail()%>" autofocus>@
                        <select name="email1">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>
                            <option>kh.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td>휴대전화</td>
                    <td>
                        <input type="text" name="phone" id="phone" placeholder="(-없이)" value="<%=u.getPhone() %>" />
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
			<input type="button" onclick="user_updatePassword();" value="비밀번호변경" />
			<input type="button" onclick="user_updateUser();" value="정보수정" name="updateuser" />
			<input type="button" onclick="user_deleteMember();" value="탈퇴" />
         </form> 
    </div>
			
			
		<script>
		function userupdate_validate(){
			//정규표현식 이용해서 제한사항작성
			return true;
		}
		function user_updateUser(){
			//수정된정보를 서블릿에 전송
			updateuser.action="<%=request.getContextPath()%>/user/userupdate?user_id=<%=u.getUserId()%>";
			updateuser.submit();//데이터전송!
		}
			function user_deleteMember(){
				if(confirm("정말로 삭제하시겠습니까?")){
					updateuser.action="<%=request.getContextPath()%>/user/userdelete?user_id=<%=u.getUserId()%>";
					updateuser.submit();
				}
			}

			<%-- function user_updatePassword(){
				
			
			
			}	 --%>	
		
			
		
		
		
		
			
		</script>
</section>
<%@ include file="/views/common/footer.jsp"%>