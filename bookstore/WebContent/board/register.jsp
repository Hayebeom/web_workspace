<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 요청파라미터값(폼입력값) 조회
	// 제목 저자 장르 출판사 가격 할인가격 입고량 
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String genre = request.getParameter("genre");
	String publisher = request.getParameter("publisher");
	int price = (int) Integer.parseInt(request.getParameter("price"));
	int discountPrice = (int) Integer.parseInt(request.getParameter("discountPrice"));
	int stock = (int) Integer.parseInt(request.getParameter("stock"));
	
	// Book 객체에 담기
	//Book book = new Book();
	//book.setTitle(title);
	
	// BookDao 생성, 저장하기 실행
	//BookDao bookDao = new BookDao();
	//bookDao.insertBook(book);
	
	// 클라이언트에 재요청 URL 전송
	response.sendRedirect("list.jsp");
	
%>