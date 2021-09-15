package com.dumveloper.damo.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class UserService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView check_terms(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		
		if ( params.get("checkone") != null && params.get("checktwo") != null) {
			mav.setViewName("join");
		}else {
			mav.setViewName("terms_of_use");
			mav.addObject("msg","약관에 모두 동의해주시기 바랍니다.");
		}		
		
		return mav;
	}
}
