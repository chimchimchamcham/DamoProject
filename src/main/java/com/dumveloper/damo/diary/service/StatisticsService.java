package com.dumveloper.damo.diary.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dumveloper.damo.diary.dao.StatisticsDAO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StatisticsDAO dao;
	
	
}
