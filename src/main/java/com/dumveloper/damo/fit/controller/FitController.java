package com.dumveloper.damo.fit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dumveloper.damo.fit.service.FitService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FitController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FitService fitservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model ,HttpSession session) {

		logger.info("메인 페이지 접속 요청");
		String page= "main";
		
		if(session.getAttribute("loginId") != null) {
			logger.info("캘린더 페이지 접속 요청");
			page= "redirect:/calendar";
		}
		return page;

	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(Model model) {

		logger.info("로그인 안됨!!!");
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		return "/user/login";

	}

	@RequestMapping(value = "/fitMain", method = RequestMethod.GET)
	public String fitMain(Model model) {

		logger.info("지식핏 페이지 접속");
		
		return "fit/fitMain";
	}

	
	@RequestMapping(value = "/bestFitList", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> bestFitList(Model model) {
		logger.info("많이본 지식핏 목록 접속");
		
		return fitservice.bestFitList();
	}
	
	@RequestMapping(value = "/newFitList", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> newFitList(@RequestParam HashMap<String,String> params) {
		logger.info("많이본 지식핏 목록 접속");
		logger.info("cnt"+params.get("cnt"));
		logger.info("category"+params.get("category"));
		
		return fitservice.newFitList(params);
	}

	@RequestMapping(value = "/fitWriteForm", method = RequestMethod.GET)
	public String fitWriteForm(Model model) {

		logger.info("지식핏 글쓰기 폼 접속");
		return "fit/fitWriteForm";
	}
	
	@RequestMapping(value = "/fitWrite", method = RequestMethod.POST)
	public ModelAndView fitWrite(@RequestParam HashMap<String,String> params, 
			MultipartHttpServletRequest mtfRequest, HttpSession session,
			@RequestParam(value="imgNo",required=true) List<String> imgNos,
			RedirectAttributes rAttr) {

		logger.info("지식핏 글쓰기 접속");
		logger.info("params : {}",params);
		logger.info("imgNos : {}",imgNos);
		
		for(int i=1;i<=imgNos.size();i++) {
			System.out.println("i = "+i+" "+imgNos.contains(""+i));
			if(!imgNos.contains(""+i)) {
				continue;
			}
			System.out.println("실행!!");
		}
		
		return fitservice.fitWrite(params,mtfRequest,session,imgNos,rAttr);
	}

	@RequestMapping(value = "/fitUpdateForm", method = RequestMethod.GET)
	public ModelAndView fitUpdateForm(@RequestParam String k_no) {

		logger.info("지식핏 글수정폼 접속");
		logger.info("k_no : {}",k_no);
		
		return fitservice.fitUpdateForm(k_no);
	}
	
	@RequestMapping(value = "/fitUpdate", method = RequestMethod.POST)
	public ModelAndView fitUpdate(@RequestParam HashMap<String,String> params,
			@RequestParam("imgNo") List<String> imgNos,
			@RequestParam("file") List<MultipartFile> files,
			RedirectAttributes rAttr
			) {

		logger.info("지식핏 글수정 접속");
		logger.info("params : {}", params);
		logger.info("imgNos : {}",imgNos);
		logger.info("files : {}",files.size());
		
		return fitservice.fitUpdate(params,imgNos,files,rAttr);
	}
	
	@RequestMapping(value = "/fitDetail", method = RequestMethod.GET)
	public ModelAndView fitDetail(@RequestParam String k_no) {

		logger.info("지식핏 상세보기 접속");
		logger.info("k_no : {}",k_no);
		
		return fitservice.fitDetail(k_no);
	}
	
	@RequestMapping(value = "/fitRanking", method = RequestMethod.GET)
	public ModelAndView fitRanking(HttpSession session) {

		logger.info("지식핏 명예의 전당 접속");
		
		return fitservice.fitRanking(session);
	}
	
	////////////////////////////////////////여기부터/////////////////////////////////////
	
	@RequestMapping(value = "/fitDelete", method = RequestMethod.GET)
	public ModelAndView fitDelete(@RequestParam String k_no, RedirectAttributes rAttr) {

		logger.info("지식핏 글삭제 접속");
		logger.info("k_no : {}", k_no);

		return fitservice.fitDelete(k_no, rAttr);
	}

	@RequestMapping(value = "/fitAnsWrite", method = RequestMethod.POST)
	public ModelAndView fitAnsWrite(@RequestParam HashMap<String, String> params, String k_no,
			MultipartHttpServletRequest mtfRequest, HttpSession session,
			@RequestParam(value = "imgNo", required = true) List<String> imgNos, RedirectAttributes rAttr) {

		logger.info("지식핏 답변쓰기 접속");
		logger.info("params : {}", params);
		logger.info("imgNos : {}", imgNos);
		logger.info("k_no : {}", k_no);
		
		for (int i = 1; i <= imgNos.size(); i++) {
			System.out.println("i = " + i + " " + imgNos.contains("" + i));
			if (!imgNos.contains("" + i)) {
				continue;
			}
			System.out.println("실행!!");
		}

		return fitservice.fitAnsWrite(k_no, params, mtfRequest, session, imgNos, rAttr);
	}
	
	@RequestMapping(value = "/fitAnsDel", method = RequestMethod.GET)
	public ModelAndView fitAnsDel(@RequestParam String kr_no, @RequestParam String k_no) {

		logger.info("지식핏 답변삭제 접속");
		logger.info("k_no : {}", k_no);
		logger.info("kr_no : {}", kr_no);

		return fitservice.fitAnsDel(k_no,kr_no);
	
	}
	
	@RequestMapping(value = "/fitAnsUpdate", method = RequestMethod.POST)
	public ModelAndView fitAnsUpdate(@RequestParam HashMap<String, String> params,
			@RequestParam("imgNo") List<String> imgNos, @RequestParam("file") List<MultipartFile> files,
			RedirectAttributes rAttr) {

		logger.info("지식핏 글수정 접속");
		logger.info("params : {}", params);
		logger.info("imgNos : {}", imgNos);
		logger.info("files : {}", files.size());

		return fitservice.fitAnsUpdate(params, imgNos, files, rAttr);
	}

	@RequestMapping(value = "/chooseFitAns", method = RequestMethod.GET)
	public ModelAndView chooseFitAns(@RequestParam String kr_no, @RequestParam String k_no) {

		logger.info("지식핏 답변채택 접속");
		logger.info("k_no : {}", k_no);
		logger.info("kr_no : {}", kr_no);

		return fitservice.chooseFitAns(k_no,kr_no);
	
	}
	
	@RequestMapping(value = "/chkDir", method = RequestMethod.GET)
	public @ResponseBody String chkDir(@RequestParam String k_no, @RequestParam String u_id) {

		logger.info("지식핏 사전확인 접속");
		logger.info("k_no : {}", k_no);
		logger.info("u_id : {}", u_id);

		return fitservice.chkDir(k_no,u_id);		
	}
	
	@RequestMapping(value = "/addDir", method = RequestMethod.GET)
	public @ResponseBody String addDir(@RequestParam String k_no, @RequestParam String u_id) {

		logger.info("지식핏 사전추가 접속");
		logger.info("k_no : {}", k_no);		

		return fitservice.addDir(k_no,u_id);	
	}
	
	//검색
	@RequestMapping(value = "/search")
	public ModelAndView search(@RequestParam String content) {
		
		logger.info("지식핏 검색 접속");
		logger.info("content: {}", content);		
		if(content != null) {
		int start = 1;
		int end = 3;
		return fitservice.serchlist(content,start,end);	
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("maincontent","검색결과가 없습니다");
		mav.setViewName("./fit/search");
		
		return mav;
	}
		
	
	@RequestMapping(value = "/delDir", method = RequestMethod.GET)
	public @ResponseBody String delDir(@RequestParam String k_no, @RequestParam String u_id) {

		logger.info("지식핏 사전제거 접속");
		logger.info("k_no : {}", k_no);		

		return fitservice.delDir(k_no,u_id);	
	}
	
	@RequestMapping(value = "/fitNotify", method = RequestMethod.GET)
	public @ResponseBody String fitNotify(@RequestParam HashMap<String, String> params) {

		logger.info("지식핏 신고등록 접속");
		logger.info("parmas : {}", params);		

		return fitservice.fitNotify(params);
	}
}
