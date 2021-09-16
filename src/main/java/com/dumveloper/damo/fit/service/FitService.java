package com.dumveloper.damo.fit.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.fit.dao.FitDAO;

@Service
public class FitService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FitDAO fitdao;
	
	public ModelAndView fitMain() {
		
		ModelAndView mav = new ModelAndView();
		
		//최신글의 지식핏 목록을 가져온다
		
		//해당 
		return null;
	}
}
