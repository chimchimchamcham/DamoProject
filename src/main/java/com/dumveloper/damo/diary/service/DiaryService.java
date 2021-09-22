package com.dumveloper.damo.diary.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	public ModelAndView checkDel(String ch_no) {
		int sucess = dao.checkDel(ch_no);
		logger.info("체크리스트 삭제 : "+sucess);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/goDiary");
		return mav;
	}

	public HashMap<String,String> submitList(Map<String, String> param) {
		
		HashMap<String, String> map = new HashMap<String,String>();
		int success = 0;
		DamoDTO dto = new DamoDTO();
		String checker="fail";
		//음식등록
		if(param.get("selectMenu").equals("foodlist")){
			String hd_no = param.get("hd_no");
			String hd_code = param.get("hd_code");
			int hd_eat = Integer.parseInt(param.get("hd_eat"));
			String hd_foodName = param.get("hd_foodname");
			
			int hd_carbo = (int) Double.parseDouble(param.get("hd_carbo"));
			int hd_protein = (int) Double.parseDouble(param.get("hd_protein"));
			int hd_fat = (int) Double.parseDouble(param.get("hd_fat"));
			int hd_kcal = (int) Double.parseDouble(param.get("hd_kcal"));
			
			System.out.println("음식 등록 - 일기번호 : "+hd_no+" / 등록 코드 : "+hd_code+" / 먹은 양 : "+hd_eat+" / 음식 이름 : "+hd_foodName);
			System.out.println("탄수화물량 : "+hd_carbo+" / 단백질량 : "+hd_protein+" / 지방량 : "+hd_fat+" / 열량 : "+hd_kcal);
			
			dto.setHd_no(hd_no);
			dto.setHd_code(hd_code);
			dto.setHd_eat(hd_eat);
			dto.setHd_foodName(hd_foodName);
			
			dto.setHd_carbo(hd_carbo);
			dto.setHd_protein(hd_protein);
			dto.setHd_fat(hd_fat);
			dto.setHd_kcal(hd_kcal);
			
			success = dao.insertEat(dto);
			
		//운동 등록 
		}else if(param.get("selectMenu").equals("met")) {
			String he_no = param.get("he_no");
			int he_time = Integer.parseInt(param.get("he_time"));
			int he_kcal = (int) Double.parseDouble(param.get("he_kcal"));
			String met_name = param.get("met_name");
			
			System.out.println("운동 등록-일기번호 :"+he_no+" / 운동 시간 :"+he_time+" / 운동 소모 칼로리 : "+he_kcal+" / 운동 이름 :"+met_name);
		
			dto.setHe_no(he_no);
			dto.setHe_time(he_time);
			dto.setHe_kcal(he_kcal);
			dto.setMet_name(met_name);
			success = dao.insertExe(dto);
		}
		
		if(success>0) {
			checker = "success";
		}
		
		map.put("success", checker);
		return map;

	}
}
