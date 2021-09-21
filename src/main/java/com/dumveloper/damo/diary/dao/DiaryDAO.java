package com.dumveloper.damo.diary.dao;


import java.util.HashMap;

import com.dumveloper.damo.dto.DamoDTO;

public interface DiaryDAO {

	DamoDTO diaryDetail(String date, String id); //일기 내용 가져오기

	DamoDTO diaryStartData(String date2, String id); //캘린더의 초기값 가져오기

	int diaryInsert(DamoDTO dto);//다이어리 테이블에 컬럼 insert

	int memoUpdate(String d_no, String content); //메모 업데이트

	int weightUpdate(String d_no, String content);  //몸무게 업데이트

	int eatTarKcalUpdate(String d_no, String content); //목표 섭취 칼로리 업데이트 

	int exeTarKcalUpdate(String d_no, String content);//목표 운동 칼로리 업데이트 

}
