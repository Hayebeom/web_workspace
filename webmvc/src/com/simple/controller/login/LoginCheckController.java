package com.simple.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.controller.Controller;
import com.simple.dao.UserDao;
import com.simple.vo.User;

public class LoginCheckController implements Controller{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String userId = req.getParameter("userid");
		String userPassword = req.getParameter("userpwd");

		UserDao userDao = new UserDao();
		User user = userDao.getUserById(userId);
		
		if (user == null) {
			// http://localhost/webmvc/login//////check.jsp
			return "redirect:form.hta?error=fail";
		}
		
		if (!user.getPassword().equals(userPassword)) {
			// http://localhost/webmvc/login//////check.jsp
			return "redirect:form.hta?error=fail";
		}
		
		// 서버의 세션객체에 로그인한 사용자 정보 저장
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", user);
		
		// http://localhost/webmvc/login/check.hta
//		return "redirect:home.hta"; login에 없어서 이렇게 쓰면 안됨
		return "redirect:../home.hta";
	}
}
