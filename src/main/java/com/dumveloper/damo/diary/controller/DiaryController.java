package com.dumveloper.damo.diary.controller;	


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.diary.service.DiaryService;
import com.dumveloper.damo.dto.DamoDTO;

@Controller
public class DiaryController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService service;
	
	 @RequestMapping(value="/goDiary") 
	 public String GoDiary() {
		 logger.info("일기 페이지 요청");
		 return "diary/diary";
	 }
	 
	 @RequestMapping(value="/diaryDetail") 
	 public @ResponseBody HashMap<String, Object> diaryDetail(@RequestParam String date,@RequestParam String id) {
		 logger.info("일기 상세보기"+date+id);
		return service.diaryDetail(date,id);
	 }
	 
	 @RequestMapping(value="/diaryInsert")
	 public ModelAndView goDiaryInsert(@RequestParam String d_no, @RequestParam String u_weight) {
		 logger.info("다이어리 추가 팝업 이동(일기번호 : {} / 사용자 몸무게 : {}",d_no,u_weight);
		 ModelAndView mav = new ModelAndView();
		 
		 mav.addObject("d_no",d_no);
		 mav.addObject("u_weight",u_weight);
		 mav.setViewName("diary/diaryInsertPopUp");
		 
		 return mav;
	 }
	 
	 @RequestMapping(value="/memoUpdate") 
	 public @ResponseBody int memoUpdate(@RequestParam String d_no,@RequestParam String content) {
		 logger.info("메모 업데이트 "+"/"+d_no+"/ 내용:"+content);
		return service.memoUpdate(d_no,content);
	 }
	 
	 @RequestMapping(value="/weightUpdate") 
	 public @ResponseBody int weightUpdate(@RequestParam String d_no,@RequestParam String content) {
		 logger.info("몸무게 업데이트 "+"/"+d_no+"/ 몸무게 :"+content);
		return service.weightUpdate(d_no,content);
	 }
	 
	 @RequestMapping(value="/eatTarKcalUpdate") 
	 public @ResponseBody int eatTarKcalUpdate(@RequestParam String d_no,@RequestParam String content) {
		 logger.info("목표 섭취 칼로리 업데이트 "+"/"+d_no+"/ 칼로리 :"+content);
		return service.eatTarKcalUpdate(d_no,content);
	 }
	 
	 @RequestMapping(value="/exeTarKcalUpdate") 
	 public @ResponseBody int exeTarKcalUpdate(@RequestParam String d_no,@RequestParam String content) {
		 logger.info("목표 운동 칼로리 업데이트 "+"/"+d_no+"/ 칼로리 :"+content);
		return service.exeTarKcalUpdate(d_no,content);
	 }
	 
	 @RequestMapping(value="/checkList") 
	 public @ResponseBody HashMap<String, Object> checkList(@RequestParam int d_no,@RequestParam String content) {
		 logger.info("체크리스트 추가 "+"/"+d_no+"/ 내용 :"+content);
		return service.checkList(d_no,content);
	 }

	 @RequestMapping(value="/searchList/{selectMenu}/{searchInsert}")
	 public @ResponseBody HashMap<String,ArrayList<DamoDTO>> searchList(@PathVariable String selectMenu, @PathVariable String searchInsert,HttpSession session){
		 logger.info("검색요청");
		 String id= (String)session.getAttribute("loginId"); 
		 return service.searchList(selectMenu,searchInsert,id);
	 }
	 
	 @RequestMapping(value="/checkDel")
		public @ResponseBody int checkDel(@RequestParam String ch_no) {
			logger.info("체크리스트 삭제 요청 : "+ch_no);
			return service.checkDel(ch_no);
		}
	 
	 @RequestMapping(value="/checkYN")
		public @ResponseBody int checkYN(@RequestParam String ch_no, @RequestParam String checkYN) {
			logger.info("체크리스트 체크여부 변경 : "+ch_no+"/ "+checkYN);
			return service.checkYN(ch_no,checkYN);
		}

	 @RequestMapping(value="/submitList")
	 public @ResponseBody HashMap<String,String>submitList(@RequestParam Map<String,String> param){
		 logger.info("일기 항목 추가 요청");
		 logger.info("selectMenu:{}",param.get("selectMenu"));
		 service.submitList(param);
		 return null;
	 }
	 
	 @RequestMapping(value="/EatDel")
		public @ResponseBody int EatDel(@RequestParam String hd_no, @RequestParam String hd_code,@RequestParam String hd_foodName) {
			logger.info("음식 삭제 요청 : "+ hd_no+"/ "+hd_code+"/ "+hd_foodName);
			return service.EatDel(hd_no,hd_code,hd_foodName);
		}
	 
	 @RequestMapping(value="/ExeDel")
		public @ResponseBody int ExeDel(@RequestParam String he_no, @RequestParam String met_name) {
			logger.info("운동 삭제 요청 : "+ he_no+"/ "+met_name);
			return service.ExeDel(he_no,met_name);
		}
	
	 @RequestMapping(value="/selectDiaryD_no")
		public @ResponseBody HashMap<String, Object> selectDiaryD_no(@RequestParam HashMap<String,String> param) {
			logger.info("일기 고유번호 요청 ");
			logger.info("param : {} ",param);
			
			return service.selectDiaryD_no(param);
		}
	
	 @RequestMapping(value="/diaryPhotoList")
		public @ResponseBody HashMap<String, Object> diaryPhotoList(@RequestParam HashMap<String,String> param) {
			logger.info("일기 이미지 리스트 요청 ");
			logger.info("param : {} ",param);
			
			return service.diaryPhotoList(param);
		}
	 
	 @RequestMapping(value="/diaryPhotoUpload")
		public @ResponseBody HashMap<String, Object> diaryPhotoUpload(
			@RequestParam String d_no,
			MultipartHttpServletRequest mtf) {
			logger.info("일기 이미지 업로드 요청 ");
			logger.info("d_no : {}",d_no);
			logger.info("mtf fileName : {}",mtf.getFile("photo").getOriginalFilename());
			
			return service.diaryPhotoUpload(d_no,mtf);
		}
	 
	 @RequestMapping(value="/diaryPhotoDelete")
		public @ResponseBody HashMap<String, Object> diaryPhotoDelete(
			@RequestParam HashMap<String,String> param) {
			logger.info("일기 이미지 삭제 요청 ");
			logger.info("param : {}",param);
			
			return service.diaryPhotoDelete(param);
		}
}
