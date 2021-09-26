package com.dumveloper.damo.user.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dumveloper.damo.user.service.NotifyService;

@Controller
public class NotifyController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired	NotifyService notifyservice;

	@RequestMapping(value = "/userNotify", method = RequestMethod.GET)
	public @ResponseBody String userNotify(@RequestParam HashMap<String, String> params) {

		logger.info("지식핏 신고등록 접속");
		logger.info("parmas : {}", params);

		return notifyservice.userNotify(params);
	}
	
	@RequestMapping(value = "/fitNotify", method = RequestMethod.GET)
	public @ResponseBody String fitNotify(@RequestParam HashMap<String, String> params) {

		logger.info("지식핏 신고등록 접속");
		logger.info("parmas : {}", params);		

		return notifyservice.fitNotify(params);
	}
}
