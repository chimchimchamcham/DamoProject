package com.dumveloper.damo.diary.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.diary.service.CalendarService;
import com.dumveloper.damo.dto.DamoDTO;


@RestController 
public class CalendarController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService service;
	
	@RequestMapping(value="/calendar") 
	 public ModelAndView list(HttpSession session) {

		 String id = (String) session.getAttribute("loginId");
		 
		 logger.info("로그인 아이디:{}",id);
		 logger.info("캘린더 요청"); 
		 
		 return  service.list(id);
	 }
	 
	 @RequestMapping(value="getMonthData/{formattedDate}")
	 public HashMap<String,String> getMonthData(@PathVariable String formattedDate,HttpSession session){
		logger.info("월 목표, 몸무게 요청");
		HashMap<String, String> map = new HashMap<String, String>();
		String id= (String)session.getAttribute("loginId");
		if(id==null) {
			map = null;
		}else {
			map = service.getMonthDByAjax(id,formattedDate);
		}
		 return map;
		 
	 }
	 
	
}
