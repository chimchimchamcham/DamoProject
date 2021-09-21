package com.dumveloper.damo.user.controller;

import java.sql.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.user.service.BlackListService;
import com.dumveloper.damo.user.service.UserService;

@Controller
public class BlackListController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BlackListService service;
	
	
	@RequestMapping(value = "/registerblacklist/{resivedid}/{adminid}/{scope}/{endtime}/{content}")
	public ModelAndView registerblacklist(Model model,@PathVariable String resivedid,@PathVariable String adminid,@PathVariable String scope,@PathVariable Date endtime,@PathVariable String content) {
		
		
		logger.info("블랙리스트 등록 시작");
		logger.info("가져온 인자값:{}/{}",scope,endtime);
		logger.info("가져온 인자값:{}/{}",content,resivedid);
		logger.info("가져온 인자값:{}",adminid);
		
		ModelAndView mav = service.registerblacklist(resivedid,adminid,scope,endtime,content);
		
		
		return mav;
	}
	
	
}
