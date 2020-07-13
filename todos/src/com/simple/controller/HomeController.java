package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class HomeController {
	
	private JSONView jsonView = new JSONView();
	private TodoService todoService = new TodoService();
	
	@RequestMapping("/home.hta")
	public ModelAndView home(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 서비스를 실행해서 조회된 최근 일정을 ModelAndView에 저장
		ModelAndView mav = new ModelAndView();
		
		List<TodoDto> todos = todoService.getRecentTodos();
		
		mav.addAttribute("todos", todos);
		mav.setViewName("home.jsp");
		
		return mav;
	}

}
