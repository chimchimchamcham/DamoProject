package com.dumveloper.damo.fit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FitController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,boolean pass, String msg) {

		logger.info("메인 페이지 접속");
		
		if(pass == false) {
			
		}
		
		return "main";
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
