package com.dumveloper.damo.diary.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		
		if(id != null) {
			ArrayList<DamoDTO>list = dao.list(id);
			logger.info("작성 일기 갯수 : {}",list.size());
			mav.addObject("list",list);
		}
		
		mav.setViewName("diary/calendar");
		return mav;
	}

	public HashMap<String, String> getMonthData(String id,String formattedDate) {
		logger.info("요청한 달:{}",formattedDate);
		HashMap<String, String> map = new HashMap<String, String>();
		DamoDTO dto = dao.getMonthData(id, formattedDate);
		
		//월 데이터가 없는 경우
		String tarExe= "-";
		String tarKcal= "-";
		
		if(dto != null) {
			tarExe = Integer.toString(dto.getC_tarExe());
			tarKcal = Integer.toString(dto.getC_tarKcal());
		}
		
		logger.info("운동 칼로리:{}",tarExe);
		logger.info("섭취 칼로리:{}", tarKcal);
		
		map.put("monthTarExe",tarExe);
		map.put("monthTarKcal",tarKcal);
		
;		return map;
	}
	
	
}
