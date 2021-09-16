package com.dumveloper.damo.fit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.fit.service.FitService;

@Controller
public class FitController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FitService fitservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("메인 페이지 접속");
		return "main";
	}
	
	@RequestMapping(value = "/fitMain", method = RequestMethod.GET)
	public ModelAndView fitMain() {
		logger.info("지식핏 페이지 접속");
		
		ModelAndView mav = new ModelAndView();
		
		//return "fit/fitMain";
		return fitservice.fitMain();
	}
	
	@RequestMapping(value = "/fitWriteForm", method = RequestMethod.GET)
	public String fitWriteForm(Model model) {
		
		logger.info("지식핏 글쓰기 접속");
		return "fit/fitWriteForm";
	}
}
