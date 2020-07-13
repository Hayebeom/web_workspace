<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.vo.Book"%>
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
		ArrayList<Book> books = new ArrayList<>();
		//List<Product> products = productDao.getProducts();
		// String title = request
	%>

	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>제목</th>
				<th>저자</th>
				<th>장르</th>
				<th>출판사</th>
			</tr>
		</thead>

		<tbody>

			<%
				for (Book book : books) {
			%>
			
			<tr>
				<td><%=book.getTitle() %></td>
				<td><%=book.getWriter()%></td>
				<td><%=book.getGenre()%></td>
				<td><%=book.getPublisher() %></td>
			</tr>
			<%
				}
	
			%>
			
		</tbody>
	</table>
</body>
</html>