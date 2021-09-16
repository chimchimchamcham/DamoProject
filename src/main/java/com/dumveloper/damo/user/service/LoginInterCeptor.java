package com.dumveloper.damo.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dumveloper.damo.dto.DamoDTO;

public class LoginInterCeptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 체크 인터셉터");

		boolean pass = false;

		HttpSession session = request.getSession();
		DamoDTO info = (DamoDTO) session.getAttribute("loginId");
		
		if (info != null) {
			pass = true;
			System.out.println(info.getU_id() + "로그인 했음");
		} else {
			System.out.println("로그인 안됨");
			response.sendRedirect("redirect:/");
		}

		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav)
			throws Exception {

	}

}
