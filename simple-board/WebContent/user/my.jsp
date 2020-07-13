<%@page import="com.simple.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>나의 정보</h1>
	</div>
	<div class="body">
		
		<%
			BoardDao boardDao = new BoardDao();
			List<BoardDto> boards = boardDao.getBoardByUserId(LOGINED_USER_ID);
			
			// ReplyDao replyDao = new ReplyDao();
			// List<replyDao> replys = replyDao.getReplyByUserId(LOINED_USER_NAME);
		%>
		
		<p><strong><%=LOGINED_USER_NAME %></strong>님의 정보를 확인하세요</p>
		
		<div>
			<h3>내가 작성한 글</h3>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th class="text-center">조회수</th>
						<th class="text-center">댓글수</th>
						<th class="text-center">삭제여부</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
				<%
					//if (boards.isEmpty()) {
				%>
					<tr>
						<td>작성한 글이 없습니다.</td>
					</tr>
				<%
					//} else {
						//for (BoardDto board : boards) {
				%>
				
				<!-- 1자리에 <=board.getNo() %> -->
					<tr>
						<td class="text-center">1</td>
						<td><a href="../board/detail.jsp?no=1">연습입니다.</a></td>
						<td class="text-center">10</td>
						<td class="text-center">3</td>
						<td class="text-center">Yes</td>
						<td class="text-center">2020-05-21</td>
					</tr>
				<%
						//}
					//}
				%>	
				</tbody>
			</table>
		</div>
		
		<div>
			<h3>내가 작성한 댓글</h3>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>내용</th>
						<th class="text-center">삭제여부</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
				
				<%
					//replys.isEmpty() {
				%>
					<tr>
						<td>작성한 댓글이 없습니다</td>
					</tr>
				<%
					//} else {
						//for (ReplyDto replys : reply) {
				%>
					<tr>
						<td class="text-center">1</td>
						<td>댓글입니다. 댓글입니다.</td>
						<td class="text-center">Yes</td>
						<td class="text-center">2020-04-31</td>
					</tr>
				<%
						//}
					//}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>