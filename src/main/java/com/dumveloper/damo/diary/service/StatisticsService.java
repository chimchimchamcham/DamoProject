package com.dumveloper.damo.diary.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dumveloper.damo.diary.dao.StatisticsDAO;
import com.dumveloper.damo.dto.DamoDTO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StatisticsDAO dao;

	public HashMap<String, Object> myChart(String u_id, String dateData) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<DamoDTO> list = dao.myChart(u_id, dateData);
		logger.info("list size : {}",list.size());
		
		map.put("list", list);
		return map;
	}
	
	
}
