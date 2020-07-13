<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>formatDate 태그</h1>
		</div>
	</div>
	
	<%
		Date now = new Date();
		request.setAttribute("today", now);
	%>
	
	<div class="row">
		<div class="col-12">
			<p>${today }</p> <!-- Wed Jul 01 09:33:23 KST 2020 -->
			<p><fmt:formatDate value="${today }"/></p> <!-- 2020.7.1 -->
			<p><fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/></p> <!-- 2020-07-01 -->
			<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일"/></p> <!-- 2020년 7월 1일 -->
			<p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd HH:mm:ss"/></p> <!-- 2020/07/01 09:36:01 -->
			<p><fmt:formatDate value="${today }" pattern="a h시 m분 s초"/></p> <!-- 오전 9시 37분 19초 -->
			<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE"/></p> <!-- 2020년 7월 1일 수요일 -->
		</div>
	</div>
</div>
</body>
</html>