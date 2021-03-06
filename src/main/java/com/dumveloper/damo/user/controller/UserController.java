package com.dumveloper.damo.user.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.dto.DamoDTO;
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
		//블랙리스트랑 일치하는 아이디가 있으면
		logger.info("blacklistcheckYN : {}", blacklistcheck == null?"null":"notnull");
	if (blacklistcheck!=null) {
		
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
				logger.info((String)session.getAttribute("loginManager"));
				
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
		//블랙리스트랑 일치하는 아이디가 없으면
	}else {
		
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
			logger.info((String)session.getAttribute("loginManager"));
			
		}else {
			mav.setViewName("/user/login");
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요");
		}
		
		
		
		
		
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
	public ModelAndView join(@RequestParam HashMap<String, String> params) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("joinnow");
		
		
		// 전부 입력 체크
		logger.info("회원정보 전부 !null값 체크");
		for (String num : params.keySet()) {
			if (params.get(num)==null||params.get(num)=="") {
				String msg = "회원정보를 전부 입력해주세요";
				mav.addObject("msg",msg);
				mav.setViewName("/user/join");
				return mav;
			}
		}
		
		//비밀번호 및 비밀번호 확인 일치 여부
		logger.info("비밀번호 및 비밀번호 확인 일치 여부");
		String pw = params.get("pw");
		String pwcheck = params.get("pwcheck");
		if (pw.equals(pwcheck)) {
			
		}else {			
			String msg = "비밀번호랑 비밀번호 확인을 전부 입력해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("/user/join");
			return mav;
		}
		
		
		String check = "^[a-zA-Z0-9]*$";
		logger.info("아이디 영숫자 체크");
		//아이디 영숫자 체크
		String id = params.get("id");
		if (Pattern.matches(check, id)==false) {
			String msg = "아이디란에 영어 혹은 숫자만 입력해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("/user/join");
			return mav;
		}
		logger.info("비밀번호 영숫자 체크");
		//비밀번호 영숫자 체크
		if (Pattern.matches(check, pw)==false) {
			String msg = "비밀번호는 영어 혹은 숫자만 입력해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("/user/join");
			return mav;
		}
		logger.info("이메일 영숫자 체크");
		//이메일 영숫자 체크
		String email = params.get("email");
		if (Pattern.matches(check, email)==false) {
			String msg = "이메일는 영어 혹은 숫자만 입력해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("/user/join");
			return mav;
		}
		return service.join(params);
	}
	
	@RequestMapping(value = "/goupdate", method = RequestMethod.GET)
	public String goupdate(Model model,HttpSession session) {
		logger.info("updateinfo");
		DamoDTO dto = service.updateuserinfo(session);
		model.addAttribute("info", dto);
		
		HashMap< String, String> list = new HashMap<String, String>();
		session.setAttribute("filelist", list);
		
		return "/user/update_myinfo";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam HashMap<String, String> params,HttpSession session) {
		
			ModelAndView mav = new ModelAndView();
			logger.info("updatenow");
			for (String num : params.keySet()) {
				if (params.get(num)==null||params.get(num)=="") {
					String msg = "회원정보를 전부 입력해주세요";
					mav.addObject("msg",msg);
					mav.setViewName("/user/msg");
					return mav;
				}else{
					logger.info("update : {}",params);
				}
			}
			
			logger.info("update : {}",params);
			
			String pw = params.get("pw");
			logger.info("pw:{}",pw);
			String pwcheck = params.get("pwcheck");
			logger.info("pwcheck:{}",pwcheck);
			
			if (pw.equals(pwcheck)) {
				logger.info("비밀번호랑 확인 일치함");
			}else {
				String msg = "비밀번호랑 비밀번확인 다릅니다";
				mav.addObject("msg",msg);
				mav.setViewName("/user/msg");
				return mav;
			}

		return service.update(params,session);
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
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file,HttpSession session) {
		logger.info("업로드 요청:{}",file);
		return service.fileupload(file,session);
	}
	
	
	@RequestMapping(value = "/gouserlist")
	public ModelAndView gouserlist() {
		return service.userlist();
	}
	
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage(@RequestParam String u_id,@RequestParam(value = "myDirYN" , required = false)String myDirYN) {
		logger.info("마이페이지  요청");
		logger.info("myDirYN");
		return service.myPage(u_id,myDirYN);
	}

}
