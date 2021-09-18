package com.dumveloper.damo.diary.controller;	

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.diary.service.CalendarService;
import com.dumveloper.damo.diary.service.DiaryService;

@Controller
public class DiaryController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService service;
	
	 @RequestMapping(value="/goDiary") 
	 public String GoDiary() {
		 logger.info("일기 페이지 요청");
		 return "diary/diary";
	 }
	 
	 @RequestMapping(value="/diaryDetail") 
	 public ModelAndView diaryDetail(@RequestParam String date) {
		 logger.info("일기 페이지 요청"+date);
		return service.diaryDetail(date);
	 }
}
