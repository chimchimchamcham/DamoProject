package com.dumveloper.damo.diary.controller;	


import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 public @ResponseBody HashMap<String, Object> diaryDetail(@RequestParam String date,@RequestParam String id) {
		 logger.info("일기 상세보기"+date+id);
		return service.diaryDetail(date,id);
	 }
}
