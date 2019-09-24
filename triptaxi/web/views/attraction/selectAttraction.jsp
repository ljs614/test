<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <input type="text" name="attId" value="v1-01"> -->
<form action="<%=request.getContextPath()%>/attraction/select" >
	<button type="submit" name="attId" value="at-01">나트랑비치</button>
	<button type="submit" name="attId" value="fe-02">나트랑센터</button>
	<button type="submit" name="attId" value="at-32" >슬롯질라</button>
	<button type="submit" name="attId" value="ac-03">혼땀비치</button>
</form>
</body>
</html>