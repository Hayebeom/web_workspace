<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="navibar">
	<ul>
		<li><a href="/simple-board/home.jsp">홈</a></li>
		<li><a href="/simple-board/board/list.jsp">게시판</a></li>
		<li><a href="/simple-board/user/my.jsp">내 정보</a></li>

	<% 
		String LOGINED_YN = (String) session.getAttribute("로그인여부");
	%> 

	<% 
		if ("Yes".equals(LOGINED_YN)) {
			String LOGINED_NAME = (String) session.getAttribute("이름");
	%>	
	
		<li class="right"><a href="/simple-board/user/logout.jsp">로그아웃</a></li>
		
	<%		
		} else {
	%>
	
		<li class="right"><a href="/simple-board/user/loginform.jsp">로그인</a></li>
		<li class="right"><a href="/simple-board/user/form.jsp">회원가입</a></li>
		
	<%
		 }
	%>
</ul>

	<%
		if ("Yes".equals(LOGINED_YN)) {
			String LOGINED_NAME = (String) session.getAttribute("이름");
	%>
	
		<p><%=LOGINED_NAME %>님 환영합니다</p>
		
	<%
		} 
	%>
	
</div>
