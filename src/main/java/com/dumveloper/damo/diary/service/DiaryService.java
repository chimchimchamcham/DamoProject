package com.dumveloper.damo.diary.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.CDATASection;

import com.dumveloper.damo.diary.dao.DiaryDAO;
import com.dumveloper.damo.dto.DamoDTO;

@Service
public class DiaryService {

	@Autowired
	DiaryDAO dao;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Transactional
	public HashMap<String, Object> diaryDetail(String date, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("일기 상세보기" + date + "/" + id);

		// 일기 값 불러오기
		DamoDTO dto = dao.diaryDetail(date, id); //diary테이블 값 가져옴
		ArrayList<DamoDTO> ch_noList = dao.checklistDetail(date, id); //checklist 테이블 값 가져옴
		ArrayList<DamoDTO> hisDailyList = dao.hisDailyList(date, id); //섭취 히스토리 테이블 값 가져옴
		/* ArrayList<HashMap<String, Object>> totalKcal = dao.totalKcal(date, id); */ //c_dode별 칼로리 합산
		logger.info("dto : {}" + dto + "/ date : " + date + "/ id: " + id);

		// diary 테이블에 값이 없을 경우(캘린더 값 가져오고 diary에 인서트)
		if (dto == null) {
			String date2 = date.substring(0, date.lastIndexOf("-"));
			dto = dao.diaryStartData(date2, id);
			dto.setD_weight(dto.getU_weight());
			dto.setD_tarExe(dto.getC_tarExe());
			dto.setD_tarKcal(dto.getC_tarKcal());

			logger.info("초기 값 dto: {}" + dto + "date" + dto.getC_date() + "/ 몸무게 : " + dto.getU_weight());

			// 권장 탄단지 계산 (밸런스)
			int StandardWeight = (int) ((dto.getU_height() - 100) * 0.9);// 표준체중
			int Kcal = StandardWeight * 30;// 권장섭취 칼로리
			logger.info("표준 체중 : " + StandardWeight + " / 권장 섭취 칼로리 : " + Kcal);

			int carbo = Kcal / 2; // 권장 탄수화물
			int protein = Kcal / 1; // 권장 단백질
			int fat = Kcal / 1; // 권장 지방
			logger.info("권장 탄수화물 : " + carbo + " / 권장 단백질 : " + protein + "/ 권장 지방 : " + fat);

			dto.setD_date(date);
			dto.setD_carbo(carbo);
			dto.setD_protein(protein);
			dto.setD_fat(fat);

			int success = dao.diaryInsert(dto);
			logger.info("일기 insert 성공 여부 : " + success);
		}

		map.put("dto", dto);
		map.put("ch_noList", ch_noList);
		map.put("hisDailyList", hisDailyList);
		return map;
	}

	public int memoUpdate(String d_no, String content) {
		int success = dao.memoUpdate(d_no, content);
		logger.info("메모 업데이트 성공 : " + success);
		return success;
	}

	public int weightUpdate(String d_no, String content) {
		int success = dao.weightUpdate(d_no, content);
		logger.info("몸무게 업데이트 성공 : " + success);
		return success;
	}

	public int eatTarKcalUpdate(String d_no, String content) {
		int success = dao.eatTarKcalUpdate(d_no, content);
		logger.info("목표 섭취 칼로리 업데이트 성공 : " + success);
		return success;
	}

	public int exeTarKcalUpdate(String d_no, String content) {
		int success = dao.exeTarKcalUpdate(d_no, content);
		logger.info("목표 운동 칼로리 업데이트 성공 : " + success);
		return success;
	}

	public HashMap<String, ArrayList<DamoDTO>> searchList(String selectMenu, String searchInsert, String id) {
		HashMap<String, ArrayList<DamoDTO>> map = new HashMap<String, ArrayList<DamoDTO>>();
		ArrayList<DamoDTO> list = new ArrayList<DamoDTO>();
		logger.info("테이블 명 : {}, 검색 내용:{}", selectMenu, searchInsert);
		if (selectMenu.equals("foodlist")) {// 음식 검색
			list = dao.searchFood(searchInsert);
		} else if (selectMenu.equals("met")) {// 운동 검색
			list = dao.searchExe(searchInsert);
		}
		logger.info("검색결과수:{}", list.size());
		map.put("resultList", list);
		return map;
	}

	public HashMap<String, Object> checkList(int d_no, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		DamoDTO dto = new DamoDTO();
		dto.setCd_no(d_no);
		dto.setCd_content(content);
		if(dao.checkList(dto)>0) {	
			map.put("dto", dto);
			logger.info("no check : "+dto.getCh_no());
		}
		return map;
	}

	public int checkDel(String ch_no) {
		int sucess = dao.checkDel(ch_no);
		logger.info("체크리스트 삭제 : "+sucess);
		return sucess;
	}

	public int checkYN(String ch_no, String checkYN) {
		int sucess = dao.checkYN(ch_no,checkYN);
		logger.info("체크리스트 체크 여부 변경 : "+sucess);
		return sucess;
	}
}
