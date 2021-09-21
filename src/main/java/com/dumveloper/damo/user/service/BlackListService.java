package com.dumveloper.damo.user.service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.user.dao.BlackListDAO;

@Service
public class BlackListService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BlackListDAO dao;
	
	@Transactional
	public ModelAndView registerblacklist(String resivedid, String adminid, String scope, Date endtime, String content) {
		logger.info("블랙리스트 등록 서비스");
		
	
		
		dao.dbregister(resivedid,scope,endtime,content,adminid);
		
		ModelAndView mav = new ModelAndView();
				
		String msg = "블랙리스트를 등록했습니다";
				
		mav.addObject(msg, "msg");
		mav.setViewName("redirect:/gouserlist");
		
		return mav;
	}
}
