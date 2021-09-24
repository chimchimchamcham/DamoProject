package com.dumveloper.damo.diary.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dumveloper.damo.diary.service.StatisticsService;

@Controller
public class StatisticsController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StatisticsService service;
	
	@RequestMapping(value="/statistics")
	 public String statistics(Model model) {
		logger.info("통계 그래프 폼 호출");
		
		return "diary/statistics";
	}
	
	@RequestMapping(value="myChart/{dateData}")
	 public @ResponseBody HashMap<String,Object> myChart(@PathVariable String dateData,HttpSession session){
		logger.info("통계 그래프 호출");
		
		String u_id = (String) session.getAttribute("loginId");
		
		return service.myChart(u_id,dateData);
	}
}
