package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dto.BookDetailDto;
import com.simple.service.BookService;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class BookController {
	
	private BookService bookService = new BookService();		// 연결 잭
	
	@RequestMapping("/book/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
//		BookDao bookDao = new BookDao();
//		List<Book> books = bookDao.getAllBooks();
		// 더 이상 사용하지 않음, bookService를 통해서 할 것임
		
		List<Book> books = bookService.getAllBooks();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/list.jsp");	// 뷰 페이지 이름
		mav.addAttribute("books", books);	// 뷰 페이지에 전달할 데이터
		
		return mav;
	}
	
	@RequestMapping("/book/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		int bookNo = NumberUtil.stringToInt(req.getParameter("bookno"));
		
//		BookDao bookDao = new BookDao();
//		ReviewDao reviewDao = new ReviewDao();
		
//		Book book = bookDao.getBookByNo(bookNo);
//		List<Review> reviews = reviewDao.getReviewsByBookNo(bookNo);
		// 이하 동일
		
		BookDetailDto dto = bookService.getBookDetailInfo(bookNo);
		
		ModelAndView mav = new ModelAndView();
//		mav.addAttribute("book", book);
//		mav.addAttribute("reviews", reviews);
		// ㅇㅎ ㄷㅇ
		
		mav.addAttribute("book", dto.getBook());
		mav.addAttribute("reviews", dto.getReviews());
		mav.setViewName("book/detail.jsp");
		
		return mav;
	}
}
