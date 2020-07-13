<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
<style type="text/css">
	label {
		font-weight: bold;
	}
	select {
		display: inline-block;
		width: 150px;
		height: 37px;
	}
	input {
		display: inline-block;
		width: 250px;
		height: 32px;
	}
	button {
		height: 37px;
	}
	
</style>
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%
			String position = "board";
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 목록</h1>
	</div>
	<div class="body">
		<div>
			<p>게시글을 확인하세요</p>
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<td>21</td>
						<td><a href="detail.jsp?boardno=21">이것이 자바다 괜찮은 책인가요??</a></td>
						<td>김유신</td>
						<td>1</td>
						<td>2020-05-25</td>
					</tr>
					<tr>
						<td>21</td>
						<td><a href="detail.jsp?boardno=21">이것이 자바다 괜찮은 책인가요??</a></td>
						<td>김유신</td>
						<td>1</td>
						<td>2020-05-25</td>
					</tr>
					<tr>
						<td>21</td>
						<td colspan="4"><del>삭제된 글입니다.</del></td>
					</tr>
					<tr>
						<td>21</td>
						<td><a href="detail.jsp?boardno=21">이것이 자바다 괜찮은 책인가요??</a></td>
						<td>김유신</td>
						<td>1</td>
						<td>2020-05-25</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="text-right">
				<a href="form.jsp"><strong>[새글 등록하기]</strong></a>
			</div>
		</div>
		<div class="text-center">
			<form method="get" action="all.jsp">
				<label>검색조건</label>
				<select name="searchCondition" >
					<option value="title"> 제목</option>
					<option value="writer"> 작성자</option>
					<option value="content"> 내용</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="submit">검색</button>
			</form>
		</div>
		
	</div>
</div>
</body>
</html>