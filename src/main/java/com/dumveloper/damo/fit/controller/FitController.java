package com.dumveloper.damo.fit.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dumveloper.damo.fit.service.FitService;

@Controller
public class FitController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FitService fitservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model ,HttpSession session) {

		logger.info("메인 페이지 접속 요청");
		String page= "main";
		
		if(session.getAttribute("loginId") != null) {
			logger.info("캘린더 페이지 접속 요청");
			page= "redirect:/calendar";
		}
		return page;

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

	
	@RequestMapping(value = "/bestFitList", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> bestFitList(Model model) {
		logger.info("많이본 지식핏 목록 접속");
		
		return fitservice.bestFitList();
	}
	
	@RequestMapping(value = "/newFitList", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> newFitList(@RequestParam HashMap<String,String> params) {
		logger.info("많이본 지식핏 목록 접속");
		logger.info("cnt"+params.get("cnt"));
		logger.info("category"+params.get("category"));
		
		return fitservice.newFitList(params);
	}

	@RequestMapping(value = "/fitWriteForm", method = RequestMethod.GET)
	public String fitWriteForm(Model model) {

		logger.info("지식핏 글쓰기 접속");
		return "fit/fitWriteForm";
	}
}
