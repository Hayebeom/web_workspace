<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple-board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%
			String position = "user";
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>회원 가입 완료</h1>
	</div>
	<div class="body">
		<p>회원가입이 완료되었습니다</p>
		<p>새롭게 가입한 아이디로 로그인 해주세요</p>
		<p><a href="login.jsp"><strong>로그인 창으로 이동</strong></a>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>