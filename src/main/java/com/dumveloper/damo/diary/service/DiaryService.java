package com.dumveloper.damo.diary.service;


import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dumveloper.damo.diary.dao.DiaryDAO;
import com.dumveloper.damo.dto.DamoDTO;

@Service
public class DiaryService {
	
	@Autowired DiaryDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	public HashMap<String, Object> diaryDetail(String date, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(date+"/"+id);

		//일기 값 불러오기
		DamoDTO dto = dao.diaryDetail(date,id);
		logger.info("dto{} :"+dto+"/"+date+"/"+id);
		
		//diary 테이블에 값이 없을 경우(캘린더 값 가져오기)
		if(dto == null) { 
			String date2 = date.substring(0, date.lastIndexOf("-"));
			dto = dao.diaryStartData(date2, id);
			logger.info("초기 값 dto:"+dto);
		}

		map.put("dto", dto);
		return map;
	}
}
