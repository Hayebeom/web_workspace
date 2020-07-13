<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>책정보 등록 폼</h1>
	
	<h3>신규 책정보를 입력하세요</h3>
	<form action="bookregister.jsp" method="post">
		<!-- 제목, 저자, 장르, 출판사, 가격, 할인가격, 입고 수량을 입력받는 폼 -->
		<div>
			<label>제목</label>
			<div><input type="text" name="usertitle"/></div>
		</div>
		<div>
			<label>저자</label>
			<div><input type="text" name="author"/></div>
		</div>
		<div>
			<label>장르</label>
			<div>
				<select name="genre">
					<option value="romance">로맨스</option>
					<option value="spacefantacy">SF</option>
					<option value="misstary">미스터리</option>
				</select>
			</div>
		</div>
		<div>
			<label>출판사</label>
			<div><input type="text" name="publisher"/></div>
		</div>
		<div>
			<label>가격</label>
			<div><input type="number" name="price"/></div>
		</div>
		<div>
			<label>할인가격</label>
			<div><input type="number" name="discountprice"/></div>
		</div>
		<div>
			<label>입고 수량</label>
			<div><input type="number" name="stock"/></div>
		</div>
		<div>
			<label>개인정보 제공 동의</label>
			<div>
				<input type="checkbox" name="useragreement" value="yes"> 동의합니다.
			</div>
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>