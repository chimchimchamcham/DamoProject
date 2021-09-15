package com.dumveloper.damo.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/Gologin", method = RequestMethod.GET)
	public String login(Model model) {
		logger.info("login");
		return "login";
	}
	@RequestMapping(value = "/Goidandpassfind", method = RequestMethod.GET)
	public String findid(Model model) {
		logger.info("find");
		return "idandpassfind";
	}
	
	
}
