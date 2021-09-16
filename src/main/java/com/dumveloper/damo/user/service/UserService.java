package com.dumveloper.damo.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
			mav.setViewName("/user/join");
		}else {
			mav.setViewName("/user/terms_of_use");
			mav.addObject("msg","약관에 모두 동의해주시기 바랍니다.");
		}		
		
		return mav;
	}
	
	
	//로그인
	@Transactional
	public int login(String id, String pw) {
		return dao.login(id,pw);
	}

	//회원 가입
	@Transactional
	public ModelAndView join(HashMap<String, String> param) {
		
		String email = param.get("email")+"@"+param.get("emailand");
		
		//if (param.get("pass").equals(param.get("passcheck"))) {
			
		logger.info(email);
	
		DamoDTO dto = new DamoDTO();
		dto.setU_id(param.get("id"));
		dto.setU_name(param.get("name"));
		dto.setU_nick(param.get("nick"));
		dto.setU_pw(param.get("pw"));
		dto.setU_email(email);
		dto.setU_gender(param.get("gender"));
		dto.setU_age(Integer.parseInt(param.get("age")));
		dto.setU_weight(Integer.parseInt(param.get("weight")));
		dto.setU_tarWeight(Integer.parseInt(param.get("tarweight")));
		dto.setU_height(Integer.parseInt(param.get("height")));
		
		//}
		
		int success = dao.join(dto);//이번에는 파라미터를 dto로 전달
		String msg = "등록에 실패했습니다";
		String page = "/user/join";
		if(success>0) {
			msg = "등록에 성공했습니다";
			page = "/user/login"; //로그인 페이지
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName(page);
		
		logger.info("join success : {}",success); 
		
		return mav;
	}

	public ModelAndView idfind(String name, String email) {
		ModelAndView mav = new ModelAndView();
		
		String id = dao.iddbfind(name,email);
		
		String msg = "일치한 아이디가 존재하지 않습니다";
		String page = "/user/idandpassfind";
		if(id!=null) {
			msg = "아이디는"+id+"입니다";
			page = "/user/idandpassfind";
		}
		
		mav.addObject("msg",msg);
		mav.setViewName(page);
		
		logger.info("find id success : {}",id); 
		
		return mav;
	}
	
	public ModelAndView pwfind(String id, String name, String email, String pw) {
		ModelAndView mav = new ModelAndView();
		
		logger.info("hellowservice:{},",id);
		logger.info("hellowservice:{},",pw);
		logger.info("hellowservice:{},",name);
		logger.info("hellowservice:{},",email);
		
		int success = dao.pwdbfind(id,name,email,pw);
		String msg = "입력한 정보에 일치하는 회원이 없습니다";
		String page = "/user/idandpassfind";
		if(success>0) {
			msg = "비밀번호 변경에 성공했습니다";
		}
		mav.addObject("msg",msg);
		mav.setViewName(page);
		logger.info("find id success : {}",success); 
		
		return mav;
	}
	
	//중복체크
	public int check_id(String matchid) {
		int ismatch = dao.checkdbId(matchid);
		return ismatch;
	}
	public int check_nick(String matchnick) {
		int ismatch = dao.checkdbnink(matchnick);
		return ismatch;
	}
	public int check_email(String email) {
		int ismatch = dao.checkdbemail(email);
		return ismatch;
	}
	
	
	
	//세션 만들때 데이터 가져오는 메소드
	public String photofile(String id) {
		return dao.dbfilename(id);
	}
	public String nickname(String id) {
		return dao.dbninkname(id);
	}
	public String manager(String id) {
		return dao.dbmanager(id);
	}











	
}
