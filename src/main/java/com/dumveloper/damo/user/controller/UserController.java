package com.dumveloper.damo.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.dumveloper.damo.user.service.UserService;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value = "/Gologin", method = RequestMethod.GET)
	public String Gologin(Model model) {
		logger.info("login");
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String id,@RequestParam String pw,HttpSession session) {	
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("id:{}/pw:{}",id,pw);
		int cnt = service.login(id,pw);
		logger.info(id+"의 갯수:"+cnt);			

		if (cnt>0) {
			mav.setViewName("/index");
			mav.addObject("msg", "로그인에 성공했습니다");
			session.setAttribute("loginId",id);
		}else {
			mav.setViewName("login");
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요");
		}
		return mav;
	}
	
	@RequestMapping(value = "/Goidandpassfind", method = RequestMethod.GET)
	public String findid(Model model) {
		logger.info("find");
		return "idandpassfind";
	}
	
	@RequestMapping(value = "/gojointerms", method = RequestMethod.GET)
	public String jointerms(Model model) {
		logger.info("jointerms");
		return "terms_of_use";
	}
	
	@RequestMapping(value = "/gojoin")
	public ModelAndView CheckAndGoJoinForm(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("CheckAndGoJoinForm");
		logger.info("1:{}",params.get("checkone"));
		logger.info("2:{}",params.get("checktwo"));
		
		return service.check_terms(params);
	}
	
	@RequestMapping(value = "/join")
	public void join(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("CheckAndGoJoinForm");
		logger.info("id:{}",params.get("id"));
		logger.info("name:{}",params.get("name"));
		logger.info("nick:{}",params.get("nick"));
		logger.info("pass:{}",params.get("pass"));
		logger.info("passcheck:{}",params.get("passcheck"));
		logger.info("email:{}",params.get("email"));
		logger.info("emailand:{}",params.get("emailand"));
		logger.info("sex:{}",params.get("sex"));
		logger.info("age:{}",params.get("age"));
		logger.info("weight:{}",params.get("weight"));
		logger.info("tarweight:{}",params.get("tarweight"));
		logger.info("stature:{}",params.get("stature"));
	}
	
	
}
