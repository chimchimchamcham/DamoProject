package com.dumveloper.damo.diary.controller;	

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dumveloper.damo.diary.service.CalendarService;

@Controller
public class DiaryController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService service;
	
	 @RequestMapping(value="/GoDiary") 
	 public String GoDiary() {
		 logger.info("일기 페이지 요청");
		 return "diary/diary";
	 }
}
