package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.simple.vo.User;

public class LoginCheckFilter implements Filter {
	
	private String loginCheckUrl;
	private String loginUncheckUrl;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		loginCheckUrl = filterConfig.getInitParameter("checkURL");
		loginUncheckUrl = filterConfig.getInitParameter("uncheckURL");
		System.out.println("로그인 체크 URL : " + loginCheckUrl);
		System.out.println("로그인 언체크 URL : " + loginUncheckUrl);
	}
	
	@Override
	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 여기 적으면 전처리 작업
		// 로그인 체크는 보통 전처리에서만 함 (후처리에서 하지 않음)
		
		HttpServletRequest httpReq = (HttpServletRequest) request;
		String requestUrl = httpReq.getRequestURI();
		
		// 요청 url이 로그인체크 url과 일치하는 경우
		if (requestUrl.equals(loginCheckUrl)) {
			// 로그인 여부를 확인
			HttpSession session = httpReq.getSession();
			User user = (User) session.getAttribute("loginUser");
			// 세션에 loginUser정보가 존재하지 않으면 error.jsp로 이동시킴
			if (user == null) {
				httpReq.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
				return;
			}

		}
			// 요청url과 로그인 체크 url이 일치하지 않은 경우
			// 로그인 여부를 체크할 필요가 없으므로 다음번 필터나 서블릿을 실행
			chain.doFilter(request, response);
		

	}
}
