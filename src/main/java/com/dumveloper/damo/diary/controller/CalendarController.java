package com.dumveloper.damo.diary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/calendar")
public class CalendarController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*
	 * @RequestMapping(value="/") public ModelAndView list() {
	 * logger.info("캘린더 요청"); //return service.list(); }
	 */
	
}
