package com.dumveloper.damo.diary.dao;


import com.dumveloper.damo.dto.DamoDTO;

public interface DiaryDAO {

	DamoDTO diaryDetail(String date, String id); //일기 내용 가져오기

	DamoDTO diaryStartData(String date2, String id); //캘린더의 초기값 가져오기

}
