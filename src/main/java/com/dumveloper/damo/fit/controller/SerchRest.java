package com.dumveloper.damo.fit.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.fit.service.FitService;

public class SerchRest {
	
	
	@RestController
	@RequestMapping(value = "/searching")// /rest로 요청이오면 이컨트롤러로 와라
	public class RestCheck {
		
		Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired FitService fitservice;

		
		@RequestMapping(value = "/searchlist", method = RequestMethod.POST)
		public HashMap<String, Object> click_title(@RequestParam HashMap<String,String> params) {
			logger.info("검색목록 접속");
			return fitservice.search_cnt(params);

		}
		
		
		
	}



}
