<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>스트립트릿 사용</h1>
		
		<%--
			스크립트릿에서 변수 선언
		--%>
		<%
			String name = "홍길동";
			int age = 30;
			String tel = "010-1111-2222";
			String[] friends = {"김유신", "강감찬", "이순신"};
			
			// 이클립스의 콘솔창에 출력됨
			// System.out.println("이름 : " + name);
			
		%>
		
		<h3>사용자 정보</h3>
		<dl>
			<dt>이름</dt><dd><%=name %></dd>
		</dl>
		
		<dl>
			<dt>나이</dt><dd><%=age %></dd>
		</dl>
		
		<dl>
			<dt>전화번호</dt><dd><%=tel %></dd>
		</dl>

		<dl>
			<dt>친구들</dt>
			<dd><%=friends[0] %></dd>
			<dd><%=friends[1] %></dd>
			<dd><%=friends[2] %></dd>
		</dl>
</body>
</html>