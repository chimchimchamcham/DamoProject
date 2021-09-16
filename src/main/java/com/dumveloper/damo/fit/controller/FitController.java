package com.dumveloper.damo.fit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FitController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		logger.info("메인 페이지 접속");

		return "main";

	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(Model model) {

		logger.info("로그인 안됨!!!");
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		return "/user/login";

	}

	@RequestMapping(value = "/fitMain", method = RequestMethod.GET)
	public String fitMain(Model model) {

		logger.info("지식핏 페이지 접속");
		return "fit/fitMain";
	}

	@RequestMapping(value = "/fitWriteForm", method = RequestMethod.GET)
	public String fitWriteForm(Model model) {

		logger.info("지식핏 글쓰기 접속");
		return "fit/fitWriteForm";
	}
}
