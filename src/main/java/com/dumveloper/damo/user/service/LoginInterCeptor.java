package com.dumveloper.damo.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterCeptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 체크 인터셉터");

		boolean pass = false;

		HttpSession session = request.getSession();
		Object loginId = session.getAttribute("loginId");
		
		if (loginId != null) { //로그인 됨
			pass = true;
			System.out.println("로그인 했음");
		} else { ////로그인 안됨
			System.out.println("로그인 안됨");
			response.sendRedirect("./loginCheck");
		}

		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav)
			throws Exception {

	}

}
