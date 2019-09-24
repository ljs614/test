<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.ajax.model.vo.Member" %>
<%
	List<Member> list=(List)request.getAttribute("list");
%>
<table id="tbl-member">
	<tr>
		<th>이름</th>
		<th>전화번호</th>
		<th>프로필</th>
	</tr>
	<%for(Member m : list) {%>
		<tr>
			<td><%=m.getName() %></td>
			<td><%=m.getPhone() %></td>
			<td>
				<img src="<%=request.getContextPath() %>/images/<%=m.getProfile() %>">
			</td>
		</tr>
	<%} %>
</table>










