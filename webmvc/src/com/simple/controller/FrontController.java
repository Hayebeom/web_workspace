package com.simple.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.controller.book.AddController;
import com.simple.controller.book.DeleteReviewController;
import com.simple.controller.book.DetailController;
import com.simple.controller.book.FormController;
import com.simple.controller.book.ListController;
import com.simple.controller.login.LoginCheckController;
import com.simple.controller.login.LoginFormController;

public class FrontController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FrontController.service(req, res) 실행됨...");
		
		// 한글 처리를 위한 인코딩방식 지정
		req.setCharacterEncoding("utf-8");
		
		// 클라이언트의 요청 분석하기
		String requestURI = req.getRequestURI();
		requestURI = requestURI.replace("/webmvc", "");
		System.out.println("요청 URI : " + requestURI); // 어떤 요청인지 알아내기 위한 식별자
		
	//	String viewPage = null;
		try {
//			if ("/home.hta".equals(requestURI)) {
//				// 데이터를 획득하는 자바클래스를 실행
//	//			viewPage = "home.jsp";
//	//			req.setAttribute("message", "홈페이지 방문을 환영합니다.");
//				HomeController controller = new HomeController();
//				viewPage = controller.process(req, resp);
//			} else if ("/list.hta".equals(requestURI)) {
//				viewPage = "list.jsp";
//			} else if ("/detail.hta".equals(requestURI)) {
//				viewPage = "detail.jsp";
//			}
//			
//			if (viewPage != null) {
//				// 지정된 viewPage로 내부이동하기
//				req.getRequestDispatcher("/WEB-INF/views/" + viewPage).forward(req, resp);
//			}
			Controller controller = null;
			
			// 요청URI에 해당하는 (요청을 처리할) 적절한 컨트롤러 객체 생성	
			if ("/home.hta".equals(requestURI)) {
				controller = new HomeController();
			} else if ("/book/list.hta".equals(requestURI)) {
				controller = new ListController();
			} else if ("/book/detail.hta".equals(requestURI)) {
				controller = new DetailController();
			} else if ("/book/form.hta".equals(requestURI)) {
				controller = new FormController();
			} else if ("/book/add.hta".equals(requestURI)) {
				controller = new AddController();
			} else if ("/login/form.hta".equals(requestURI)) {
				controller = new LoginFormController();
			} else if ("/login/check.hta".equals(requestURI)) {
				controller = new LoginCheckController();
			} else if ("/book/delReview.hta".equals(requestURI)) {
				controller = new DeleteReviewController();
			} else {
				controller = new HomeController();
			}
			
			// xxxController의 process(req, res) 메서드 실행으로 요청처리
			// 이동할 뷰 페이지 이름 제공받기
			String path = controller.process(req, resp);
			
			// 내부 이동시키기
//			req.getRequestDispatcher("/WEB-INF/views/" + path).forward(req, resp);
			
			if(path.startsWith("redirect:")) {
				// 재요청 URI를 응답으로 제공
				path = path.replace("redirect:", "");
				resp.sendRedirect(path);
			} else {
				// JSP 페이지로 내부 이동
				req.getRequestDispatcher("/WEB-INF/views/" + path).forward(req, resp);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
