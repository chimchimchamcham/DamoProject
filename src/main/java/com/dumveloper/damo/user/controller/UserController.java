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
		return "/user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String id,@RequestParam String pw,HttpSession session) {	
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("id:{}/pw:{}",id,pw);
		int cnt = service.login(id,pw);
		String file = service.photofile(id);
		String nick = service.nickname(id);
		String manager = service.manager(id);
		
		logger.info("photofile:{}",file);
		logger.info("photofile:{}",nick);
		
		logger.info(id+"의 갯수:"+cnt);			

		if (cnt>0) {
			mav.setViewName("redirect:/");
			mav.addObject("msg", "로그인에 성공했습니다");
			session.setAttribute("loginId",id);//아이디
			session.setAttribute("loginFile",file);//사진경로
			session.setAttribute("loginNick",nick);//닉네임
			session.setAttribute("loginManager",manager);//관리자여부Y/N
		}else {
			mav.setViewName("/user/login");
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요");
		}
		return mav;
	}
	
	@RequestMapping(value = "/Goidandpassfind", method = RequestMethod.GET)
	public String findid(Model model) {
		logger.info("find");
		return "/user/idandpassfind";
	}
	
	@RequestMapping(value = "/gojointerms", method = RequestMethod.GET)
	public String jointerms(Model model) {
		logger.info("jointerms");
		return "/user/terms_of_use";
	}
	
	@RequestMapping(value = "/gojoin")
	public ModelAndView CheckAndGoJoinForm(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("CheckAndGoJoinForm");
		logger.info("1:{}",params.get("checkone"));
		logger.info("2:{}",params.get("checktwo"));
		
		return service.check_terms(params);
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(Model model,@RequestParam HashMap<String, String> params) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("joinnow");
		
		for (String num : params.keySet()) {
			if (params.get(num)==null||params.get(num)=="") {
				String msg = "회원정보를 전부 입력해주세요";
				mav.addObject("msg",msg);
				mav.setViewName("/user/join");
				
				return mav;
			}else{
				logger.info("join : {}",params);
			}
		}
		return service.join(params);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		logger.info("로그아웃 요청");
		return "redirect:/";
	}
}
