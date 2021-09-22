package com.dumveloper.damo.diary.controller;	


import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 public String goDiaryInsert() {
		 logger.info("다이어리 추가 팝업 이동");
		 return "diary/diaryInsertPopUp";
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
	 public @ResponseBody int checkList(@RequestParam int d_no,@RequestParam String content) {
		 logger.info("체크리스트 추가 "+"/"+d_no+"/ 내용 :"+content);
		return service.checkList(d_no,content);
	 }

	 @RequestMapping(value="/searchList/{selectMenu}/{searchInsert}")
	 public @ResponseBody HashMap<String, ArrayList<DamoDTO>> searchList(@PathVariable String selectMenu, @PathVariable String searchInsert){
		 logger.info("검색요청");
		 return service.searchList(selectMenu,searchInsert);
	 }

}
