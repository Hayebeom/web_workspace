<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<style>
	.error {
		color: red;
		font-weight: bold;
		font-style: italic;
	}
</style>
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>로그인 정보</h1>
	</div>
	<div class="body">
		
		<!-- 에러 관련 코드 -->
		<%
			String error = request.getParameter("error");
		%>
		
		<%
			if ("null".equals(error)) {
		%>
			<div class="error">
				<p>존재하지 않는 아이디입니다.</p>
			</div>
		<%
			}
		%>
		
		<%
			if ("wrong".equals(error)) {
		%>
			<div class="error">
				<p>아이디 혹은 비밀번호가 올바르지 않습니다.</p>
			</div>
		<%
			}
		%>
		
		<%
			if ("deny".equals(error)) {
		%>
			<div class="error">
				<p>로그인 후 사용할 수 있는 서비스입니다.</p>
			</div>
		<%
			} 
		%>
		<!-- 에러 관련 코드 끝-->

		<p>아이디와 비밀번호를 입력하세요</p>
		<div class="well">
			<form method="post" action="login.jsp">
				<div class="form-group">
					<label>아이디</label>
					<div><input type="text" name="id" /></div>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<div><input type="text" name="pwd" /></div>
				</div>
				<div class="text-right">
					<button type="submit">로그인</button>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>