package com.dumveloper.damo.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.dto.DamoDTO;
import com.dumveloper.damo.user.dao.UserDAO;

@Service
public class UserService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserDAO dao;
	
	//회원가입 약관동의
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
	
	//로그인
	public int login(String id, String pw) {
		return dao.login(id,pw);
	}
	
}
