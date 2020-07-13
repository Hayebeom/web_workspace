package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.service.BookService;
import com.simple.vo.Book;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class HomeController {

	private BookService bookService = new BookService();
	
	@RequestMapping("/home.hta")
	public ModelAndView home(HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		mav.addAttribute("message", "홈페이지 방문을 환영합니다.");
		mav.setViewName("home.jsp");
		
//		BookDao bookDao = new BookDao();
//		List<Book> books = bookDao.getRecentBooks();
//		mav.addAttribute("recentBooks", books);
		// 더 이상 사용하지 않음, bookService를 통해서 할 것이기 때문
		
		List<Book> books = bookService.getRecentBooks();
		mav.addAttribute("recentBooks", books);
		
		return mav;
	}
}