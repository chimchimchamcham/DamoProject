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
			
			ArrayList<String> monthData = getMonthData(id, formatedNow);
			
			mav.addObject("list",list);
			mav.addObject("monthTarExe",monthData.get(0));
			mav.addObject("monthTarKcal",monthData.get(1));
			mav.addObject("monthContent",monthData.get(2));
			
			DamoDTO weightData = dao.getWeight(id);
			
			//weightData.getU_tarWeight() 
		}
		
		mav.setViewName("diary/calendar");
		return mav;
	}
	
	//달 변경시 Ajax로 한달 목표 섭취, 운동 칼로리 와 목표 던져주는 메서드
	public HashMap<String, String> getMonthDByAjax(String id,String formattedDate) {
		logger.info("요청한 달:{}",formattedDate);
		HashMap<String, String> map = new HashMap<String, String>();
		ArrayList<String> list = getMonthData(id,formattedDate);
		
		//map에 담아주기
		map.put("monthTarExe",list.get(0));
		map.put("monthTarKcal",list.get(1));
		map.put("monthContent", list.get(2));
		
;		return map;
	}
	
	//한달 목표 섭취, 운동 칼로리 와 목표 가져오는 메서드
	public ArrayList<String> getMonthData(String id,String formattedDate) {
		ArrayList<String> list = new ArrayList<String>();
		DamoDTO dto = dao.getMonthData(id, formattedDate);
		
		//월 데이터가 없는 경우
		String tarExe= "-";
		String tarKcal= "-";
		String content = "-";
		
		if(dto != null) {
			tarExe = Integer.toString(dto.getC_tarExe());
			tarKcal = Integer.toString(dto.getC_tarKcal());
			content = dto.getC_content();
		}
		
		logger.info("운동 칼로리:{}",tarExe);
		logger.info("섭취 칼로리:{}", tarKcal);
		logger.info("한달 목표:{}",content);
		
		list.add(tarExe);
		list.add(tarKcal);
		list.add(content);
		
		return list;
	}
	
}
