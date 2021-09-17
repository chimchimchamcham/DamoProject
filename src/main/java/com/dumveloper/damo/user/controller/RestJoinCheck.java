package com.dumveloper.damo.user.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dumveloper.damo.user.service.UserService;
import com.sun.glass.ui.Application;

@RestController
@RequestMapping(value = "/check")// /rest로 요청이오면 이컨트롤러로 와라
public class RestJoinCheck {
	
		Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired UserService service;

	@RequestMapping(value = "/matchid")
	public int mathIdcheck(@RequestParam String matchid) {
		logger.info("id 중복 체크");
		int alert = 0;
		if (matchid != null) {
			alert = service.check_id(matchid);
		}
		logger.info("alert:{}",alert);
		return alert;
	}
	
	
	@RequestMapping(value = "/matchnick")
	public int matchnick(@RequestParam String matchnick) {
		logger.info("nick 중복 체크");
		int alert = 0;
		if (matchnick != null) {
			alert = service.check_nick(matchnick);
		}
		logger.info("alert:{}",alert);
		return alert;
	}
	
	@RequestMapping(value = "/matchemail")
	public int matchemail(@RequestParam String matchemail,@RequestParam String matcheback) {
		logger.info("email 중복 체크");
		logger.info("matchemail:{}",matchemail);
		logger.info("matcheback:{}",matcheback);
		
		String email = matchemail+"@"+matcheback;
		
		int alert = 0;
		  if (matchemail != null && matcheback!=null) { 
			  alert = service.check_email(email); 
			  }
		  
		  
		  	logger.info("alert:{}",alert); 
		 	return alert;
		 
	}
	

			

	
	
	
}


