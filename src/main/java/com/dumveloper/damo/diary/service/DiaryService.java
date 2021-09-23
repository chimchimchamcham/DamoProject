package com.dumveloper.damo.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		ArrayList<DamoDTO> hisExerciseList = dao.hisExerciseList(date, id); //운동 히스토리 테이블 값 가져옴
		
		/* ArrayList<HashMap<String, Object>> totalKcal = dao.totalKcal(date, id); */  //c_dode별 칼로리 합산
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
		map.put("hisExerciseList", hisExerciseList);
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
		
		searchInsert=searchInsert.replaceAll(" ", "");
		logger.info("공백 제거 : {}",searchInsert);
		
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
	
	@Transactional
	public HashMap<String,String> submitList(Map<String, String> param) {
		
		HashMap<String, String> map = new HashMap<String,String>();
		int success = 0;
		
		DamoDTO dto = new DamoDTO(); //추가할 거 담을 DTO
		
		String checker="fail";
		boolean HisDailyYN = true;
		String searchResult ="";
		
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
			
			//일단 등록할 음식이 이미 있는지 확인
			searchResult =  checkHisDaily(dto,HisDailyYN);
			
			if(searchResult.equals("none")){//전에 섭취한 기록이 없는 경우 - 항목 insert
				success = dao.insertEat(dto);
				logger.info("섭취한 기록 x (항목 insert)");
			}else if(searchResult.equals("exist_update_success")) { //전에 섭취한 기록이 있는 경우 - 항목 업데이트
				success = 1;
				logger.info("섭취한 기록 o (항목 update)");
			}else if(searchResult.equals("exist_update_fail")) { //항목 업데이트 실패했을 경우
				success =0;
			}
			
		//운동 등록 
		}else if(param.get("selectMenu").equals("met")) {
			HisDailyYN = false;
			String he_no = param.get("he_no");
			int he_time = Integer.parseInt(param.get("he_time"));
			int he_kcal = (int) Double.parseDouble(param.get("he_kcal"));
			String met_name = param.get("met_name");
			
			System.out.println("운동 등록-일기번호 :"+he_no+" / 운동 시간 :"+he_time+" / 운동 소모 칼로리 : "+he_kcal+" / 운동 이름 :"+met_name);
		
			dto.setHe_no(he_no);
			dto.setHe_time(he_time);
			dto.setHe_kcal(he_kcal);
			dto.setMet_name(met_name);
			searchResult =  checkHisDaily(dto,HisDailyYN);
			if(searchResult.equals("none")){//전에 섭취한 기록이 없는 경우 - 항목 insert
				success += dao.insertExe(dto);
				logger.info("운동한 기록 x (항목 insert)");
			}else if(searchResult.equals("exist_update_success")) { //전에 섭취한 기록이 있는 경우 - 항목 업데이트
				success += 1;
				logger.info("운동한 기록 o (항목 update)");
			}else if(searchResult.equals("exist_update_fail")) { //항목 업데이트 실패했을 경우
				success = 0;
			}
			
		}
		
		if(success>0) {
			logger.info("항목 insert or update 성공");
			logger.info("일기 테이블 update");
			success += updateDiary(dto,HisDailyYN);
		}
		
		if(success>1) {
			logger.info("일기 테이블 update 성공");
			checker="success";
		}
		
		logger.info("일기 추가 등록 성공 여부 : {}",success);
		map.put("success", checker);
		return map;

	}
	
	//섭취, 운동 기록 조회
	public String checkHisDaily(DamoDTO dto,boolean HisDailyYN) {
		
		logger.info("섭취 목록 조회");
		DamoDTO resultDTO = new DamoDTO();
		int success = 0;
		DamoDTO addDTO = new DamoDTO();
		//이전 항목이 존재하지 않을 경우
		String searchResult = "none";
		
		if(HisDailyYN) {//섭취의 경우
			logger.info("--------------------추가 할 것--------------------------");
			logger.info("추가로 섭취한 항목의 음식 이름:{}",dto.getHd_foodName());
			logger.info("추가로 섭취한 항목의 음식양:{}",dto.getHd_eat());
			logger.info("추가로 섭취한 항목의 칼로리양:{}",dto.getHd_kcal());
			logger.info("추가로 섭취한 항목의 탄수화물 양:{}",dto.getHd_carbo());
			logger.info("추가로 섭취한 항목의 단백질 양:{}",dto.getHd_protein());
			logger.info("추가로 섭취한 항목의 지방 양:{}",dto.getHd_fat());
			logger.info("추가로 섭취한 항목의 분류 코드:{}",dto.getHd_code());
			logger.info("추가로 섭취한 항목의 일기 번호:{}",dto.getHd_no());
			logger.info("----------------------------------------------");
			resultDTO = dao.checkHisDaily(dto);//이전 섭취 항목 조회
			
			if(resultDTO != null){ //이전 항목이 존재하는 경우
				logger.info("이전 항목 존재");
				searchResult="exist_update_fail";//이전 항목 존재->업데이트 실패
				
				logger.info("---------------------기존 것-------------------------");
				logger.info("기존에 섭취한 항목의 음식 이름:{}",resultDTO.getHd_foodName());
				logger.info("기존에 섭취한 항목의 음식양:{}",resultDTO.getHd_eat());
				logger.info("기존에 섭취한 항목의 칼로리양:{}",resultDTO.getHd_kcal());
				logger.info("기존에 섭취한 항목의 탄수화물 양:{}",resultDTO.getHd_carbo());
				logger.info("기존에 섭취한 항목의 단백질 양:{}",resultDTO.getHd_protein());
				logger.info("기존에 섭취한 항목의 지방 양:{}",resultDTO.getHd_fat());
				logger.info("기존에 섭취한 항목의 분류 코드:{}",resultDTO.getHd_code());
				logger.info("기존에 섭취한 항목의 일기 번호:{}",resultDTO.getHd_no());
				logger.info("----------------------------------------------");
				
				//추가하려는 값과 더하기
				int addCarbo = dto.getHd_carbo()+resultDTO.getHd_carbo(); //추가할 값 + 기존에 있던 값
				int addProtein = dto.getHd_protein()+resultDTO.getHd_protein();
				int addFat = dto.getHd_fat()+resultDTO.getHd_fat();
				int addKcal = dto.getHd_kcal()+resultDTO.getHd_kcal();
				int addEat = dto.getHd_eat()+resultDTO.getHd_eat();
				
				logger.info("-----------최종합계--------------");
				logger.info("최종 탄수화물 : {}",addCarbo);
				logger.info("최종 단백질 : {}",addProtein);
				logger.info("최종 지방 : {}",addFat);
				logger.info("최종 칼로리 : {}",addKcal);
				logger.info("최종 먹은 량 : {}",addEat);
				logger.info("------------------------------");
				
				addDTO.setHd_carbo(addCarbo);
				addDTO.setHd_protein(addProtein);
				addDTO.setHd_fat(addFat);
				addDTO.setHd_kcal(addKcal);
				
				addDTO.setHd_foodName(dto.getHd_foodName());
				addDTO.setHd_no(dto.getHd_no());
				addDTO.setHd_code(dto.getHd_code());
				addDTO.setHd_eat(addEat);

				success = dao.updateHisDaily(addDTO);
				logger.info("섭취 히스토리 수정 추가 성공 여부 :{}",success);
			}
			
		}else {//운동의 경우
			resultDTO = dao.checkHisExe(dto);//이전 운동 항목 조회
			//추가하려는 값과 더하기
			if(resultDTO !=null) {
				searchResult="exist_update_fail";//이전 항목 존재->업데이트 실패
				int addHetime = resultDTO.getHe_time()+dto.getHe_time();
				int addHeKcal = resultDTO.getHe_kcal()+dto.getHe_kcal();
			
				addDTO.setHe_kcal(addHeKcal);
				addDTO.setHe_time(addHetime);
				addDTO.setHe_no(dto.getHe_no());
				addDTO.setMet_name(dto.getMet_name());
				
				success = dao.updateHisExe(addDTO);
			}
		}
		
		if(success>0) {//이전 항목 존재->업데이트 성공
			searchResult = "exist_update_success";	
		}
		
		logger.info("결과 : {}", searchResult);
		return searchResult;
	}
	
	//일기에서 섭취 칼로리 합계, 운동 칼로리 합계 수정 하는 메서드
	public int updateDiary(DamoDTO dto,boolean HisDailyYN) {
		
		int d_no;
		
		int hd_kcal;
		int hd_carbo;
		int hd_protein;
		int hd_fat;
		
		int he_kcal;
		
		int success;
		
		DamoDTO setDto = new DamoDTO();
		
		//일기에서 섭취 칼로리 합계, 운동 칼로리 합계, 탄단지 가져오기
		if(HisDailyYN) {
			d_no = Integer.parseInt(dto.getHd_no());
		}else {
			d_no = Integer.parseInt(dto.getHe_no());
		}
		logger.info("조회할 일기 번호 : {}",d_no);
		
		DamoDTO getDTO = dao.searchDiary(d_no); //기존 일기에 쓰여진 데이터 가져오기
		
		if(HisDailyYN) {//섭취일 경우
			logger.info("일기 섭취 칼로리 합계, 탄단지 수정"); 
			
			int d_resulteat = getDTO.getD_resultEat();
			int d_resultcarbo = getDTO.getD_resultCarbo();
			int d_resultprotein = getDTO.getD_protein();
			int d_resultfat = getDTO.getD_resultFat();
			
			System.out.println("기존 입력된 섭취 열량 : "+d_resulteat+" / 기존 입력된 섭취 탄수화물 : "+d_resultcarbo);
			System.out.println("기존 입력된 섭취 단백질 : "+d_resultprotein+" / 기존 입력된 섭취 지방 : "+d_resultfat);
			
			hd_kcal = dto.getHd_kcal()+d_resulteat;
			hd_carbo = dto.getHd_carbo()+d_resultcarbo;
			hd_protein = dto.getHd_protein()+d_resultprotein;
			hd_fat = dto.getHd_fat()+d_resultfat;
			
			System.out.println("합친 섭취 데이터 - 칼로리 : "+hd_kcal+" / 단백질 : "+hd_protein+" / 탄수화물 : "+hd_carbo+" / 지방 : "+hd_fat);
			
			setDto.setD_resultEat(hd_kcal);
			setDto.setD_resultCarbo(hd_carbo);
			setDto.setD_resultProtein(hd_protein);
			setDto.setD_resultFat(hd_fat);
			setDto.setD_no(d_no);
			
			success = dao.updateDiaryEat(setDto);
			
		}else {//운동일 경우
			logger.info("운동 칼로리 합계 수정");
			int d_resultexe = getDTO.getD_resultExe();
			he_kcal = dto.getHe_kcal()+d_resultexe;
			
			setDto.setD_resultExe(he_kcal);
			setDto.setD_no(d_no);
			
			success = dao.updateDiaryExe(setDto);
		}
		
		logger.info("일기 기존 항목 업데이트 성공 여부 : {}",success);
		
		return success;
	}
	
}
