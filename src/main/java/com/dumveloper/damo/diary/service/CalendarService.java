package com.dumveloper.damo.diary.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.diary.dao.CalendarDAO;
import com.dumveloper.damo.dto.DamoDTO;

@Service
public class CalendarService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarDAO dao;
	
	public ModelAndView list(String id) {
		LocalDate now = LocalDate.now();
		logger.info("오늘 날짜 출력:{}",now);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM");
		String formatedNow = now.format(format);
		logger.info("오늘 날짜 기준 달 출력 : {}",formatedNow);
		
		ModelAndView mav = new ModelAndView();
		ArrayList<DamoDTO>list = dao.list(id,formatedNow);
		logger.info("작성 일기 갯수 : {}",list.size());
		mav.addObject("list",list);
		mav.setViewName("diary/calendar");
		return mav;
	}
	
	
}
