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
import com.dumveloper.damo.user.dao.NotifyDAO;

@Service
public class BlackListService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BlackListDAO blackdao;
	@Autowired NotifyDAO notifydao;
	
	
	@Transactional
	public ModelAndView registerblacklist(String resivedid, String adminid, String scope, Date endtime, String content, int notifynum) {
		logger.info("블랙리스트 등록 서비스");
		
		ModelAndView mav = new ModelAndView();
		
		
		int check = blackdao.checkrecbid(resivedid);
		
		if (check==0) {
			
			blackdao.dbregister(resivedid,scope,endtime,content,adminid);
			notifydao.updatenotify(notifynum);			
		
			
					
			String msg = "블랙리스트를 등록했습니다";
					
			mav.addObject(msg, "msg");
			mav.setViewName("redirect:/gouserlist");
		}else{
			String msg = "블랙리스트에"+resivedid+"는 이미 등록되어있습니다";
			mav.addObject(msg, "msg");
			mav.setViewName("redirect:/gouserlist");
		}
		
		return mav;
	}
}
