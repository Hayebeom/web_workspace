package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.service.UserService;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class UserController {
	
	private JSONView jsonView = new JSONView();
	private UserService userService = new UserService();
	
	// 회원가입 요청을 처리하는 요청 핸들러 메서드 구현
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// 요청 파라미터값 조회
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		
		// User 객체를  생성해서 값 저장
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(pwd);
		user.setEmail(email);

		// UserService의 addNewUser(User user)를 실행
		boolean isSuccess = userService.addNewUser(user);
		
		// ModelAndView객체를 생성
		// addUserUser의 반환값을 ModelAndView에 담기
		// mav.addAttribute("result", 반환값);
		ModelAndView mav = new ModelAndView();
		mav.addAttribute("result", isSuccess);
		mav.setView(jsonView);	// 클라이언트에 jsonText 응답을 제공
		// {"result:true} 혹은 {"result":false} JSON 텍스트가 응답으로 제공됨
		
		return mav;
	}
	
	@RequestMapping("/login.hta")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 요청파라미터 정보 조회
		String id = req.getParameter("userid");
		String password = req.getParameter("userpwd");
		
		// UserService의 loginCheck(String id, String password)를 실행
		User user = userService.loginCheck(id, password);
		// 반환값이 null이면 ModelAndView에 result -> false 저장
		ModelAndView mav = new ModelAndView();

		// 				아니면 ModelAndView에 result -> true를 저장
		if (user == null) {
			mav.addAttribute("result", false);
			mav.setView(jsonView);
		} else {
			mav.addAttribute("result", true);
			mav.setView(jsonView);
			// HttpSession 객체를 획득해서 "loginUser"라는 속성명으로 사용자정보를 세션에 저장
			// 얻을 때는 아마 user = (User) session.getAttribute("loginUser");
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
		}
		
		
		return mav;
	}
	
	@RequestMapping("/logout.hta")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false);

		// 세션을 무효화
		if (session != null) {
			session.invalidate();
		}
		
		// home.hta를 재요청 -> ModelAndView에 재요청URL을 담음
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/home.hta");
		return mav;
		
	}
}
