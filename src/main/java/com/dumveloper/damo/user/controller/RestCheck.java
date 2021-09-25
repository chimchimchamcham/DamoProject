package com.dumveloper.damo.user.controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.dto.DamoDTO;
import com.dumveloper.damo.user.service.UserService;


@RestController
@RequestMapping(value = "/check")// /rest로 요청이오면 이컨트롤러로 와라
public class RestCheck {
	
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
		logger.info("nick 중복 체크,{}",matchnick);
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
	
	@RequestMapping(value = "/alarms")
	public String alarms(@RequestParam String alarm,HttpSession session) {
		logger.info("alarms:{}",alarm);
		String ala  = service.alarmupdate(alarm,session);
		return ala;
	}
			
	//유저테이블 +페이징
	@RequestMapping(value = "/usertable/{page}")
	public HashMap<String, Object> usertable(@PathVariable int page) {
		
		HashMap<String, Object> map = service.noset_view_userlist(page);
		
		return map;
	}

	@RequestMapping(value = "/notifytable/{page}")
	public HashMap<String, Object> notifytable(@PathVariable int page) {
		
		HashMap<String, Object> map = service.notifylist(page);

		return map;
	}
	
	@RequestMapping(value = "/notifyinfo")
	public HashMap<String, Object> notifyinfo(@RequestParam int no) {
		
		logger.info("notifyinfo");

		HashMap<String, Object> map = service.findnotifyinfo(no);
		
	
		return map;
	}
	
	
	@RequestMapping(value = "/blacktable/{page}")
	public HashMap<String, Object> blacktable(@PathVariable int page) {
		
		HashMap<String, Object> map = service.blacklist(page);
		
		return map;
	}
	//블랙리스트 팝업
	@RequestMapping(value = "/blackinfo")
	public HashMap<String, Object> blackinfo(@RequestParam int no) {
		
		logger.info("blackinfo");

		HashMap<String, Object> map = service.findblackinfo(no);
		
	
		return map;
	}
	
	
	@RequestMapping(value = "/changenotify/{notifyval}/{state}")
	public void notifytable(@PathVariable int notifyval,@PathVariable String state) {
		logger.info("신고상태 변경");
		 service.changenotifystate(notifyval,state);
		

	}
	
	
}


