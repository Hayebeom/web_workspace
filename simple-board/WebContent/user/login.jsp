<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("pwd");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	// 아이디가 존재하지 않을 때 (아이디가 틀릴 때)
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=null");
		return;
	}
	
	// 아이디는 맞는데 비밀번호가 틀릴 때
	if (!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=wrong");
		return;
	}
	
	session.setAttribute("이름", user.getName());	//  LOGINED_USER_NAME
	session.setAttribute("아이디", user.getId());	// LOGINED_USER_ID
	session.setAttribute("로그인여부", "Yes");		// LOGINED_YN
	
	response.sendRedirect("/simple-board/home.jsp");
%>
