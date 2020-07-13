<%@page import="com.simple.dao.UserDao"%>
<%@page import="com.simple.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 요청파라미터에서 폼 입력값 획득
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String id = request.getParameter("id");
	String password = request.getParameter("pwd");

	UserDao userDao = new UserDao(); 
	
	User isAlreadyUser = new User();
	isAlreadyUser = userDao.getUserById(id);
	// 없으면 isAlreadyUser는 null값이고, 있으면 null값이 아니지
	
	if (isAlreadyUser == null) {
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);

		userDao.insertUser(user);
	}
		
	// 중복된 아이디가 존재할 시 
	else if (isAlreadyUser != null) {
		response.sendRedirect("form.jsp?error=dup");
		return;
	} 
	
	response.sendRedirect("completed.jsp"); // 대충 회원가입 완료됬다는 페이지로 보내기
	
%>
