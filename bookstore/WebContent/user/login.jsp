<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("userpassword");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	// 아이디에 해당하는 사용자 정보가 존재하지 않음
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 사용자 정보 존재하지만 비밀번호 불일치
	if (!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 아이디에 해당하는 사용자 정보 존재, 비밀번호 일치하는 경우에만 수행
	// 1. 사이트에 가입한 회원이고, 회원이 직접 로그인한 것이 맞음
	// 2. 회원이 다른 서비스를 이용하는 동안 추가적인 회원정보 입력없이 모든 서비스 사용
	// 3. 회원이 지금 사용하고 있는 브라우저만 접근할 수 있는 객체(세션객체)에 
	//    회원정보 저장, 그 브라우저로 요청하는 모든 jsp 페이지에서 회원 정보 획득 가능
	session.setAttribute("이름", user.getName());
	session.setAttribute("아이디", user.getId());
	session.setAttribute("로그인여부", "Yes");
	
	response.sendRedirect("/bookstore/home.jsp");
%>
