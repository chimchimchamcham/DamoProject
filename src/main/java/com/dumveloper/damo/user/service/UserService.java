package com.dumveloper.damo.user.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.dumveloper.damo.dto.DamoDTO;
import com.dumveloper.damo.user.dao.UserDAO;

@Service
public class UserService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserDAO dao;
	
	//@Value("#{config['Globals.filePath']}")String root;
	
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

	//로그인할때 블랙리스트 체크
	public HashMap<Object, String> check(String id) {
		return dao.dbblacklist(id);
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
	
	public ModelAndView pwfind(String id, String name, String email, String pw, String checkpass) {
		ModelAndView mav = new ModelAndView();
		
		logger.info("hellowservice:{},",id);
		logger.info("hellowservice:{},",pw);
		logger.info("hellowservice:{},",name);
		logger.info("hellowservice:{},",email);
		logger.info("hellowservice:{},",checkpass);
		
		if (pw.equals(checkpass)) {
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
		}else {
			String msg = "새 비밀번호랑 비밀번호확인이 일치하지 않습니다";
			String page = "/user/idandpassfind";
			mav.addObject("msg",msg);
			mav.setViewName(page);
		}
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



	//세션
	public DamoDTO updateuserinfo(HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		return dao.userinfo(id);
	}


	public ModelAndView update(HashMap<String, String> param, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		DamoDTO dto = new DamoDTO();
		
		dto.setU_id(id);
		dto.setU_nick(param.get("nick"));
		String mynick = param.get("nick");
		int is_nick_match_athernick = dao.nink_me_and_aother_check(mynick);//닉네임 다른 유저와 겹치는지 확인
		dto.setU_pw(param.get("pw"));
		dto.setU_gender(param.get("gender"));
		dto.setU_age(Integer.parseInt(param.get("age")));
		dto.setU_tarWeight(Integer.parseInt(param.get("tarweight")));
		dto.setU_height(Integer.parseInt(param.get("height")));
		dto.setU_intro(param.get("u_intro"));
		
		ModelAndView mav = new ModelAndView();
		int success = dao.update(dto);//이번에는 파라미터를 dto로 전달
		
		 int ismynick = dao.checkdbnink(mynick);//db에 있는 닉네임이 지금 파라메터에 들어가있는 닉네임 하고 동일하나 체크 
		 System.out.println(ismynick);
		 
	if (ismynick==1) {
		if(success>0) {
			String msg = "수정에 성공했습니다";
			String page = "/diary/calendar";//마이페이지 만들어지면 그쪽으로
			
			mav.addObject("msg",msg);
			mav.setViewName(page);
		}
	}else {
		if (is_nick_match_athernick>0) {
			String msg = "다른사람과 닉네임이 겹처서 수정에 실패했습니다";
			String page = "/user/msg";
			
			
			mav.addObject("msg",msg);
			mav.setViewName(page);
		}else {
			String msg = "수정에 실패했습니다";
			String page = "/user/msg";
			
			if(success>0) {
				msg = "수정에 성공했습니다";
				page = "/diary/calendar";//마이페이지 만들어지면 그쪽으로
				
				
			}
			
			mav.addObject("msg",msg);
			mav.setViewName(page);
			logger.info("update success : {}",success); 
		}
	}

		return mav;
		
	}


private int checkdbnink(String id) {
		// TODO Auto-generated method stub
		return 0;
	}


public ModelAndView fileupload(MultipartFile file, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		logger.info("id 요청:{}",id);
		mav.setViewName("redirect:/goupdate");
		
		logger.info("hellow_file");
		
		//1 파일명 추출
		String fileName = file.getOriginalFilename();
		//2 신규 파일명== 겹치는 파일 없게 중복되지
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		//3db에 저장
		dao.dbphotoname(id,newFileName);
		//4 파일 다운로드
		try {
			byte[] bytes = file.getBytes();
			//이 저장방식은 java7부터 가능(java.nio)
			Path filePath = Paths.get("C:/upload/"+newFileName);//경로지정
			Files.write(filePath, bytes);//저장

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return mav;
	}

		//알람체크
		public String alarmupdate(String alarm, HttpSession session) {
			String id = (String)session.getAttribute("loginId");
			logger.info(id);
			String yn="";
			if (alarm.equals("off")) {
				yn = "Y";
				dao.dbalarmupdate(yn,id);
				logger.info(yn);
			}else if(alarm.equals("on")){
				yn = "N";
				dao.dbalarmupdate(yn,id);
				logger.info(yn);
			}
			
			
			return yn;
		}

		//관리 페이지로 갈때 처음으로 뿌려주는 데이터
		public ModelAndView userlist() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/user/mamnager");
			ArrayList<DamoDTO> userlist = dao.dbuser();
			mav.addObject("userlist", userlist);
			
			return mav;
		}
		
		//관리자 페이지 ajax
		public HashMap<String, Object> noset_view_userlist() {//유저리스트
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ArrayList<DamoDTO> userlist = dao.dbuser();

			map.put("userlist", userlist);
			
			return map;
		}
		

		public HashMap<String, Object> notifylist() {//신고 리스트
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ArrayList<DamoDTO> notifylist = dao.dbnotify();

			map.put("notifylist", notifylist);
			
			return map;
		}


		public HashMap<String, Object> blacklist() {//블랙 리스트
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ArrayList<DamoDTO> blacklist = dao.dbblack();

			map.put("blacklist", blacklist);
			
			return map;
		}
















	
}
