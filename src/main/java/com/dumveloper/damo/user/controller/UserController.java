package com.dumveloper.damo.user.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
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
	public ModelAndView login(@RequestParam String id,@RequestParam String pw,HttpSession session) throws Exception{	
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("id:{}/pw:{}",id,pw);
		int cnt = service.login(id,pw);
		
		//블랙리스트 여부
		HashMap<Object, String> blacklistcheck = service.check(id);
		logger.info("blacklistcheck:{}",blacklistcheck);
		
		String b_id = blacklistcheck.get("U_ID");
		String b_content = blacklistcheck.get("B_CONTENT");
		String b_endtime = blacklistcheck.get("ENDTIME");
		//블랙리스트 끝나는 시간
		Date endtime = new SimpleDateFormat("yyyy-MM-dd").parse(b_endtime);
		SimpleDateFormat newdateformat = new SimpleDateFormat("yyyy-MM-dd");
		
		String endFormat = newdateformat.format(endtime);

		
		//현제날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String now_dt = format.format(now);
		logger.info("now_dt:{}",now_dt);

		
		logger.info("blacklistcheck_id:{}",b_id);
		logger.info("blacklistcheck_content:{}",b_content);
		logger.info("blacklistcheck_ENDTIME:"+endFormat);
		

		int compare = endFormat.compareTo(now_dt);
		
		logger.info("blacklistcheck_compare:"+compare);
		
		if (compare<=0) {
			
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
		}else {
			mav.setViewName("/user/login");
			mav.addObject("msg", "당신은"+b_content+"때문에"+endFormat+"까지"+" 블랙리스트에 등록되어 로그인이 불가합니다");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/Goidandpassfind", method = RequestMethod.GET)
	public String Goidandpassfind(Model model) {
		logger.info("find");
		return "/user/idandpassfind";
	}
	
	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public ModelAndView findid(@RequestParam String name,@RequestParam String email) {
		logger.info("findid");
		return service.idfind(name,email);
	}
	
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public ModelAndView findpw(@RequestParam String id,@RequestParam String name,@RequestParam String email,@RequestParam String pw,@RequestParam String checkpass) {
		
		logger.info("findpw");
		return service.pwfind(id,name,email,pw,checkpass);
	
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
	
	@RequestMapping(value = "/goupdate", method = RequestMethod.GET)
	public String goupdate(Model model) {
		logger.info("updateinfo");
		return "/user/update_myinfo";
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId"); //아이디
		session.removeAttribute("loginFile"); //파일이름
		session.removeAttribute("loginNick");//닉네임
		session.removeAttribute("loginManager");//관리자 여부
		logger.info("로그아웃 요청");
		return "redirect:/";
	}
}
