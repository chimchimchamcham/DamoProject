package com.dumveloper.damo.diary.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dumveloper.damo.diary.dao.CalendarDAO;
import com.dumveloper.damo.dto.DamoDTO;

@Service
public class CalendarService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	CalendarDAO dao;
	
	public ModelAndView list(String id) {
		LocalDate now = LocalDate.now();
		logger.info("오늘 날짜 출력:{}", now);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM");
		String formatedNow = now.format(format);
		logger.info("오늘 날짜 기준 달 출력 : {}", formatedNow);

		ModelAndView mav = new ModelAndView();

		if (id != null) {
			ArrayList<DamoDTO> list = dao.list(id);
			logger.info("작성 일기 갯수 : {}", list.size());

			ArrayList<String> monthData = getMonthData(id, formatedNow);

			DamoDTO weightData = dao.getWeight(id);
			int tarWeight = weightData.getU_tarWeight();
			int weight = weightData.getU_weight();

			mav.addObject("list", list);
			mav.addObject("monthTarExe", monthData.get(0));
			mav.addObject("monthTarKcal", monthData.get(1));
			mav.addObject("monthContent", monthData.get(2));
			mav.addObject("weight", weight);
			mav.addObject("tarWeight", tarWeight);

		}

		mav.setViewName("diary/calendar");
		return mav;
	}

	// 달 변경시 Ajax로 한달 목표 섭취, 운동 칼로리 와 목표 던져주는 메서드
	public HashMap<String, String> getMonthDByAjax(String id, String formattedDate) {
		logger.info("요청한 달:{}", formattedDate);
		HashMap<String, String> map = new HashMap<String, String>();
		ArrayList<String> list = getMonthData(id, formattedDate);

		// map에 담아주기
		map.put("monthTarExe", list.get(0));
		map.put("monthTarKcal", list.get(1));
		map.put("monthContent", list.get(2));

		;
		return map;
	}

	// 한달 목표 섭취, 운동 칼로리 와 목표 가져오는 메서드
	public ArrayList<String> getMonthData(String id, String formattedDate) {
		ArrayList<String> list = new ArrayList<String>();
		DamoDTO dto = dao.getMonthData(id, formattedDate);

		// 월 데이터가 없는 경우
		String tarExe = "";
		String tarKcal = "";
		String content = "";

		if (dto != null) {
			tarExe = Integer.toString(dto.getC_tarExe());
			tarKcal = Integer.toString(dto.getC_tarKcal());
			content = dto.getC_content();
		}

		logger.info("운동 칼로리:{}", tarExe);
		logger.info("섭취 칼로리:{}", tarKcal);
		logger.info("한달 목표:{}", content);

		list.add(tarExe);
		list.add(tarKcal);
		list.add(content);

		return list;
	}

	public HashMap<String, Object> updateMD(String monthId, String changeDT, String changeMonth, String id) {

		HashMap<String, Object> map = new HashMap<String, Object>(); // ajax로 보낼 HashMap 생성

		int success = 0; // 실패

		// 업데이트할 칼럼 조회
		if (monthId.equals("tarKcal")) {
			monthId = "C_TARKCAL";
		} else if (monthId.equals("tarExe")) {
			monthId = "C_TAREXE";
		} else if (monthId.equals("goal")) {
			monthId = "C_CONTENT";
		}

		logger.info("업데이트 하려는 컬럼 : {}", monthId);
		logger.info("업데이트 데이터 값 : {}", changeDT);
		logger.info("업데이트 요청 일자 : {}", changeMonth);
		logger.info("업데이트 요청 id :{}", id);

		// 일단 해당 월 데이터가 있는지 조회
		if (dao.getMonthData(id, changeMonth) != null) { // 월 데이터가 있는 경우
			success = dao.updateMD(monthId, changeDT, changeMonth, id);// 업데이트
		} else { // 월 데이터가 없는 경우
			// 일단 초기 데이터 만들기
			if (dao.insertNewMD(id, changeMonth) > 0) {// 초기 데이터 만드는걸 성공한 경우
				success = dao.updateMD(monthId, changeDT, changeMonth, id); // 업데이트
			}
		}
		map.put("sucessYN", success);

		return map;
	}

	public HashMap<String, Object> getMonthEvent(String loginId) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		LocalDate now = LocalDate.now();
		logger.info("오늘 날짜 출력:{}", now);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM");
		String formatedNow = now.format(format);
		logger.info("오늘 날짜 기준 달 출력 : {}", formatedNow);

		if (loginId != null) {
			ArrayList<DamoDTO> list = dao.list(loginId);
			for(int i=0;i<list.size();i++) {
				logger.info("섭취 칼로리 : {}",list.get(i).getD_resultEat());
			}
			

			logger.info("--------------요청 결과------------");
			logger.info("총 갯수 : {}", list.size());
			logger.info("---------------------------------");

			DamoDTO weightData = dao.getWeight(loginId);
			int tarWeight = weightData.getU_tarWeight();
			int weight = weightData.getU_weight();

			ArrayList<String> monthData = getMonthData(loginId, formatedNow);
			
			map.put("monthTarExe", monthData.get(0));
			map.put("monthTarKcal", monthData.get(1));
			map.put("monthContent", monthData.get(2));
			
			map.put("list", list);
			map.put("weight", weight);
			map.put("tarWeight", tarWeight);
		}
		

		/*
		 * String date; String weight; String resultEat; String resultExe; boolean
		 * success;
		 * 
		 * DamoDTO eventDTO = new DamoDTO();//DB에서 가져온 배열에서 하나씩 가져와 담을 DTO
		 * 
		 * ArrayList<Map<String,String>> eventList = new
		 * ArrayList<Map<String,String>>();
		 * 
		 * if(list.size()>0) {
		 * 
		 * for(int i=0;i<list.size();i++) {
		 * 
		 * eventDTO = list.get(i);
		 * 
		 * date = eventDTO.getD_date(); weight =
		 * Integer.toString(eventDTO.getD_weight())+"kg"; resultEat =
		 * Integer.toString(eventDTO.getD_resultEat())+"kcal"; resultExe =
		 * Integer.toString(eventDTO.getD_resultExe())+"kcal"; success =
		 * eventDTO.isD_success();
		 * 
		 * Map<String,String> eatMap= new HashMap<String,String>(); Map<String,String>
		 * exeMap = new HashMap<String,String>(); Map<String,String> weightMap = new
		 * HashMap<String,String>();
		 * 
		 * //섭취 이벤트 eatMap.put("title", resultEat); eatMap.put("start",date);
		 * eatMap.put("backgroundColor", "green"); eatMap.put("borderColor", "green");
		 * 
		 * //운동 이벤트 exeMap.put("title", resultExe); exeMap.put("start",date);
		 * exeMap.put("backgroundColor", "#E7C6B4"); exeMap.put("borderColor",
		 * "#E7C6B4");
		 * 
		 * //몸무게 이벤트 weightMap.put("title", weight); weightMap.put("start", date);
		 * if(success) { weightMap.put("color", "skyblue"); }else {
		 * weightMap.put("color", "pink"); } weightMap.put("display", "background");
		 * 
		 * eventList.add(eatMap); eventList.add(exeMap); eventList.add(weightMap);
		 */

		return map;
	}
}
