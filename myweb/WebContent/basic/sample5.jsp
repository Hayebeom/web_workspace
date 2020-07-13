<%@page import="com.sample.vo.Contact"%>
<%@page import="java.util.ArrayList"%>
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

	<%
		Contact c1 = new Contact("홍길동", "010-1234-5678", "hong@gmail.com", "현대자동차");
		Contact c2 = new Contact("김유신", "010-2334-5342", "kim@gmail.com", "우리은행");
		Contact c3 = new Contact("강감찬", "010-4545-3563", "kang@gmail.com", "서울시청");
		Contact c4 = new Contact("이순신", "010-2346-6754", "lee@gmail.com", "교보문고");
		Contact c5 = new Contact("을지문", "010-4325-3546", "eulgi@gmail.com", "육군본부");

		ArrayList<Contact> contacts = new ArrayList<>();
		contacts.add(c1);
		contacts.add(c2);
		contacts.add(c3);
		contacts.add(c4);
		contacts.add(c5);
	%>
	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>소속회사</th>
			</tr>
		</thead>

		<tbody>
			<!-- 연락처 반복 -->
			<%
				for (Contact contact : contacts) {
			%>
			<tr>
				<td><%=contact.getName()%></td>
				<td><%=contact.getTel()%></td>
				<td><%=contact.getEmail()%></td>
				<td><%=contact.getCompany()%></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</body>
</html>