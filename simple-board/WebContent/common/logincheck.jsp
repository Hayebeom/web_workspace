<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String LOGINED_USER_ID = (String) session.getAttribute("아이디");
	String LOGINED_USER_NAME = (String) session.getAttribute("이름");
	String LOGINED_YN = (String) session.getAttribute("로그인여부");
	
	if (LOGINED_USER_ID == null) {
		response.sendRedirect("loginform.jsp?error=deny");
		return;
	}
%>