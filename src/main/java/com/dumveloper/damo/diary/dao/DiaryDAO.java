package com.dumveloper.damo.diary.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.dumveloper.damo.dto.DamoDTO;

public interface DiaryDAO {

	DamoDTO diaryDetail(String date, String id); //일기 내용 가져오기

	DamoDTO diaryStartData(String date2, String id); //캘린더의 초기값 가져오기

	int diaryInsert(DamoDTO dto);//다이어리 테이블에 컬럼 insert

	int memoUpdate(String d_no, String content); //메모 업데이트

	int d_weightUpdate(String d_no, String content);  //몸무게 업데이트

	int eatTarKcalUpdate(String d_no, String content); //목표 섭취 칼로리 업데이트 

	int exeTarKcalUpdate(String d_no, String content);//목표 운동 칼로리 업데이트 

	ArrayList<DamoDTO> searchFood(String searchInsert); //음식 검색 결과

	ArrayList<DamoDTO> searchExe(String searchInsert);//운동 검색 결과

	int checkList(DamoDTO dto); //체크리스트 추가

	ArrayList<DamoDTO> checklistDetail(String date, String id);//체크리스트 목록 뿌리기

	int checkDel(String ch_no); //체크리스트 삭제


	int insertExe(DamoDTO dto);//운동 추가

	int insertEat(DamoDTO dto);//음식 추가 

	DamoDTO checkHisDaily(DamoDTO dto);//이미 추가한 섭취 이력이 있는지 조회

	int updateHisDaily(DamoDTO dto);//섭취 이력 업데이트

	DamoDTO checkHisExe(DamoDTO dto); //이미 추가한 운동 이력이 있는지 조회

	int updateHisExe(DamoDTO dto); //운동 이력 업데이트

	DamoDTO searchDiary(int d_no); //일기 조회

	int updateDiaryEat(DamoDTO dto); //섭취합계 변경

	int updateDiaryExe(DamoDTO dto); //운동합계 변경
	
	

	int checkYN(String ch_no, String checkYN); //체크리스트 체크 여부 변경

	ArrayList<DamoDTO> hisDailyList(String date, String id); //섭취 히스토리 가져오기

	ArrayList<DamoDTO> hisExerciseList(String date, String id);//운동 히스토리 가져오기

	int EatDel(String hd_no, String hd_code, String hd_foodName); //음식 삭제

	int ExeDel(String he_no, String met_name); //운동 삭제

	DamoDTO calculateResult(String date, String id);//히스토리 테이블 총 값 계산

	int resultUpdate(DamoDTO dto);//계산된 값 업데이트

	int getU_height(String id); //키 가져오기

	Date getDate(String d_no, String loginId); //해당 일기 날짜 가져오기

	int u_weightUpdate(String content, String loginId); //u_weight업데이트

	ArrayList<String> diaryPhotoList(int d_no);

	int selectD_no(HashMap<String, String> param);

	int diaryPhotoUpload(String d_no, String newFileName);

	int diaryPhotoDelete(HashMap<String, String> param);

	/* ArrayList<HashMap<String, Object>> totalKcal(String date, String id); */  //c_dode별 칼로리 합산



}
