<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유저정보 등록 폼</h1>
	
	<h3>신규 유저 정보를 입력하세요</h3>
	<form action="userregister.jsp" method="post">
		<!-- 유저아이디, 유저비밀번호, 유저이름, 이메일, 포인트, 등록날짜 -->
		<div>
			<label>아이디</label>
			<div><input type="text" name="userid"/></div>
		</div>
		<div>
			<label>비밀번호</label>
			<div><input type="password" name="userpassword"/></div>
		</div>
		<div>
			<label>이름</label>
			<div><input type="text" name="username"/></div>
		</div>
		<div>
			<label>이메일</label>
			<div><input type="text" name="email"/></div>
		</div>
		<div>
			<label>포인트</label>
			<div><input type="number" name="point"/></div>
		</div>
		<div>
			<label>날짜</label>
			<div><input type="date" name="registeredDate"/></div>
		</div>
		<div>
			<label>개인정보 제공 동의</label>
			<div>
				<input type="checkbox" name="useragreement" value="yes"> 동의합니다.
			</div>
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>