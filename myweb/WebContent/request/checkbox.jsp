<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>체크박스 체크된 값 서버로 전달</h1>
	
	<form method="POST" action="checkboxview.jsp">
	<div>
			<label>이름</label>
		<div>
			<div><input type="text" name="name"/></div>
		</div>
			<label>지원분야</label>
		<div>
			<div><input type="radio" name="job" value="old"/>경력직</div>
			<div><input type="radio" name="job" value="new" checked/>신입</div>
		</div>
			<label>보유기술</label>
		<div>
			<div><input type="checkbox" name="skill" value="java"/>자바</div>
			<div><input type="checkbox" name="skill" value="DB"/>데이터베이스</div>
			<div><input type="checkbox" name="skill" value="web"/>웹개발</div>
			<div><input type="checkbox" name="skill" value="data"/>데이터분석</div>
			<div><input type="checkbox" name="skill" value="ML"/>머신러닝</div>
		</div>
		<div>
			<button type="submit">제출</button>
		</div>
	</div>
	</form>
</body>
</html>