<%@page import="com.sample.dao.UserDao"%>
<%@page import="com.sample.vo.User"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청 파라미터 조회</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("userid");
		String password = request.getParameter("userpassword");
		String name = request.getParameter("username");
		String email = request.getParameter("email");

		User user = new User();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		
		UserDao userDao = new UserDao();
		userDao.insertUser(user);
		
	%>
	
	<h1>사용자 등록 완료</h1>
	
	<p>새로운 사용자가 등록되었습니다.</p>
</body>
</html>